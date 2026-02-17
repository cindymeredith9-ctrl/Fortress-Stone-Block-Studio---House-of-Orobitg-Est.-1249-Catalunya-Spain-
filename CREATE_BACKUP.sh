#!/bin/bash

# FORTRESS STONE™ BACKUP SCRIPT
# © 2026 House of Orobitg™
# Run this to create a complete backup of your project

echo "🏰 FORTRESS STONE™ BACKUP SCRIPT"
echo "=================================="
echo ""

# Get current date for backup name
BACKUP_DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="fortress-stone-backup-${BACKUP_DATE}"

echo "📦 Creating backup: ${BACKUP_NAME}.zip"
echo ""

# Create backup ZIP excluding unnecessary files
zip -r "${BACKUP_NAME}.zip" . \
  -x "node_modules/*" \
  -x "dist/*" \
  -x ".vite/*" \
  -x ".vercel/*" \
  -x ".git/*" \
  -x ".DS_Store" \
  -x "*.log" \
  -x ".env.local"

echo ""
echo "✅ BACKUP COMPLETE!"
echo ""
echo "📍 Backup saved as: ${BACKUP_NAME}.zip"
echo "📊 Backup size: $(du -h ${BACKUP_NAME}.zip | cut -f1)"
echo ""
echo "📂 Backup contains:"
echo "  ✅ All source code (src/)"
echo "  ✅ All config files"
echo "  ✅ All contracts & documentation"
echo "  ✅ All licensing system files"
echo ""
echo "❌ Backup excludes (can reinstall):"
echo "  ❌ node_modules/ (500MB+)"
echo "  ❌ dist/ (build output)"
echo "  ❌ cache folders"
echo ""
echo "🎉 YOUR CODE IS SAFE!"
echo ""
echo "To restore this backup:"
echo "  1. Unzip: unzip ${BACKUP_NAME}.zip"
echo "  2. Install: npm install"
echo "  3. Run: npm run dev"
echo ""
