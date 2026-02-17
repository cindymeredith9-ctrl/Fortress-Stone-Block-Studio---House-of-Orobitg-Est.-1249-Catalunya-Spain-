# 🎯 WHOP SETUP INSTRUCTIONS - Fortress Block Studio™

**You already have a Whop account! Here's how to connect it to your app.**

---

## 📋 STEP-BY-STEP SETUP (15 Minutes)

### **Step 1: Log Into Your Whop Dashboard**

1. Go to: **https://whop.com/hub**
2. Log in with your existing credentials
3. Navigate to **"Products"** or **"Create"** in the sidebar

---

### **Step 2: Create Your Products**

You need to create **4 products** (2 plans × 2 billing cycles):

#### **Product 1: Homeowner Plus Monthly**
1. Click **"Create Product"** or **"+ New Product"**
2. Fill in details:
   - **Product Name:** Homeowner Plus Monthly
   - **Price:** $19.00
   - **Billing Cycle:** Monthly (Recurring)
   - **Description:** 
     ```
     Perfect for homeowners planning their dream home with Fortress Block Studio™
     
     ✅ Wall Builder & Calculator
     ✅ Cost Estimator
     ✅ Block Library (21 blocks)
     ✅ Product Reference Guide
     ✅ Color Visualizer (14 colors)
     ✅ Roof & Exterior Designer
     ✅ Interior Finishes & Tiles
     ✅ PDF Export
     ✅ Unlimited Projects
     ```
3. **Save** and **copy the checkout URL** (looks like: `https://whop.com/checkout/plan_xxxxx`)
4. **IMPORTANT:** Save this URL - you'll need it in Step 3!

#### **Product 2: Homeowner Plus Annual**
1. Click **"Create Product"**
2. Fill in details:
   - **Product Name:** Homeowner Plus Annual (Save 16%!)
   - **Price:** $199.00
   - **Billing Cycle:** Annual (Yearly)
   - **Description:** (Same as monthly, but add: **"Save $29/year with annual billing!"**)
3. **Save** and **copy the checkout URL**

#### **Product 3: Builder Pro Monthly**
1. Click **"Create Product"**
2. Fill in details:
   - **Product Name:** Builder Pro Monthly
   - **Price:** $199.00
   - **Billing Cycle:** Monthly (Recurring)
   - **Description:**
     ```
     For professional builders, architects, and contractors
     
     ✅ Everything in Homeowner Plus
     ✅ Multi-Project Management
     ✅ Advanced Cost Breakdown
     ✅ Material Recipes & Formulas
     ✅ Manufacturing Checklists
     ✅ Mold Builder Pack
     ✅ CAD Export Ready Specs
     ✅ Specialty Rooms (Safe Room, Wine Cellar, Storm Shelter)
     ✅ Engineering-Ready Documentation
     ✅ White-Label Export Options
     ✅ Priority Support
     ```
3. **Save** and **copy the checkout URL**

#### **Product 4: Builder Pro Annual**
1. Click **"Create Product"**
2. Fill in details:
   - **Product Name:** Builder Pro Annual (Save 17%!)
   - **Price:** $1,999.00
   - **Billing Cycle:** Annual (Yearly)
   - **Description:** (Same as monthly, but add: **"Save $389/year with annual billing!"**)
3. **Save** and **copy the checkout URL**

---

### **Step 3: Update Your App Code**

Now you have **4 checkout URLs**. Let's add them to your app!

#### **Open this file:** `/src/lib/whop.ts`

#### **Replace lines 17-26 with:**

```typescript
export const WHOP_CHECKOUT_URLS = {
  homeownerPlus: {
    monthly: 'https://whop.com/checkout/plan_PASTE_YOUR_URL_HERE',  // ← Product 1
    annual: 'https://whop.com/checkout/plan_PASTE_YOUR_URL_HERE',   // ← Product 2
  },
  builderPro: {
    monthly: 'https://whop.com/checkout/plan_PASTE_YOUR_URL_HERE',  // ← Product 3
    annual: 'https://whop.com/checkout/plan_PASTE_YOUR_URL_HERE',   // ← Product 4
  },
} as const;
```

#### **Example with real URLs:**
```typescript
export const WHOP_CHECKOUT_URLS = {
  homeownerPlus: {
    monthly: 'https://whop.com/checkout/plan_abc123def456',  // ✅ Real URL
    annual: 'https://whop.com/checkout/plan_ghi789jkl012',   // ✅ Real URL
  },
  builderPro: {
    monthly: 'https://whop.com/checkout/plan_mno345pqr678',  // ✅ Real URL
    annual: 'https://whop.com/checkout/plan_stu901vwx234',   // ✅ Real URL
  },
} as const;
```

#### **Save the file!**

---

### **Step 4: Test Your Integration**

1. **Re-deploy your app** to Vercel (or run locally with `npm run dev`)
2. **Navigate to:** Account → Upgrade Plan
3. **Click any "Subscribe" button**
4. **You should be redirected to your Whop checkout page!**
5. **Complete a test purchase** (you can use Whop's test mode)

---

## 🎯 WHAT HAPPENS AFTER SOMEONE SUBSCRIBES?

### **Automatic Process:**
1. User clicks "Subscribe" in your app
2. Redirected to Whop checkout (your branded page)
3. User enters payment info (Whop handles security)
4. Payment processed (Whop handles everything)
5. User gets instant access confirmation
6. Whop sends receipt email
7. Subscription renews automatically
8. **You get paid!** (Whop deposits to your bank)

### **What You Can Track in Whop Dashboard:**
- ✅ Total revenue
- ✅ Active subscribers
- ✅ Churn rate
- ✅ Individual customer details
- ✅ Subscription management
- ✅ Refunds (if needed)
- ✅ Analytics & reports

---

## 💰 WHOP FEES & PAYOUT SCHEDULE

### **Fees:**
- **Transaction Fee:** 3% + $0.30 per transaction
- **No monthly fees**
- **No setup fees**
- **You only pay when you earn money!**

### **Payout Schedule:**
- Whop pays to your connected bank account
- **Default:** Every 7 days (weekly)
- **Custom:** You can change to monthly in settings
- **Minimum:** $25 balance required for payout

### **Your Earnings:**
```
Homeowner Plus Monthly ($19/mo):
→ You receive: ~$18.13/month per subscriber

Builder Pro Monthly ($199/mo):
→ You receive: ~$192.67/month per subscriber

Example with 100 subscribers:
50 Homeowner × $18.13 = $906.50
50 Builder Pro × $192.67 = $9,633.50
Total Monthly Income: $10,540/month 🎉
```

---

## 🔐 SECURITY & COMPLIANCE

### **What Whop Handles (You Don't Have To):**
- ✅ PCI compliance (credit card security)
- ✅ Payment processing
- ✅ Fraud detection
- ✅ Customer support (payment issues)
- ✅ Subscription management
- ✅ Automatic renewals
- ✅ Failed payment retry
- ✅ Refunds & chargebacks

### **What You Handle:**
- ✅ Your app functionality
- ✅ Customer support (product questions)
- ✅ Content updates
- ✅ Feature development

---

## 🎨 CUSTOMIZING YOUR CHECKOUT PAGE

In Whop Dashboard, you can customize:
- **Branding:** Logo, colors, company name
- **Product Images:** Upload screenshots of your app
- **Description:** Add more details, FAQs
- **Social Proof:** Add testimonials
- **Guarantee:** Add money-back guarantee text

---

## 🆘 TROUBLESHOOTING

### **Problem: "Checkout URL doesn't work"**
**Solution:** 
- Make sure you copied the FULL URL from Whop
- URL should start with `https://whop.com/checkout/plan_`
- Check for extra spaces when pasting

### **Problem: "User subscribed but can't access features"**
**Solution:**
- Currently, your app doesn't verify Whop membership (frontend-only)
- To add verification, you need Whop API integration (advanced)
- For now, use "honor system" - trust that paying users have access

### **Problem: "How do I cancel a subscription?"**
**Solution:**
- In Whop Dashboard → Members → Find user → Manage
- Or: User can cancel themselves via Whop account page

### **Problem: "How do I issue a refund?"**
**Solution:**
- In Whop Dashboard → Transactions → Find payment → Refund
- Whop processes refund immediately

---

## 🚀 ADVANCED: VERIFY MEMBERSHIP (OPTIONAL)

If you want to **verify** that users actually paid before giving access, you need:

1. **Whop API Key** (from Whop Dashboard)
2. **Backend Server** (to securely verify membership)
3. **Protected Routes** (lock features behind paywall)

**This requires:**
- Supabase or similar backend
- Whop SDK integration
- User authentication system

**For now:** Your app works as a **trust-based system** - users are expected to pay before using premium features. You can add verification later!

---

## 📊 RECOMMENDED WHOP SETTINGS

### **Product Settings:**
- ✅ Enable **"Auto-renewal"** (subscribers stay subscribed)
- ✅ Enable **"Free trial"** (optional - 7 days to increase conversions)
- ✅ Enable **"Grace period"** (3 days - if payment fails, don't cancel immediately)
- ✅ Set **"Cancellation policy"** (e.g., "Cancel anytime, no questions asked")

### **Email Settings:**
- ✅ Customize welcome email
- ✅ Customize renewal reminder email
- ✅ Customize failed payment email
- ✅ Add your support email

### **Analytics:**
- ✅ Enable conversion tracking
- ✅ Set up revenue goals
- ✅ Monitor churn rate

---

## ✅ CHECKLIST: IS YOUR WHOP SETUP COMPLETE?

- [ ] Logged into Whop Dashboard
- [ ] Created "Homeowner Plus Monthly" product
- [ ] Created "Homeowner Plus Annual" product
- [ ] Created "Builder Pro Monthly" product
- [ ] Created "Builder Pro Annual" product
- [ ] Copied all 4 checkout URLs
- [ ] Updated `/src/lib/whop.ts` with real URLs
- [ ] Saved the file
- [ ] Re-deployed app to Vercel
- [ ] Tested checkout flow
- [ ] Customized Whop checkout page branding
- [ ] Set up bank account for payouts
- [ ] Configured email notifications

**If all checked:** 🎉 **YOU'RE READY TO ACCEPT PAYMENTS!**

---

## 📞 SUPPORT

### **Whop Support:**
- Help Center: https://whop.com/help
- Discord Community: https://whop.com/discord
- Email: support@whop.com
- Response Time: Usually 1-2 hours

### **Integration Help:**
- Whop API Docs: https://docs.whop.com
- Whop SDK: https://github.com/whopio/whop-sdk

---

## 🎯 NEXT STEPS

After setting up Whop:

1. ✅ Test a real purchase (use your own card)
2. ✅ Verify checkout flow works perfectly
3. ✅ Customize branding in Whop dashboard
4. ✅ Add product screenshots
5. ✅ Set up email notifications
6. ✅ Configure payout schedule
7. ✅ Launch to customers! 🚀

---

**© 2026 House of Orobitg. All Rights Reserved.**

*Your Fortress Block Studio app is now payment-ready!* 💰🏰
