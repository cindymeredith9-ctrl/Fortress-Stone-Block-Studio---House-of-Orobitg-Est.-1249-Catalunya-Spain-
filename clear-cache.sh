#!/bin/bash

echo "🧹 FORTRESS STONE™ - CLEARING ALL CACHES"
echo "========================================"
echo ""

# Stop any running processes
echo "Stopping Vite processes..."
pkill -f "vite" 2>/dev/null || true

# Clear Vite cache
echo "Clearing Vite cache..."
rm -rf node_modules/.vite

# Clear dist
echo "Clearing dist folder..."
rm -rf dist

# Clear any other caches
echo "Clearing additional caches..."
rm -rf node_modules/.cache
rm -rf .parcel-cache

echo ""
echo "✅ All caches cleared!"
echo ""
echo "Now run: npm run dev"
