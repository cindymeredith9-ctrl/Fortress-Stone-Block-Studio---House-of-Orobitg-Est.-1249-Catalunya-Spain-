# ⚡ Whop Setup - Quick Start Guide

## 🎯 Goal
Get your app accepting REAL payments in 30 minutes!

---

## ✅ Quick Checklist

### Part 1: Deploy App (15 minutes)

1. **Export from Figma Make**
   - Click Export/Download button
   - Save ZIP file
   - Extract to folder

2. **Go to Vercel.com**
   - Sign up (free)
   - Click "Add New Project"
   - Drag your folder in
   - Click "Deploy"
   - ⏳ Wait 2-3 minutes

3. **Get Your Live URL**
   - Copy your URL: `https://your-app.vercel.app`
   - Test it! Your app is now LIVE! 🎉

---

### Part 2: Set Up Payments (15 minutes)

1. **Go to Whop.com** verification

   - Sign up (free)
   - Complete
2. **Create Products** (Do this 4 times)

   **Product #1:**
   - Name: `Homeowner Plus Monthly`
   - Price: `$19/month`
   - Click "Create"
   - **COPY THE CHECKOUT URL** ← IMPORTANT!

   **Product #2:**
   - Name: `Homeowner Plus Annual`
   - Price: `$199/year`
   - **COPY THE CHECKOUT URL**

   **Product #3:**
   - Name: `Builder Pro Monthly`
   - Price: `$199/month`
   - **COPY THE CHECKOUT URL**

   **Product #4:**
   - Name: `Builder Pro Annual`
   - Price: `$1,999/year`
   - **COPY THE CHECKOUT URL**

3. **Update Your App Code**

   Open: `/src/lib/whop.ts`

   Replace this:
   ```typescript
   homeownerPlus: {
     monthly: 'https://whop.com/fortress-block-studio/homeowner-plus-monthly/',
     annual: 'https://whop.com/fortress-block-studio/homeowner-plus-annual/',
   },
   ```

   With your REAL Whop URLs:
   ```typescript
   homeownerPlus: {
     monthly: 'https://whop.com/YOUR_ACTUAL_URL_FROM_STEP_2',
     annual: 'https://whop.com/YOUR_ACTUAL_URL_FROM_STEP_2',
   },
   ```

   Do the same for `builderPro` section!

4. **Re-Deploy**
   - Go back to Vercel
   - Drag your updated folder again
   - Wait 2 minutes
   - DONE! ✅

---

## 🧪 Test Your Setup

1. Go to your live URL
2. Click "Upgrade to Pro" button
3. Should open Whop checkout page
4. Try a test purchase
5. It works! You can now accept payments! 💰

---

## 📋 Your Whop URLs Will Look Like:

```
https://whop.com/your-company/homeowner-plus-monthly
https://whop.com/your-company/homeowner-plus-annual
https://whop.com/your-company/builder-pro-monthly
https://whop.com/your-company/builder-pro-annual
```

Each one is unique - copy them EXACTLY from Whop!

---

## 💡 Pro Tips

- ✅ Test with a small purchase first
- ✅ Check Whop dashboard to see the sale
- ✅ You can change prices anytime in Whop
- ✅ Whop handles refunds/cancellations
- ✅ You get paid automatically

---

## 🆘 Stuck?

**URLs not working?**
→ Make sure you copied from Whop exactly (no extra spaces!)

**Buttons don't do anything?**
→ Did you re-deploy after updating the URLs?

**Whop page looks weird?**
→ Customize it in Whop Dashboard → Settings

---

## 🎉 That's It!

Your app is now:
- ✅ Live on the internet
- ✅ Accepting real payments
- ✅ Ready to make money

**Total time:** ~30 minutes
**Total cost:** $0

Now go make some sales! 🚀💰
