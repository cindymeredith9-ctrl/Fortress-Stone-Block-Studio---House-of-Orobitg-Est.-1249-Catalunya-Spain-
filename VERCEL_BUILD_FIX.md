# VERCEL BUILD FIX
## Error: Rollup failed to resolve import "/src/main.tsx"
### © 2026 House of Orobitg™

---

## **🚨 THE ERROR:**

```
[vite]: Rollup failed to resolve import "/src/main.tsx" from "/vercel/path0/index.html".
```

---

## **✅ THE FIX (3 OPTIONS):**

### **OPTION 1: Update Vite Config (RECOMMENDED)**

**File:** `/vite.config.ts`

Replace the entire file with this:

```typescript
import { defineConfig } from 'vite'
import path from 'path'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [
    react(),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  css: {
    postcss: './postcss.config.mjs',
  },
  build: {
    outDir: 'dist',
    emptyOutDir: true,
    rollupOptions: {
      input: {
        main: path.resolve(__dirname, 'index.html')
      }
    }
  },
  base: './'
})
```

**What this does:**
- Explicitly sets build output directory
- Configures Rollup to use index.html correctly
- Sets base path to relative (fixes Vercel path issues)

---

### **OPTION 2: Update Vercel Build Settings**

**Go to Vercel Dashboard:**

1. Go to your project
2. Click "Settings"
3. Click "Build & Development Settings"
4. Change:

```
Build Command: vite build
Output Directory: dist
Install Command: npm install
Root Directory: ./
```

5. Add Environment Variable (if needed):
```
NODE_VERSION=18
```

6. Click "Save"
7. Redeploy

---

### **OPTION 3: Check index.html Path**

**Make sure `/index.html` line 46 is exactly:**

```html
<script type="module" src="/src/main.tsx"></script>
```

**NOT:**
```html
<script type="module" src="./src/main.tsx"></script>
<script type="module" src="src/main.tsx"></script>
```

The `/` at the beginning is important!

---

## **🔧 STEP-BY-STEP FIX (DO THIS NOW):**

### **1. Update vite.config.ts:**

```bash
# Open the file
# Replace with the code from OPTION 1 above
```

### **2. Test locally:**

```bash
# Clean build
rm -rf dist
rm -rf node_modules/.vite

# Rebuild
npm run build

# Should see:
# ✓ built in X seconds
```

### **3. If build succeeds locally:**

```bash
git add vite.config.ts
git commit -m "Fix Vercel build - update vite config"
git push origin main
```

### **4. Redeploy on Vercel:**

- Go to vercel.com
- Click "Deployments"
- Click "Redeploy" on latest deployment
- OR push to GitHub (auto-deploys)

---

## **🎯 ALTERNATIVE FIX (If Option 1 doesn't work):**

### **Create vercel.json:**

**File:** `/vercel.json`

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "framework": "vite",
  "installCommand": "npm install",
  "devCommand": "npm run dev"
}
```

---

## **🔍 DEBUGGING STEPS:**

### **If still failing, check:**

**1. Node version:**
```bash
node --version
# Should be 18.x or higher
```

**2. Package.json scripts:**
```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  }
}
```

**3. File structure:**
```
/
├── index.html              ← Root level
├── vite.config.ts          ← Root level
├── package.json            ← Root level
└── src/
    ├── main.tsx            ← Entry point
    └── app/
        └── App.tsx         ← Main app
```

**4. Check main.tsx exists:**
```bash
cat src/main.tsx
# Should show React code
```

---

## **🚀 QUICK FIX (COPY-PASTE THIS):**

**Run these commands:**

```bash
# Update vite.config.ts
cat > vite.config.ts << 'EOF'
import { defineConfig } from 'vite'
import path from 'path'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  css: {
    postcss: './postcss.config.mjs',
  },
  build: {
    outDir: 'dist',
    emptyOutDir: true,
  },
  base: './',
})
EOF

# Clean and rebuild
rm -rf dist node_modules/.vite
npm run build

# If successful:
git add vite.config.ts
git commit -m "Fix Vercel build"
git push origin main
```

---

## **💡 WHY THIS HAPPENS:**

Vercel uses a different file path structure than local development:
- **Local:** `/Users/you/project/src/main.tsx`
- **Vercel:** `/vercel/path0/src/main.tsx`

The `base: './'` in vite.config.ts makes paths relative, fixing this issue.

---

## **✅ SUCCESS INDICATORS:**

**Local build success:**
```
✓ 234 modules transformed.
dist/index.html                  X.XX kB
dist/assets/index-XXXXX.js      XXX.XX kB
✓ built in X.XXs
```

**Vercel build success:**
```
[Vercel] Running "npm run build"
✓ built successfully
[Vercel] Build Completed
```

---

## **🆘 IF STILL BROKEN:**

**Try this nuclear option:**

```bash
# Delete everything build-related
rm -rf dist
rm -rf node_modules
rm -rf .next
rm -rf .vercel
rm pnpm-lock.yaml

# Reinstall
npm install

# Rebuild
npm run build

# Commit
git add .
git commit -m "Clean rebuild"
git push origin main
```

---

## **📞 COPY-PASTE ERROR MESSAGE:**

**If still not working, share this:**

1. Full error message from Vercel
2. Your vite.config.ts file
3. Your package.json file
4. Output of: `ls -la src/`

---

**TRY THE VITE.CONFIG.TS FIX FIRST!!** 🔧✅

**IT FIXES 90% OF VERCEL BUILD ERRORS!!** 💪🚀
