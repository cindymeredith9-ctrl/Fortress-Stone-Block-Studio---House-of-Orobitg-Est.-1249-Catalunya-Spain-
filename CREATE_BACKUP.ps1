# FORTRESS STONE™ BACKUP SCRIPT (WINDOWS)
# © 2026 House of Orobitg™
# Run this in PowerShell to create a complete backup

Write-Host "🏰 FORTRESS STONE™ BACKUP SCRIPT" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Get current date for backup name
$BackupDate = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupName = "fortress-stone-backup-$BackupDate"

Write-Host "📦 Creating backup: $BackupName.zip" -ForegroundColor Yellow
Write-Host ""

# Create temporary folder for backup
$TempBackup = "$BackupName-temp"
New-Item -ItemType Directory -Path $TempBackup -Force | Out-Null

# Copy files excluding unnecessary folders
Write-Host "📁 Copying files..." -ForegroundColor Green
Get-ChildItem -Path . -Exclude node_modules,dist,.vite,.vercel,.git,*.log | Copy-Item -Destination $TempBackup -Recurse -Force

# Create ZIP
Write-Host "🗜️ Compressing..." -ForegroundColor Green
Compress-Archive -Path $TempBackup -DestinationPath "$BackupName.zip" -Force

# Clean up temp folder
Remove-Item -Path $TempBackup -Recurse -Force

Write-Host ""
Write-Host "✅ BACKUP COMPLETE!" -ForegroundColor Green
Write-Host ""
Write-Host "📍 Backup saved as: $BackupName.zip" -ForegroundColor Cyan
$BackupSize = (Get-Item "$BackupName.zip").Length / 1MB
Write-Host "📊 Backup size: $([math]::Round($BackupSize, 2)) MB" -ForegroundColor Cyan
Write-Host ""
Write-Host "📂 Backup contains:" -ForegroundColor Yellow
Write-Host "  ✅ All source code (src/)" -ForegroundColor Green
Write-Host "  ✅ All config files" -ForegroundColor Green
Write-Host "  ✅ All contracts & documentation" -ForegroundColor Green
Write-Host "  ✅ All licensing system files" -ForegroundColor Green
Write-Host ""
Write-Host "❌ Backup excludes (can reinstall):" -ForegroundColor Yellow
Write-Host "  ❌ node_modules/ (500MB+)" -ForegroundColor Red
Write-Host "  ❌ dist/ (build output)" -ForegroundColor Red
Write-Host "  ❌ cache folders" -ForegroundColor Red
Write-Host ""
Write-Host "🎉 YOUR CODE IS SAFE!" -ForegroundColor Cyan
Write-Host ""
Write-Host "To restore this backup:" -ForegroundColor Yellow
Write-Host "  1. Extract the ZIP file"
Write-Host "  2. Open PowerShell in extracted folder"
Write-Host "  3. Run: npm install"
Write-Host "  4. Run: npm run dev"
Write-Host ""
