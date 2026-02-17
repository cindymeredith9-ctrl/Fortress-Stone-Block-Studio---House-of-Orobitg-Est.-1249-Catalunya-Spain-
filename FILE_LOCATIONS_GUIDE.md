# 📁 FILE LOCATIONS GUIDE - Where Everything Is

**Quick reference for finding all the new features and files**

**© 2026 House of Orobitg. All Rights Reserved.**

---

## 🎯 NEW FILES CREATED TODAY

### **1. PDF Engineering Disclaimers**

**Location:** `/src/app/components/fortress/PDFEngineeringDisclaimer.tsx`

**What it does:**
- Comprehensive legal disclaimer for PDF exports
- 3 variants: Full, Compact, Minimal
- PDF-optimized black & white printing mode
- Protects you from liability claims

**How to use:**
```tsx
import { PDFEngineeringDisclaimer } from '@/app/components/fortress/PDFEngineeringDisclaimer';

<PDFEngineeringDisclaimer variant="full" pdfMode={true} />
```

---

### **2. Whop Setup Instructions**

**Location:** `/WHOP_SETUP_INSTRUCTIONS.md`

**What it contains:**
- Step-by-step guide for your existing Whop account
- How to create 4 products
- How to copy checkout URLs
- How to update your code
- Troubleshooting tips
- Payout and fee information

**When to use:** Setting up payments for the first time

---

### **3. Deployment Quick Start**

**Location:** `/DEPLOYMENT_QUICK_START.md`

**What it contains:**
- Complete 30-minute deployment checklist
- Vercel setup instructions
- Whop integration steps
- Post-launch tasks
- Troubleshooting guide

**When to use:** When you're ready to deploy to production

---

### **4. PDF Disclaimer Implementation Guide**

**Location:** `/PDF_DISCLAIMER_IMPLEMENTATION.md`

**What it contains:**
- How to add disclaimers to all PDF exports
- Code examples for each screen
- Testing checklist
- Legal compliance requirements

**When to use:** After deployment, when adding disclaimer protection

---

### **5. This File (Locations Guide)**

**Location:** `/FILE_LOCATIONS_GUIDE.md`

**What it contains:**
- Quick reference for finding files
- Directory structure
- Component locations

**When to use:** When you can't find something!

---

## 🗂️ COMPLETE DIRECTORY STRUCTURE

```
fortress-block-studio/
│
├── 📄 DEPLOYMENT_QUICK_START.md          ⭐ START HERE for deployment
├── 📄 WHOP_SETUP_INSTRUCTIONS.md         ⭐ Whop payment setup
├── 📄 PDF_DISCLAIMER_IMPLEMENTATION.md   ⭐ Legal protection guide
├── 📄 FILE_LOCATIONS_GUIDE.md            ⭐ This file
│
├── 📄 DEPLOYMENT.md                      Full deployment documentation
├── 📄 TERMS_OF_SERVICE.md                Legal: Terms of Service
├── 📄 PRIVACY_POLICY.md                  Legal: Privacy Policy
├── 📄 COPYRIGHT.md                       Legal: Copyright protection
│
├── 📦 package.json                       Dependencies (jspdf already installed)
├── ⚙️ vercel.json                        Vercel deployment config
├── ⚙️ vite.config.ts                     Vite build config
│
├── 📁 src/
│   ├── 📁 app/
│   │   ├── 📄 App.tsx                    ⭐ Main app component
│   │   │
│   │   ├── 📁 components/
│   │   │   ├── 📁 fortress/              ⭐ All your app screens (55+ files)
│   │   │   │   │
│   │   │   │   ├── 🏠 HomeScreen.tsx
│   │   │   │   ├── 🧱 BlocksScreen.tsx
│   │   │   │   ├── 🏗️ WallBuilderScreen.tsx
│   │   │   │   ├── 💰 CostEstimatorScreen.tsx
│   │   │   │   ├── 📊 BOMScreen.tsx
│   │   │   │   │
│   │   │   │   ├── 📚 ProductReferenceScreen.tsx      (Educational guide)
│   │   │   │   ├── 🎨 ColorVisualizerScreen.tsx       (14 colors)
│   │   │   │   ├── 🏠 RoofExteriorDesignerScreen.tsx  ⭐ NEW! (Roof & exterior)
│   │   │   │   ├── 🪟 InteriorFinishesScreen.tsx      ⭐ NEW! (Tiles & flooring)
│   │   │   │   ├── 🔐 SpecialtyRoomsScreen.tsx        ⭐ NEW! (Safe rooms, etc.)
│   │   │   │   │
│   │   │   │   ├── 📄 PDFExportScreen.tsx
│   │   │   │   ├── ⚠️ PDFEngineeringDisclaimer.tsx    ⭐ NEW! (Legal protection)
│   │   │   │   ├── ⚠️ EngineeringDisclaimerBanner.tsx (Existing - keep this!)
│   │   │   │   │
│   │   │   │   ├── 👤 AccountScreen.tsx
│   │   │   │   ├── 💳 PlansPricingScreen.tsx
│   │   │   │   ├── 💳 WhopCheckoutScreen.tsx
│   │   │   │   │
│   │   │   │   ├── 🏰 FortressLogo.tsx
│   │   │   │   ├── 🛡️ FortressCrest.tsx
│   │   │   │   ├── © CopyrightFooter.tsx
│   │   │   │   │
│   │   │   │   └── ... (50+ more components)
│   │   │   │
│   │   │   └── 📁 ui/                    (Shadcn UI components)
│   │   │
│   │   └── 📁 data/
│   │       ├── 📄 blocks.ts              (21 Fortress Stone™ blocks)
│   │       └── 📄 pricing.ts             (Pricing configuration)
│   │
│   ├── 📁 lib/
│   │   ├── 📄 whop.ts                    ⭐ Whop integration (UPDATE THIS!)
│   │   ├── 📄 stripe.ts                  (Legacy - not used)
│   │   └── 📄 formula-protection.ts      (Trade secret protection)
│   │
│   └── 📁 styles/
│       ├── 📄 index.css                  (Main styles)
│       ├── 📄 theme.css                  (Color tokens)
│       ├── 📄 fonts.css                  (Typography)
│       └── 📄 tailwind.css               (Tailwind v4)
│
└── 📁 public/
    └── 📄 favicon.svg                    (Fortress icon)
```

---

## 🎯 KEY FILES TO KNOW ABOUT

### **FOR DEPLOYMENT:**

| File | Location | Purpose |
|------|----------|---------|
| **Deployment Guide** | `/DEPLOYMENT_QUICK_START.md` | Complete deployment checklist |
| **Whop Setup** | `/WHOP_SETUP_INSTRUCTIONS.md` | Payment integration guide |
| **Whop Config** | `/src/lib/whop.ts` | ⚠️ **UPDATE THIS** with your URLs |
| **Vercel Config** | `/vercel.json` | Auto-configured, ready to go |

### **FOR LEGAL PROTECTION:**

| File | Location | Purpose |
|------|----------|---------|
| **PDF Disclaimer** | `/src/app/components/fortress/PDFEngineeringDisclaimer.tsx` | NEW! Legal protection |
| **Disclaimer Banner** | `/src/app/components/fortress/EngineeringDisclaimerBanner.tsx` | Existing protection |
| **Implementation Guide** | `/PDF_DISCLAIMER_IMPLEMENTATION.md` | How to use disclaimers |
| **Terms of Service** | `/TERMS_OF_SERVICE.md` | Full TOS document |
| **Privacy Policy** | `/PRIVACY_POLICY.md` | Full privacy document |
| **Copyright** | `/COPYRIGHT.md` | IP protection info |

### **FOR FEATURES:**

| Screen | File Location | What It Does |
|--------|--------------|--------------|
| **Home** | `/src/app/components/fortress/HomeScreen.tsx` | Landing page |
| **Blocks Library** | `/src/app/components/fortress/BlocksScreen.tsx` | Browse 21 blocks |
| **Wall Builder** | `/src/app/components/fortress/WallBuilderScreen.tsx` | Calculate walls |
| **Cost Estimator** | `/src/app/components/fortress/CostEstimatorScreen.tsx` | Estimate costs |
| **Product Reference** | `/src/app/components/fortress/ProductReferenceScreen.tsx` | Learning center |
| **Color Visualizer** | `/src/app/components/fortress/ColorVisualizerScreen.tsx` | 14 colors |
| **Roof Designer** | `/src/app/components/fortress/RoofExteriorDesignerScreen.tsx` | ⭐ NEW! |
| **Interior Finishes** | `/src/app/components/fortress/InteriorFinishesScreen.tsx` | ⭐ NEW! |
| **Specialty Rooms** | `/src/app/components/fortress/SpecialtyRoomsScreen.tsx` | ⭐ NEW! |
| **Account** | `/src/app/components/fortress/AccountScreen.tsx` | User settings |
| **Pricing** | `/src/app/components/fortress/PlansPricingScreen.tsx` | Subscribe page |

---

## 🔍 HOW TO FIND SPECIFIC FEATURES

### **"Where is the Whop checkout URL configuration?"**

**Answer:** `/src/lib/whop.ts` - lines 52-61

```typescript
export const WHOP_CHECKOUT_URLS = {
  homeownerPlus: {
    monthly: 'REPLACE_WITH_YOUR_URL',  // ← Update this
    annual: 'REPLACE_WITH_YOUR_URL',   // ← Update this
  },
  builderPro: {
    monthly: 'REPLACE_WITH_YOUR_URL',  // ← Update this
    annual: 'REPLACE_WITH_YOUR_URL',   // ← Update this
  },
} as const;
```

---

### **"Where are the 21 Fortress Stone™ blocks defined?"**

**Answer:** `/src/app/data/blocks.ts`

Contains all block data:
- IL-2 Exterior Foundation (24×12×12)
- IL-2 Interior Foundation (24×12×8)
- 19 specialty Fortress Stone™ blocks
- All engineering specs (PSI, wind resistance, etc.)

---

### **"Where is the new Interior Finishes screen?"**

**Answer:** `/src/app/components/fortress/InteriorFinishesScreen.tsx`

Features:
- House of Orobitg™ Signature Tile with upload
- Mediterranean tiles (3 styles)
- Spanish tiles (3 styles)
- Texas tiles (3 styles)
- 5 flooring options

---

### **"Where is the new Specialty Rooms screen?"**

**Answer:** `/src/app/components/fortress/SpecialtyRoomsScreen.tsx`

Features:
- Safe Room/Vault (5000 PSI, 250mph wind)
- Wine Cellar (climate controlled)
- Storm Shelter (FEMA P-361 compliant)
- Earthquake Vault (Seismic Zone 4)

---

### **"Where is the new Roof & Exterior Designer?"**

**Answer:** `/src/app/components/fortress/RoofExteriorDesignerScreen.tsx`

Features:
- 7 roof styles (Asphalt Shingle, Metal, Clay Tile, etc.)
- 6 exterior finishes (Smooth, Stucco, Stone Veneer, etc.)
- Live 3D house previews
- Cost impact calculators

---

### **"Where is the PDF engineering disclaimer?"**

**Answer:** `/src/app/components/fortress/PDFEngineeringDisclaimer.tsx`

Features:
- Full variant (for first PDF page)
- Compact variant (inline use)
- Minimal variant (page footers)
- PDF-optimized black & white mode
- Plain text function for jsPDF

---

### **"Where are the Terms of Service?"**

**Answer:** `/TERMS_OF_SERVICE.md`

Complete legal document with:
- User obligations
- Liability disclaimers
- Engineering review requirements
- IP protection
- Subscription terms

---

### **"Where is the Privacy Policy?"**

**Answer:** `/PRIVACY_POLICY.md`

Complete privacy document with:
- Data collection practices
- Cookie usage
- Third-party services (Whop, Vercel)
- User rights
- GDPR/CCPA compliance

---

## 📋 QUICK ACCESS CHECKLIST

**I need to...**

### **Deploy my app**
→ Read: `/DEPLOYMENT_QUICK_START.md`

### **Set up Whop payments**
→ Read: `/WHOP_SETUP_INSTRUCTIONS.md`  
→ Update: `/src/lib/whop.ts`

### **Add PDF disclaimers**
→ Read: `/PDF_DISCLAIMER_IMPLEMENTATION.md`  
→ Use: `/src/app/components/fortress/PDFEngineeringDisclaimer.tsx`

### **Find the new features**
→ Interior Finishes: `/src/app/components/fortress/InteriorFinishesScreen.tsx`  
→ Specialty Rooms: `/src/app/components/fortress/SpecialtyRoomsScreen.tsx`  
→ Roof Designer: `/src/app/components/fortress/RoofExteriorDesignerScreen.tsx`

### **Update block data**
→ Edit: `/src/app/data/blocks.ts`

### **Change pricing**
→ Edit: `/src/app/data/pricing.ts`  
→ Update: `/src/lib/whop.ts` (Whop URLs)

### **Customize branding**
→ Logo: `/src/app/components/fortress/FortressLogo.tsx`  
→ Crest: `/src/app/components/fortress/FortressCrest.tsx`  
→ Colors: `/src/styles/theme.css`

---

## 🎯 MOST IMPORTANT FILES (PRIORITY ORDER)

### **1. MUST UPDATE BEFORE LAUNCH:**
- [ ] `/src/lib/whop.ts` - Add your Whop checkout URLs

### **2. SHOULD READ BEFORE DEPLOYMENT:**
- [ ] `/DEPLOYMENT_QUICK_START.md` - Deployment checklist
- [ ] `/WHOP_SETUP_INSTRUCTIONS.md` - Payment setup

### **3. SHOULD IMPLEMENT SOON:**
- [ ] `/src/app/components/fortress/PDFEngineeringDisclaimer.tsx` - Legal protection
- [ ] `/PDF_DISCLAIMER_IMPLEMENTATION.md` - Implementation guide

### **4. GOOD TO KNOW:**
- [ ] `/TERMS_OF_SERVICE.md` - Legal terms
- [ ] `/PRIVACY_POLICY.md` - Privacy policy
- [ ] `/COPYRIGHT.md` - IP protection

---

## 🆘 STILL CAN'T FIND SOMETHING?

### **Use your code editor's search:**

**VS Code / Cursor / Other IDEs:**
1. Press `Ctrl+Shift+F` (Windows) or `Cmd+Shift+F` (Mac)
2. Search for text you're looking for
3. Example searches:
   - "WHOP_CHECKOUT_URLS" → Finds Whop config
   - "InteriorFinishesScreen" → Finds interior screen
   - "PDFEngineeringDisclaimer" → Finds disclaimer component
   - "House of Orobitg" → Finds all branding references

---

## 📞 FILE QUESTIONS?

**Q: Where do I download the project ZIP?**  
A: Look for "Download" or "Export" button in Figma Make (top of screen)

**Q: What files do I need to update?**  
A: Only `/src/lib/whop.ts` - add your Whop checkout URLs

**Q: Can I delete any files?**  
A: No! All files are needed. Don't delete anything.

**Q: Where are images stored?**  
A: All graphics are inline SVG code - no image files needed!

**Q: How big is the entire project?**  
A: About 5-10 MB total (very lightweight!)

---

## ✅ FILES READY TO USE (NO CHANGES NEEDED)

- ✅ `/vercel.json` - Vercel deployment config
- ✅ `/package.json` - All dependencies installed
- ✅ `/src/app/App.tsx` - Main app ready
- ✅ All 55+ component files - Complete and working
- ✅ `/src/app/data/blocks.ts` - 21 blocks defined
- ✅ `/src/styles/*.css` - All styles complete
- ✅ Legal docs (TOS, Privacy, Copyright)

**You ONLY need to update:** `/src/lib/whop.ts` with your Whop URLs!

---

**© 2026 House of Orobitg. All Rights Reserved.**

*Everything you need is organized and ready to deploy!* 📁🚀
