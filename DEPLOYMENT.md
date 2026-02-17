# 🚀 Fortress Block Studio - Deployment Guide

## ✅ What We Did

Your app now uses **Whop** for payments instead of Stripe! This means:
- ✅ No backend server needed
- ✅ No Stripe account required
- ✅ Whop handles all payments, subscriptions, and customer management
- ✅ Ready to deploy to Vercel for FREE

---

## 📦 Deploy to Vercel (FREE Hosting)

### Step 1: Get Your App Files

You're already in Figma Make, so you can export your app:

1. Look for an **Export** or **Download** button in Figma Make
2. Download all your project files as a ZIP
3. Extract the ZIP to a folder on your computer

### Step 2: Create Vercel Account

1. Go to: **https://vercel.com**
2. Click **"Sign Up"**
3. Choose **"Continue with GitHub"** (recommended) or use email
4. Complete the free signup (no credit card needed!)

### Step 3: Deploy Your App

**Option A: Drag & Drop (Easiest)**
1. In Vercel dashboard, click **"Add New"** → **"Project"**
2. Click **"Deploy without Git"**
3. Drag your project folder into the upload area
4. Vercel automatically detects it's a Vite/React app
5. Click **"Deploy"**
6. Wait 2-3 minutes ⏰
7. **DONE! Your app is live!** 🎉

**Option B: GitHub (Recommended for updates)**
1. Create a GitHub account at https://github.com
2. Upload your code to a new repository
3. In Vercel, click **"Add New"** → **"Project"**
4. Import your GitHub repository
5. Click **"Deploy"**
6. Now any GitHub updates automatically redeploy!

### Your Live URLs

After deployment, you'll get:
- **Free Vercel URL:** `https://your-app-name.vercel.app`
- You can add a custom domain later (like `fortressblock.com`)

---

## 💳 Set Up Whop Payments

### Step 1: Create Whop Account

1. Go to: **https://whop.com**
2. Click **"Get Started"** or **"Sign Up"**
3. Create your account (free)
4. Complete business verification

### Step 2: Create Your Products in Whop

1. In Whop Dashboard, go to **"Products"**
2. Click **"Create Product"**

**Product 1: Homeowner Plus**
- Name: `Homeowner Plus Monthly`
- Price: `$19/month`
- Description: Add your features
- Create the product
- **Copy the Checkout URL** (save this!)

**Product 2: Homeowner Plus Annual**
- Name: `Homeowner Plus Annual`
- Price: `$199/year` (or whatever you want)
- Description: Add your features
- **Copy the Checkout URL**

**Product 3: Builder Pro Monthly**
- Name: `Builder Pro Monthly`
- Price: `$199/month`
- Description: Add your features
- **Copy the Checkout URL**

**Product 4: Builder Pro Annual**
- Name: `Builder Pro Annual`
- Price: `$1,999/year` (or whatever you want)
- Description: Add your features
- **Copy the Checkout URL**

### Step 3: Update Your App with Whop URLs

1. In your project files, open: `/src/lib/whop.ts`

2. Replace the placeholder URLs with your REAL Whop checkout URLs:

```typescript
export const WHOP_CHECKOUT_URLS = {
  homeownerPlus: {
    monthly: 'YOUR_ACTUAL_WHOP_URL_HERE',  // ← Paste from Whop
    annual: 'YOUR_ACTUAL_WHOP_URL_HERE',   // ← Paste from Whop
  },
  builderPro: {
    monthly: 'YOUR_ACTUAL_WHOP_URL_HERE',  // ← Paste from Whop
    annual: 'YOUR_ACTUAL_WHOP_URL_HERE',   // ← Paste from Whop
  },
};
```

3. Save the file

4. Re-deploy to Vercel:
   - If using GitHub: Push changes to GitHub (auto-deploys)
   - If using drag & drop: Upload again to Vercel

### Step 4: Test Your Payments

1. Go to your live app URL
2. Click **"Upgrade"** buttons
3. You should be redirected to Whop checkout
4. Complete a test purchase
5. Whop will handle everything!

---

## 🎯 What Happens After Someone Pays?

**Whop handles everything automatically:**

1. Customer clicks "Upgrade" in your app
2. Opens Whop checkout page
3. Customer enters payment info
4. Whop processes payment
5. Customer gets access immediately
6. Whop sends them a receipt
7. Subscription renews automatically
8. Customer can manage subscription in Whop dashboard

**You can track:**
- Sales revenue
- Active subscribers
- Cancellations
- Everything in Whop Dashboard

---

## 💰 Whop Pricing

Whop charges a small fee per transaction:
- **3-5%** of each sale (standard)
- No monthly fees
- No setup fees
- Only pay when you make money!

---

## 🌐 Add Custom Domain (Optional)

### Buy a Domain

1. Go to **Namecheap.com**, **GoDaddy.com**, or **Google Domains**
2. Search for `fortressblock.com` (or whatever you want)
3. Buy it ($10-15/year)

### Connect to Vercel

1. In Vercel dashboard, click your project
2. Go to **"Settings"** → **"Domains"**
3. Click **"Add Domain"**
4. Enter your domain name
5. Follow Vercel's DNS instructions
6. Wait 24 hours for DNS propagation

Now your app is at: `www.fortressblock.com` 🎉

---

## 📊 Complete Setup Checklist

### Initial Deployment
- [ ] Export app from Figma Make
- [ ] Create Vercel account
- [ ] Deploy app to Vercel
- [ ] Get live URL
- [ ] Test that app loads

### Payment Setup
- [ ] Create Whop account
- [ ] Create all 4 products in Whop
- [ ] Copy all checkout URLs
- [ ] Update `/src/lib/whop.ts` with real URLs
- [ ] Re-deploy to Vercel
- [ ] Test upgrade buttons
- [ ] Complete test purchase

### Optional
- [ ] Buy custom domain
- [ ] Connect domain to Vercel
- [ ] Update branding/logos
- [ ] Set up email for support

---

## 🆘 Common Issues

**Q: Upgrade button doesn't work**
- A: Make sure you updated `/src/lib/whop.ts` with REAL Whop URLs

**Q: Vercel says "Build Failed"**
- A: This shouldn't happen with Figma Make exports, but contact support if it does

**Q: Can I change prices later?**
- A: Yes! Just update prices in Whop dashboard

**Q: How do I cancel someone's subscription?**
- A: In Whop dashboard → Members → Find user → Manage

**Q: When do I get paid?**
- A: Whop pays you on their schedule (usually weekly/monthly)

---

## 🎓 What You Built

**Your Tech Stack:**
- **Frontend:** React + Tailwind CSS (hosted on Vercel)
- **Payments:** Whop (handles everything)
- **Hosting:** Vercel (free tier)
- **Total Cost:** $0/month + 3-5% per sale

**This can scale to:**
- Thousands of users
- Millions of pageviews
- Six-figure revenue
- All without changing anything!

---

## 📞 Need Help?

**Vercel Support:**
- Docs: https://vercel.com/docs
- Discord: https://vercel.com/discord

**Whop Support:**
- Help Center: https://whop.com/help
- Email: support@whop.com

**Your App:**
- All code is in your files
- You own everything
- No vendor lock-in

---

## 🎉 You're Ready!

Your Fortress Block Studio app is:
- ✅ Built and working
- ✅ Ready to deploy (Vercel)
- ✅ Ready to accept payments (Whop)
- ✅ Ready to make money!

Just follow the steps above and you'll be live in 1-2 hours! 🚀

Good luck with your launch! 💪
