# 🚀 FORTRESS BLOCK STUDIO™ - DEPLOYMENT GUIDE

**© 2026 House of Orobitg. All Rights Reserved.**

---

## 🎯 **DEPLOYMENT OPTIONS**

Choose ONE of these platforms (I recommend **Vercel** for easiest deployment):

### **Option 1: Vercel (RECOMMENDED)** ⭐
- ✅ Fastest deployment (5 minutes)
- ✅ Automatic HTTPS/SSL
- ✅ Built-in CI/CD from GitHub
- ✅ Free tier available
- ✅ Serverless functions for webhooks
- ✅ Perfect for React/Vite apps

### **Option 2: Netlify**
- ✅ Easy deployment
- ✅ Automatic HTTPS/SSL
- ✅ Free tier available
- ✅ Serverless functions

### **Option 3: AWS Amplify**
- ✅ Full AWS integration
- ✅ Scalable infrastructure
- 💰 Pay-as-you-go pricing

### **Option 4: Custom Server (VPS)**
- ✅ Full control
- ⚠️ Requires DevOps knowledge
- 💰 Monthly server costs

---

## 🚀 **VERCEL DEPLOYMENT (STEP-BY-STEP)**

### **Step 1: Create GitHub Repository**

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Fortress Block Studio"

# Create new repository on GitHub:
# Go to https://github.com/new
# Name: fortress-block-studio
# Make it PRIVATE (contains business logic)

# Add remote and push
git remote add origin https://github.com/YOUR_USERNAME/fortress-block-studio.git
git branch -M main
git push -u origin main
```

**IMPORTANT:** Add `.gitignore` to protect secrets:

```gitignore
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/

# Production
build/
dist/

# Environment variables
.env
.env.local
.env.production
.env.development

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Misc
.cache/
.parcel-cache/
```

---

### **Step 2: Sign Up for Vercel**

1. Go to https://vercel.com
2. Click "Sign Up"
3. Choose "Continue with GitHub"
4. Authorize Vercel to access your repositories

---

### **Step 3: Deploy to Vercel**

1. **Click "New Project"**
2. **Import your GitHub repository:**
   - Select "fortress-block-studio"
   - Click "Import"

3. **Configure Build Settings:**
   ```
   Framework Preset: Vite
   Build Command: npm run build
   Output Directory: dist
   Install Command: npm install
   ```

4. **Add Environment Variables** (Click "Environment Variables"):
   ```env
   # Whop API Keys (GET THESE FROM WHOP DASHBOARD)
   VITE_WHOP_API_KEY=whop_xxx_production_key
   VITE_WHOP_WEBHOOK_SECRET=whop_webhook_secret
   
   # Whop Product IDs (CREATE THESE IN WHOP)
   VITE_WHOP_HOMEOWNER_PLUS_MONTHLY=prod_xxxxx
   VITE_WHOP_HOMEOWNER_PLUS_ANNUAL=prod_xxxxx
   VITE_WHOP_BUILDER_PRO_MONTHLY=prod_xxxxx
   VITE_WHOP_BUILDER_PRO_ANNUAL=prod_xxxxx
   VITE_WHOP_FABRICATOR_ENTERPRISE_MONTHLY=prod_xxxxx
   VITE_WHOP_FABRICATOR_ENTERPRISE_ANNUAL=prod_xxxxx
   
   # Application URLs (UPDATE AFTER DEPLOYMENT)
   VITE_APP_URL=https://your-domain.vercel.app
   VITE_PAYMENT_SUCCESS_URL=https://your-domain.vercel.app/payment-success
   VITE_PAYMENT_CANCEL_URL=https://your-domain.vercel.app/payment-cancel
   ```

5. **Click "Deploy"**

**🎉 Your app will be live in 2-3 minutes!**

Your deployment URL will be: `https://fortress-block-studio-xxxxx.vercel.app`

---

### **Step 4: Set Up Custom Domain (OPTIONAL)**

1. **Purchase domain** (recommended):
   - `fortressblockstudio.com`
   - Use: Namecheap, GoDaddy, or Google Domains
   - Cost: ~$12-20/year

2. **Add domain to Vercel:**
   - Go to Vercel Dashboard → Your Project → Settings → Domains
   - Click "Add Domain"
   - Enter: `fortressblockstudio.com`
   - Follow DNS configuration instructions

3. **Configure DNS** (at your domain registrar):
   ```
   Type: A
   Name: @
   Value: 76.76.21.21
   
   Type: CNAME
   Name: www
   Value: cname.vercel-dns.com
   ```

4. **Wait for SSL certificate** (automatic, 5-10 minutes)

**✅ Your app will be live at: `https://fortressblockstudio.com`**

---

## 🔗 **WEBHOOK DEPLOYMENT (REQUIRED FOR PAYMENTS)**

Webhooks need a backend endpoint. Here are 3 options:

### **Option 1: Vercel Serverless Function (EASIEST)**

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

  // Verify signature
  if (!verifySignature(payload, signature)) {
    console.error('Invalid signature');
    return res.status(401).json({ error: 'Invalid signature' });
  }

  const event = req.body;
  
  console.log('Webhook received:', event.type);

  try {
    // Handle different event types
    switch (event.type) {
      case 'subscription.created':
        console.log('New subscription:', event.data.user_id);
        // TODO: Update database with user subscription
        break;
      
      case 'subscription.cancelled':
        console.log('Subscription cancelled:', event.data.user_id);
        // TODO: Update database
        break;
      
      case 'payment.succeeded':
        console.log('Payment succeeded:', event.data.amount);
        // TODO: Log payment
        break;
      
      case 'payment.failed':
        console.log('Payment failed:', event.data.user_id);
        // TODO: Send notification
        break;
      
      default:
        console.log('Unhandled event:', event.type);
    }

    return res.status(200).json({ received: true });
  } catch (error) {
    console.error('Webhook error:', error);
    return res.status(500).json({ error: 'Processing failed' });
  }
}
```

**Deploy webhook:**
```bash
# Add file to git
git add api/webhooks/whop.ts

# Commit and push
git commit -m "Add webhook endpoint"
git push

# Vercel will auto-deploy
```

**Your webhook URL:** `https://fortressblockstudio.com/api/webhooks/whop`

---

### **Option 2: Separate Node.js Server**

If you need a full backend:

```bash
# Create new directory
mkdir fortress-backend
cd fortress-backend

# Initialize Node.js project
npm init -y

# Install dependencies
npm install express body-parser crypto dotenv

# Create server
touch server.js
```

`server.js`:
```javascript
const express = require('express');
const bodyParser = require('body-parser');
const crypto = require('crypto');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(bodyParser.json());

// Webhook endpoint
app.post('/api/webhooks/whop', (req, res) => {
  const signature = req.headers['x-whop-signature'];
  const payload = JSON.stringify(req.body);
  
  // Verify signature
  const hmac = crypto.createHmac('sha256', process.env.WHOP_WEBHOOK_SECRET);
  const digest = hmac.update(payload).digest('hex');
  
  if (!crypto.timingSafeEqual(Buffer.from(signature), Buffer.from(digest))) {
    return res.status(401).send('Invalid signature');
  }
  
  const event = req.body;
  console.log('Webhook:', event.type);
  
  // Handle event
  // ...
  
  res.status(200).send('OK');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

Deploy to **Railway**, **Render**, or **Heroku**.

---

## 📊 **DATABASE SETUP (OPTIONAL)**

If you need to store user data, subscriptions, etc.:

### **Option 1: Supabase (Recommended)**
- Free tier: 500MB database
- PostgreSQL database
- Authentication built-in
- Real-time subscriptions

**Setup:**
1. Go to https://supabase.com
2. Create new project
3. Get connection string
4. Create tables:

```sql
-- Users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  subscription_plan VARCHAR(50) DEFAULT 'free',
  subscription_id VARCHAR(255),
  subscription_status VARCHAR(50),
  whop_user_id VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Payments table
CREATE TABLE payments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id),
  amount DECIMAL(10,2),
  currency VARCHAR(3),
  status VARCHAR(50),
  whop_payment_id VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Projects table
CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id),
  name VARCHAR(255),
  data JSONB,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### **Option 2: Firebase**
- NoSQL database
- Real-time sync
- Free tier available

### **Option 3: MongoDB Atlas**
- Cloud MongoDB
- Free tier: 512MB

---

## 🔐 **SECURITY CHECKLIST**

Before going live:

- [ ] All API keys in environment variables (NOT in code)
- [ ] `.env` file in `.gitignore`
- [ ] HTTPS enabled (automatic with Vercel)
- [ ] Webhook signature verification enabled
- [ ] Rate limiting on API endpoints
- [ ] CORS configured properly
- [ ] Input validation on all forms
- [ ] XSS protection enabled
- [ ] SQL injection prevention (if using database)
- [ ] Content Security Policy headers

---

## 📧 **EMAIL SERVICE SETUP**

For sending emails (receipts, welcome emails, etc.):

### **Option 1: SendGrid (Recommended)**
```bash
npm install @sendgrid/mail
```

```javascript
const sgMail = require('@sendgrid/mail');
sgMail.setApiKey(process.env.SENDGRID_API_KEY);

const msg = {
  to: 'customer@example.com',
  from: 'support@fortressblockstudio.com',
  subject: 'Welcome to Fortress Block Studio!',
  text: 'Thank you for subscribing!',
  html: '<strong>Thank you for subscribing!</strong>',
};

await sgMail.send(msg);
```

**Cost:** Free tier - 100 emails/day

### **Option 2: Mailgun**
- Free tier: 5,000 emails/month

### **Option 3: AWS SES**
- Very cheap: $0.10 per 1,000 emails

---

## 📈 **ANALYTICS & MONITORING**

### **1. Error Tracking: Sentry**
```bash
npm install @sentry/react @sentry/vite-plugin
```

```typescript
// src/main.tsx
import * as Sentry from "@sentry/react";

Sentry.init({
  dsn: "https://your-sentry-dsn@sentry.io",
  integrations: [new Sentry.BrowserTracing()],
  tracesSampleRate: 1.0,
});
```

### **2. Analytics: Google Analytics 4**
```bash
npm install react-ga4
```

### **3. Uptime Monitoring: UptimeRobot**
- Free tier: 50 monitors
- Check every 5 minutes
- Email alerts on downtime

---

## 🧪 **POST-DEPLOYMENT TESTING**

After deployment, test EVERYTHING:

### **1. Core Functionality**
- [ ] App loads on all browsers (Chrome, Safari, Firefox, Edge)
- [ ] Mobile responsive design works
- [ ] All navigation works
- [ ] Forms submit correctly
- [ ] PDF exports work
- [ ] All features accessible

### **2. Payment Flow (USE TEST MODE)**
- [ ] Subscription pages load
- [ ] Whop checkout opens
- [ ] Test payment succeeds
- [ ] User redirected to success page
- [ ] Webhook received and processed
- [ ] Email sent to user
- [ ] User access granted

### **3. Legal Compliance**
- [ ] Terms of Service loads
- [ ] Privacy Policy loads
- [ ] Refund Policy accessible
- [ ] Cookie consent (if using analytics)

### **4. Performance**
- [ ] Page load time < 3 seconds
- [ ] Images optimized
- [ ] No console errors
- [ ] Lighthouse score > 90

---

## 🚨 **EMERGENCY CONTACTS & SUPPORT**

Set up these before launch:

### **1. Support Email**
- Create: `support@fortressblockstudio.com`
- Set up auto-reply with response time
- Forward to your personal email

### **2. Legal Email**
- Create: `legal@fortressblockstudio.com`
- For TOS/Privacy questions

### **3. Business Email**
- Create: `info@fortressblockstudio.com`
- General inquiries

### **4. Status Page**
- Optional: Create status.fortressblockstudio.com
- Show uptime, incidents, maintenance

---

## 💰 **PAYMENT PROCESSOR SETUP (WHOP)**

### **Step 1: Create Whop Account**
1. Go to https://whop.com
2. Sign up with business email
3. Complete business verification:
   - Business name: House of Orobitg
   - Business type: LLC/Corporation
   - Tax ID (EIN)
   - Bank account details

### **Step 2: Create Products**

Create 6 products in Whop dashboard:

**1. Homeowner Plus Monthly**
- Price: $29.00/month
- Billing: Monthly recurring
- Trial: 7-day money-back guarantee
- Features: Unlimited projects, PDF export, cost estimation

**2. Homeowner Plus Annual**
- Price: $290.00/year
- Billing: Annual recurring
- Save: 2 months free ($58 savings)

**3. Builder Pro Monthly**
- Price: $199.00/month
- Billing: Monthly recurring
- Features: Everything in Homeowner Plus + CAD export, contractor tools

**4. Builder Pro Annual**
- Price: $1,990.00/year
- Save: 2 months free ($398 savings)

**5. Fabricator Enterprise Monthly**
- Price: $499.00/month
- Features: Everything + manufacturing tools, mold builder

**6. Fabricator Enterprise Annual**
- Price: $4,990.00/year
- Save: 2 months free ($998 savings)

### **Step 3: Get API Keys**
1. Go to Settings → API Keys
2. Copy **Production API Key**
3. Copy **Webhook Secret**
4. Add to Vercel environment variables

### **Step 4: Configure Webhooks**
1. Go to Settings → Webhooks
2. Add webhook URL: `https://fortressblockstudio.com/api/webhooks/whop`
3. Enable events:
   - subscription.created
   - subscription.updated
   - subscription.cancelled
   - payment.succeeded
   - payment.failed
   - refund.created

### **Step 5: Test Payments**
1. Switch to TEST MODE
2. Use test card: `4242 4242 4242 4242`
3. Complete test purchase
4. Verify webhook received
5. Check user access granted

### **Step 6: Go LIVE**
1. Switch to PRODUCTION MODE
2. Update API keys in Vercel
3. Redeploy application
4. Test ONE real payment ($1 test)
5. Verify everything works
6. Refund test payment
7. **YOU'RE LIVE!** 🎉

---

## 📝 **FINAL PRE-LAUNCH CHECKLIST**

### **Legal (CRITICAL - DO NOT SKIP)**
- [ ] Terms of Service reviewed by lawyer ⚖️
- [ ] Privacy Policy reviewed by lawyer ⚖️
- [ ] Business entity formed (LLC/Corp)
- [ ] Business insurance purchased (E&O, general liability)
- [ ] Trademark applications filed
- [ ] Patent application filed (if not already done)

### **Business**
- [ ] Business bank account opened
- [ ] Business email addresses created
- [ ] Accounting software set up (QuickBooks, etc.)
- [ ] Sales tax nexus determined
- [ ] Payment processor (Whop) connected
- [ ] Refund policy documented

### **Technical**
- [ ] App deployed to production
- [ ] Custom domain configured (optional)
- [ ] HTTPS/SSL enabled
- [ ] Environment variables set
- [ ] Webhook endpoint deployed and tested
- [ ] Database set up (if using)
- [ ] Email service configured
- [ ] Error monitoring enabled (Sentry)
- [ ] Analytics enabled (Google Analytics)
- [ ] Uptime monitoring enabled

### **Testing**
- [ ] All features tested in production
- [ ] Payment flow tested end-to-end
- [ ] Mobile responsive verified
- [ ] Cross-browser testing complete
- [ ] Performance optimized (Lighthouse > 90)
- [ ] No console errors
- [ ] All links work
- [ ] Legal pages accessible

### **Marketing**
- [ ] Landing page created
- [ ] Pricing page live
- [ ] Demo video created
- [ ] Social media accounts created
- [ ] Email templates created
- [ ] Press release prepared
- [ ] Launch announcement ready

---

## 🎉 **LAUNCH DAY SEQUENCE**

### **T-1 Week**
- [ ] Final legal review
- [ ] Final testing
- [ ] Notify beta testers
- [ ] Prepare launch announcement

### **T-1 Day**
- [ ] Deploy final version
- [ ] Double-check all environment variables
- [ ] Verify payment processing
- [ ] Set up monitoring alerts
- [ ] Prepare support responses

### **Launch Day**
1. **9:00 AM** - Final smoke tests
2. **10:00 AM** - Switch Whop to PRODUCTION mode
3. **10:30 AM** - Send launch announcement email
4. **11:00 AM** - Post on social media
5. **12:00 PM** - Monitor for issues
6. **5:00 PM** - Check analytics, celebrate! 🎊

### **T+1 Week**
- [ ] Monitor error rates
- [ ] Respond to support tickets
- [ ] Collect user feedback
- [ ] Fix critical bugs
- [ ] Plan first update

---

## 📞 **SUPPORT RESOURCES**

**Vercel:**
- Docs: https://vercel.com/docs
- Support: https://vercel.com/support

**Whop:**
- Docs: https://docs.whop.com
- Support: support@whop.com

**Legal:**
- LegalZoom: https://legalzoom.com
- Rocket Lawyer: https://rocketlawyer.com

**Emergency Help:**
- Me: support@fortressblockstudio.com (set this up!)

---

## 🚀 **YOU'RE READY TO DEPLOY!**

Follow this guide step-by-step and you'll be live in production in a few hours!

**Questions?** Re-read the relevant section or ask for help!

---

**© 2026 House of Orobitg. All Rights Reserved.**
**FORTRESS BLOCK STUDIO™**
