#!/bin/bash

echo "🏰 FORTRESS STONE™ - Restarting Dev Server"
echo "=========================================="
echo ""
echo "Stopping any running processes..."
pkill -f "vite" 2>/dev/null
echo ""
echo "Starting fresh dev server..."
npm run dev
