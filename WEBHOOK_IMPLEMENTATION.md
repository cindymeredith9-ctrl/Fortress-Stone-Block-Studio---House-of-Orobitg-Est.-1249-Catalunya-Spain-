# 🔗 WHOP WEBHOOK IMPLEMENTATION GUIDE

**Webhooks allow Whop to notify your application in real-time when subscription events occur.**

---

## 📡 **WHAT ARE WEBHOOKS?**

When a user:
- ✅ Subscribes to a plan
- ✅ Cancels their subscription
- ✅ Payment succeeds
- ✅ Payment fails
- ✅ Requests a refund

Whop sends an HTTPS POST request to your server with the event data.

---

## 🛠️ **BACKEND SETUP REQUIRED**

**IMPORTANT:** Webhooks require a backend server. Options:

### **Option 1: Node.js/Express Backend**
Create `/api/webhooks/whop.js`:

```javascript
import express from 'express';
import crypto from 'crypto';

const router = express.Router();

// Whop webhook secret from environment variable
const WHOP_WEBHOOK_SECRET = process.env.WHOP_WEBHOOK_SECRET;

// Verify webhook signature
function verifyWebhookSignature(payload, signature) {
  const hmac = crypto.createHmac('sha256', WHOP_WEBHOOK_SECRET);
  const digest = hmac.update(payload).digest('hex');
  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(digest)
  );
}

router.post('/api/webhooks/whop', express.raw({ type: 'application/json' }), async (req, res) => {
  const signature = req.headers['x-whop-signature'];
  const payload = req.body;

  // Verify signature
  if (!verifyWebhookSignature(payload, signature)) {
    console.error('Invalid webhook signature');
    return res.status(401).send('Invalid signature');
  }

  // Parse event
  const event = JSON.parse(payload.toString());
  
  console.log('Received Whop webhook:', event.type);

  try {
    switch (event.type) {
      case 'subscription.created':
        await handleSubscriptionCreated(event.data);
        break;
      
      case 'subscription.updated':
        await handleSubscriptionUpdated(event.data);
        break;
      
      case 'subscription.cancelled':
        await handleSubscriptionCancelled(event.data);
        break;
      
      case 'subscription.expired':
        await handleSubscriptionExpired(event.data);
        break;
      
      case 'payment.succeeded':
        await handlePaymentSucceeded(event.data);
        break;
      
      case 'payment.failed':
        await handlePaymentFailed(event.data);
        break;
      
      case 'refund.created':
        await handleRefundCreated(event.data);
        break;
      
      default:
        console.log('Unhandled event type:', event.type);
    }

    res.status(200).send('Webhook received');
  } catch (error) {
    console.error('Error processing webhook:', error);
    res.status(500).send('Webhook processing failed');
  }
});

// Handler functions
async function handleSubscriptionCreated(data) {
  const { user_id, plan_id, subscription_id, status } = data;
  
  // Update database: user now has active subscription
  await db.users.update(user_id, {
    subscription_plan: plan_id,
    subscription_id: subscription_id,
    subscription_status: status,
    subscription_start_date: new Date(),
  });
  
  // Send welcome email
  await sendEmail({
    to: data.user_email,
    subject: 'Welcome to Fortress Block Studio™!',
    template: 'subscription_welcome',
    data: { plan_name: data.plan_name }
  });
  
  console.log(`Subscription created: ${user_id} -> ${plan_id}`);
}

async function handleSubscriptionUpdated(data) {
  const { user_id, plan_id, subscription_id, status } = data;
  
  // Update database
  await db.users.update(user_id, {
    subscription_plan: plan_id,
    subscription_status: status,
    updated_at: new Date(),
  });
  
  console.log(`Subscription updated: ${user_id} -> ${plan_id}`);
}

async function handleSubscriptionCancelled(data) {
  const { user_id, subscription_id, cancelled_at } = data;
  
  // Update database: subscription cancelled but remains active until period ends
  await db.users.update(user_id, {
    subscription_status: 'cancelled',
    subscription_cancel_date: new Date(cancelled_at),
    subscription_expires_at: data.current_period_end,
  });
  
  // Send cancellation confirmation email
  await sendEmail({
    to: data.user_email,
    subject: 'Subscription Cancellation Confirmed',
    template: 'subscription_cancelled',
    data: { expires_at: data.current_period_end }
  });
  
  console.log(`Subscription cancelled: ${user_id}`);
}

async function handleSubscriptionExpired(data) {
  const { user_id, subscription_id } = data;
  
  // Update database: downgrade to free plan
  await db.users.update(user_id, {
    subscription_plan: 'free',
    subscription_status: 'expired',
    subscription_expired_at: new Date(),
  });
  
  // Send expiration email
  await sendEmail({
    to: data.user_email,
    subject: 'Your Subscription Has Expired',
    template: 'subscription_expired',
    data: {}
  });
  
  console.log(`Subscription expired: ${user_id}`);
}

async function handlePaymentSucceeded(data) {
  const { user_id, amount, currency, invoice_id } = data;
  
  // Log payment
  await db.payments.create({
    user_id: user_id,
    amount: amount,
    currency: currency,
    invoice_id: invoice_id,
    status: 'succeeded',
    created_at: new Date(),
  });
  
  // Send receipt email
  await sendEmail({
    to: data.user_email,
    subject: 'Payment Receipt',
    template: 'payment_receipt',
    data: { amount, currency, invoice_id }
  });
  
  console.log(`Payment succeeded: ${user_id} - $${amount}`);
}

async function handlePaymentFailed(data) {
  const { user_id, error_message } = data;
  
  // Update database: payment failed
  await db.users.update(user_id, {
    payment_status: 'failed',
    payment_error: error_message,
    payment_retry_count: (data.retry_count || 0) + 1,
  });
  
  // Send payment failure email
  await sendEmail({
    to: data.user_email,
    subject: 'Payment Failed - Action Required',
    template: 'payment_failed',
    data: { error_message }
  });
  
  console.log(`Payment failed: ${user_id} - ${error_message}`);
}

async function handleRefundCreated(data) {
  const { user_id, amount, reason, refund_id } = data;
  
  // Log refund
  await db.refunds.create({
    user_id: user_id,
    amount: amount,
    reason: reason,
    refund_id: refund_id,
    status: 'completed',
    created_at: new Date(),
  });
  
  // Send refund confirmation email
  await sendEmail({
    to: data.user_email,
    subject: 'Refund Processed',
    template: 'refund_confirmation',
    data: { amount, refund_id }
  });
  
  console.log(`Refund created: ${user_id} - $${amount}`);
}

export default router;
```

---

### **Option 2: Serverless Functions (Vercel/Netlify)**

Create `/api/webhooks/whop.ts`:

```typescript
import type { VercelRequest, VercelResponse } from '@vercel/node';
import crypto from 'crypto';

const WHOP_WEBHOOK_SECRET = process.env.WHOP_WEBHOOK_SECRET!;

function verifySignature(payload: string, signature: string): boolean {
  const hmac = crypto.createHmac('sha256', WHOP_WEBHOOK_SECRET);
  const digest = hmac.update(payload).digest('hex');
  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(digest)
  );
}

export default async function handler(
  req: VercelRequest,
  res: VercelResponse
) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const signature = req.headers['x-whop-signature'] as string;
  const payload = JSON.stringify(req.body);

  if (!verifySignature(payload, signature)) {
    return res.status(401).json({ error: 'Invalid signature' });
  }

  const event = req.body;
  
  try {
    // Handle event based on type
    switch (event.type) {
      case 'subscription.created':
        // Handle subscription creation
        break;
      case 'subscription.cancelled':
        // Handle cancellation
        break;
      // ... other cases
    }

    res.status(200).json({ received: true });
  } catch (error) {
    console.error('Webhook error:', error);
    res.status(500).json({ error: 'Webhook processing failed' });
  }
}
```

---

## 🔐 **SECURITY BEST PRACTICES**

### **1. Always Verify Signatures**
```javascript
// NEVER trust webhook data without verification!
if (!verifyWebhookSignature(payload, signature)) {
  return res.status(401).send('Invalid signature');
}
```

### **2. Use HTTPS Only**
```
❌ http://yourdomain.com/api/webhooks/whop
✅ https://yourdomain.com/api/webhooks/whop
```

### **3. Implement Idempotency**
```javascript
// Whop may send the same event multiple times
const eventId = event.id;
const alreadyProcessed = await db.processedEvents.exists(eventId);

if (alreadyProcessed) {
  return res.status(200).send('Already processed');
}

await processEvent(event);
await db.processedEvents.create({ event_id: eventId });
```

### **4. Return 200 Quickly**
```javascript
// Acknowledge receipt immediately
res.status(200).send('Webhook received');

// Process asynchronously
processWebhookAsync(event);
```

### **5. Handle Retries**
Whop will retry failed webhooks (non-200 response) up to 5 times with exponential backoff.

---

## 📊 **DATABASE SCHEMA**

**Users Table:**
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  subscription_plan VARCHAR(50) DEFAULT 'free',
  subscription_id VARCHAR(255),
  subscription_status VARCHAR(50),
  subscription_start_date TIMESTAMP,
  subscription_cancel_date TIMESTAMP,
  subscription_expires_at TIMESTAMP,
  payment_status VARCHAR(50),
  payment_error TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

**Payments Table:**
```sql
CREATE TABLE payments (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  amount DECIMAL(10, 2),
  currency VARCHAR(3),
  invoice_id VARCHAR(255),
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
```

**Processed Events Table (Idempotency):**
```sql
CREATE TABLE processed_events (
  event_id VARCHAR(255) PRIMARY KEY,
  processed_at TIMESTAMP DEFAULT NOW()
);
```

**Refunds Table:**
```sql
CREATE TABLE refunds (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  payment_id UUID REFERENCES payments(id),
  amount DECIMAL(10, 2),
  reason TEXT,
  refund_id VARCHAR(255),
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
```

---

## 🧪 **TESTING WEBHOOKS**

### **1. Whop CLI (Recommended)**
```bash
# Install Whop CLI
npm install -g @whop/cli

# Forward webhooks to localhost
whop webhooks listen --forward-to http://localhost:3000/api/webhooks/whop

# Test events will be sent to your local server
```

### **2. Manual Testing**
Use a tool like **Postman** or **curl** to send test webhooks:

```bash
curl -X POST https://yourdomain.com/api/webhooks/whop \
  -H "Content-Type: application/json" \
  -H "x-whop-signature: test_signature" \
  -d '{
    "type": "subscription.created",
    "data": {
      "user_id": "user_123",
      "user_email": "test@example.com",
      "plan_id": "homeowner_plus_monthly",
      "subscription_id": "sub_123",
      "status": "active"
    }
  }'
```

### **3. Whop Dashboard**
Whop provides a webhook testing interface:
1. Go to Settings → Webhooks
2. Click "Send Test Event"
3. Select event type
4. View request/response logs

---

## 📧 **EMAIL NOTIFICATIONS**

Recommended email service: **SendGrid**, **Mailgun**, or **AWS SES**

**Email Templates Needed:**
1. `subscription_welcome` - New subscriber welcome
2. `subscription_cancelled` - Cancellation confirmation
3. `subscription_expired` - Subscription expired notice
4. `payment_receipt` - Payment successful receipt
5. `payment_failed` - Payment failure notice
6. `refund_confirmation` - Refund processed
7. `subscription_upgrade` - Upgrade confirmation
8. `subscription_downgrade` - Downgrade confirmation

---

## 🚨 **ERROR HANDLING**

```javascript
async function handleWebhook(event) {
  try {
    await processEvent(event);
  } catch (error) {
    // Log error
    console.error('Webhook processing error:', error);
    
    // Send alert to admin
    await sendAdminAlert({
      subject: 'Webhook Processing Failed',
      message: `Event ${event.id} failed: ${error.message}`,
      event: event,
    });
    
    // Save failed event for manual review
    await db.failedEvents.create({
      event_id: event.id,
      event_type: event.type,
      error_message: error.message,
      payload: JSON.stringify(event),
      created_at: new Date(),
    });
    
    // Return 500 so Whop retries
    throw error;
  }
}
```

---

## 📝 **LOGGING & MONITORING**

**What to Log:**
- ✅ Every webhook received (event type, user ID)
- ✅ Signature verification results
- ✅ Database updates performed
- ✅ Emails sent
- ✅ Errors encountered

**Monitoring Tools:**
- **Sentry** - Error tracking
- **Datadog** - Performance monitoring
- **LogRocket** - Session replay
- **Papertrail** - Log aggregation

---

## ✅ **WEBHOOK CHECKLIST**

Before going live:

- [ ] Webhook endpoint created (`/api/webhooks/whop`)
- [ ] Signature verification implemented
- [ ] HTTPS enabled (SSL certificate)
- [ ] Database schema created
- [ ] Event handlers implemented for all events
- [ ] Idempotency check implemented
- [ ] Email notifications configured
- [ ] Error handling implemented
- [ ] Logging configured
- [ ] Tested with Whop CLI
- [ ] Tested all subscription flows
- [ ] Monitored for failed webhooks
- [ ] Admin alert system configured

---

## 🎉 **YOU'RE READY!**

With webhooks properly implemented, your app will receive real-time updates about subscription changes, ensuring users always have the correct access level!

---

**© 2026 House of Orobitg. All Rights Reserved.**
