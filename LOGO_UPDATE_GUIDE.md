# 🎨 LOGO UPDATE QUICK REFERENCE GUIDE
**Fortress Stone™ Block Studio™ - How to Update Logo**

---

## **🚀 WHEN YOU NEED TO CHANGE THE LOGO:**

**Only 3 files need updating!**

---

## **📁 FILE #1: SPLASH SCREEN**

**Path:** `/src/app/components/fortress/SplashScreen.tsx`

**What to change:**
```typescript
// FIND THIS LINE (around line 3):
import heroImage from 'figma:asset/OLD_IMAGE_ID.png';

// REPLACE WITH YOUR NEW IMAGE ID:
import heroImage from 'figma:asset/YOUR_NEW_IMAGE_ID.png';
```

**Current Image ID:** `0fb98ba5e8b3f5249024e8116f594178a9820d57`

---

## **📁 FILE #2: FORTRESS LOGO COMPONENT**

**Path:** `/src/app/components/fortress/FortressLogo.tsx`

**What to change:**
```typescript
// FIND THIS LINE (line 1):
import logoImage from 'figma:asset/OLD_IMAGE_ID.png';

// REPLACE WITH YOUR NEW IMAGE ID:
import logoImage from 'figma:asset/YOUR_NEW_IMAGE_ID.png';
```

**Current Image ID:** `0fb98ba5e8b3f5249024e8116f594178a9820d57`

---

## **📁 FILE #3: HERITAGE INTRO SCREEN**

**Path:** `/src/app/components/fortress/HeritageIntroScreen.tsx`

**What to change:**
```typescript
// FIND THIS LINE (around line 5):
import epicLogo from 'figma:asset/OLD_IMAGE_ID.png';

// REPLACE WITH YOUR NEW IMAGE ID:
import epicLogo from 'figma:asset/YOUR_NEW_IMAGE_ID.png';
```

**Current Image ID:** `0fb98ba5e8b3f5249024e8116f594178a9820d57`

---

## **📝 STEP-BY-STEP INSTRUCTIONS:**

### **WHEN YOU GET A NEW LOGO:**

**Step 1: Upload to Figma Make**
- Upload your new logo image
- Get the new asset ID from Figma Make
- Example: `figma:asset/abc123def456.png`

**Step 2: Copy the Asset ID**
- Copy just the ID part: `abc123def456`

**Step 3: Update 3 Files**

**File 1: SplashScreen.tsx**
```typescript
// Line 3
import heroImage from 'figma:asset/abc123def456.png';
```

**File 2: FortressLogo.tsx**
```typescript
// Line 1
import logoImage from 'figma:asset/abc123def456.png';
```

**File 3: HeritageIntroScreen.tsx**
```typescript
// Line 5
import epicLogo from 'figma:asset/abc123def456.png';
```

**Step 4: Save All Files**
- Save all 3 files
- Test the app
- Logo should update everywhere!

---

## **🎯 QUICK COPY-PASTE TEMPLATE:**

**When you have a new logo, just copy this and fill in YOUR_NEW_ID:**

```typescript
// FILE 1: /src/app/components/fortress/SplashScreen.tsx (Line 3)
import heroImage from 'figma:asset/YOUR_NEW_ID.png';

// FILE 2: /src/app/components/fortress/FortressLogo.tsx (Line 1)
import logoImage from 'figma:asset/YOUR_NEW_ID.png';

// FILE 3: /src/app/components/fortress/HeritageIntroScreen.tsx (Line 5)
import epicLogo from 'figma:asset/YOUR_NEW_ID.png';
```

---

## **📋 VERSION HISTORY:**

### **Version 1 (Original):**
- Image ID: `75bd459922806b3f42e94f8fa9af32799338deb2`
- Issues: Missing ™ symbols, "CATALU?EA" typo

### **Version 2 (Current - FIXED!):**
- Image ID: `0fb98ba5e8b3f5249024e8116f594178a9820d57`
- Fixed: All ™ symbols added, "CATALUNYA" spelled correctly
- Status: ✅ ACTIVE

### **Future Versions:**
- Add new image ID here when you update
- Keep this list for reference

---

## **⚠️ IMPORTANT NOTES:**

**DO NOT CHANGE:**
- Alt text (leave as is)
- Class names (leave as is)
- Component structure (leave as is)

**ONLY CHANGE:**
- The `figma:asset/IMAGE_ID.png` part
- Nothing else!

**3 FILES = 3 LINES TO UPDATE**
That's it! Simple! 🎯

---

## **🔍 HOW TO FIND THE IMAGE ID:**

**In Figma Make:**
1. Upload your image
2. The system gives you: `figma:asset/abc123def456.png`
3. Copy the whole thing: `figma:asset/abc123def456.png`
4. Replace in all 3 files

**That's the entire process!** ✅

---

## **✅ CHECKLIST:**

When updating logo, check off these steps:

- [ ] Upload new logo to Figma Make
- [ ] Get new asset ID
- [ ] Update SplashScreen.tsx (Line 3)
- [ ] Update FortressLogo.tsx (Line 1)
- [ ] Update HeritageIntroScreen.tsx (Line 5)
- [ ] Save all 3 files
- [ ] Test app (view splash screen)
- [ ] Verify logo looks correct
- [ ] Done! ✅

---

## **🎨 LOGO SPECIFICATIONS:**

**Current Logo Contains:**
- ✅ "FORTRESS STONE™" (with trademark)
- ✅ "BLOCK STUDIO™" (with trademark)
- ✅ "EST. 1249"
- ✅ "CATALUNYA, SPAIN" (correct spelling)
- ✅ "HOUSE of OROBITG™" (with trademark)
- ✅ 7 Templar Knights on horseback
- ✅ Epic fortress castle
- ✅ Dramatic stormy sky

**If creating new version, make sure it has all these elements!**

---

## **💾 BACKUP REFERENCE:**

**Save this guide!**
Every time you need to update the logo, just open this file and follow the steps.

**3 Files. 3 Lines. Done.** 🎯

---

© 2026 House of Orobitg™ - Fortress Stone™ Block Studio™
Logo Update Guide - Keep this for reference!
