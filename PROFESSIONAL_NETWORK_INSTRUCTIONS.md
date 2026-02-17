# 📂 PROFESSIONAL NETWORK DIRECTORY - EDITING INSTRUCTIONS
## © 2026 House of Orobitg™ - Est. 1249 Catalunya, Spain

---

## 🎯 **HOW TO EDIT THE PROFESSIONAL DIRECTORY FROM YOUR REPOSITORY**

When you export your code from Figma Make to your GitHub repository, you can edit the professional listings in your code editor!

---

## 📁 **FILE LOCATION:**

**`/src/app/components/fortress/ProfessionalNetworkScreen.tsx`**

This is the main file containing ALL the professional listings.

---

## 🔧 **HOW TO ADD/EDIT PROFESSIONALS:**

### **Step 1: Open the File**

Navigate to:
```
/src/app/components/fortress/ProfessionalNetworkScreen.tsx
```

### **Step 2: Find the Professionals Array**

Look for this section (around line 50):
```typescript
const professionals: Professional[] = [
  // YOUR LISTINGS ARE HERE
];
```

### **Step 3: Add a New Professional**

Copy this template and add it to the array:

```typescript
{
  id: 'unique-id-here',  // Make this unique!
  name: 'Business Name Here',
  category: 'engineers',  // Options: 'engineers', 'mold-contractors', 'block-builders', 'tile-artists', 'spanish-tiles'
  specialty: 'Your Specialty Description',
  location: 'City, State/Country',
  rating: 4.8,  // 0.0 to 5.0
  reviews: 32,  // Number of reviews
  certified: true,  // true or false
  experience: '15+ years',
  phone: '+1 (555) 123-4567',  // Optional
  email: 'contact@business.com',
  website: 'www.business.com',  // Optional
  description: 'Full description of the business and what makes them special',
  services: ['Service 1', 'Service 2', 'Service 3'],  // Array of services
  featured: false,  // Set to true for gold crown badge
},
```

---

## 📝 **EXAMPLE: Adding a Spanish Tile Artist**

```typescript
{
  id: 'artist-4',
  name: 'Madrid Artisan Ceramics',
  category: 'tile-artists',
  specialty: 'Traditional Spanish Azulejos',
  location: 'Madrid, Spain',
  rating: 4.9,
  reviews: 67,
  certified: true,
  experience: '30+ years (family tradition)',
  phone: '+34 91 234 5678',
  email: 'info@madrid-ceramics.es',
  website: 'www.madrid-ceramics.es',
  description: 'Family-run ceramic studio specializing in hand-painted traditional Spanish azulejos. Third generation artisans preserving ancient techniques.',
  services: ['Custom Tile Design', 'Hand-Painting', 'Restoration Work', 'Bulk Orders'],
  featured: true,  // This will show the gold crown!
},
```

---

## 🏗️ **EXAMPLE: Adding a Mold Contractor**

```typescript
{
  id: 'mold-4',
  name: 'Texas Precision Molds',
  category: 'mold-contractors',
  specialty: 'High-Precision Block Molds',
  location: 'Dallas, TX',
  rating: 4.7,
  reviews: 41,
  certified: true,
  experience: '12+ years',
  phone: '+1 (214) 555-0199',
  email: 'sales@txprecisionmolds.com',
  website: 'www.txprecisionmolds.com',
  description: 'Industrial mold fabrication for modular concrete systems. CNC machining and rapid prototyping.',
  services: ['CNC Mold Fabrication', 'Prototyping', 'Quality Control', 'Mold Repair'],
  featured: false,
},
```

---

## 🎨 **CATEGORY OPTIONS:**

When adding a professional, use ONE of these categories:

| Category | Description |
|----------|-------------|
| `'engineers'` | Structural/Civil Engineers |
| `'mold-contractors'` | Mold Contractors/Fabricators |
| `'block-builders'` | Block Builders/Manufacturers |
| `'tile-artists'` | Spanish Tile Artists/Artisans |
| `'spanish-tiles'` | Spanish Tile Suppliers/Distributors |

---

## ⭐ **FEATURED LISTINGS:**

To make a listing **FEATURED** with a gold crown badge:
```typescript
featured: true,
```

Featured listings appear with:
- 🟡 Gold border
- 👑 Crown badge
- Gold background gradient

---

## 🔍 **EDITING EXISTING PROFESSIONALS:**

1. Find the professional by searching their `name` or `id`
2. Edit any field you want to change
3. Save the file
4. Push to your repository

---

## ❌ **REMOVING A PROFESSIONAL:**

1. Find the professional's entry in the array
2. Delete the entire block from `{` to `},`
3. Make sure there's no trailing comma after the last item
4. Save the file

---

## 🚨 **IMPORTANT RULES:**

1. ✅ Each `id` must be **UNIQUE**
2. ✅ Always use **single quotes** for strings: `'like this'`
3. ✅ Services must be an **array**: `['Service 1', 'Service 2']`
4. ✅ Rating must be a **number** (not a string): `4.8` not `'4.8'`
5. ✅ Category must match **exactly**: `'tile-artists'` not `'Tile Artists'`
6. ✅ Don't forget the **comma** after each entry (except the last one)

---

## 📱 **HOW USERS WILL SUBMIT:**

Users can submit their business through the app by clicking **"List Your Business"** button in the Professional Network screen.

Submissions will be logged to the console (check browser DevTools).

In production, you'll want to connect this to a backend API or database!

---

## 🎯 **ACCESSING THE PROFESSIONAL NETWORK:**

From your app, call:
```typescript
onNavigate('professional-network')
```

Or add a button/link that navigates to `'professional-network'`.

---

## 👑 **HOUSE OF OROBITG™ OFFICIAL LISTINGS:**

These are YOUR official businesses - keep them featured!

- **Orobitg Custom Mold Works** (Girona) - Your family's mold shop
- **Azulejos Orobitg Heritage Collection** - Your official tile line
- **Casa Artesanal de Azulejos** (Sevilla) - Featured tile artists

---

## 🔥 **NEED TO BULK IMPORT?**

If you have a CSV or Excel file of professionals, you can:
1. Convert it to the JSON format above
2. Paste it into the `professionals` array
3. Make sure each entry follows the template exactly

---

## 📞 **SUPPORT:**

Need help editing the directory?
- Check the TypeScript types in the file header
- Look at existing examples in the code
- Follow the template exactly

---

**THIS IS YOUR NETWORK - BUILD IT HOW YOU WANT! 🏗️🎨⚔️**

👑 **House of Orobitg™**  
**Est. 1249 Catalunya, Spain**
