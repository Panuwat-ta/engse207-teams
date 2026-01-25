#!/bin/bash
# scripts/start-vm2.sh
# Start ONLY App Tier (Node.js) on VM2

echo "═══════════════════════════════════════════════════════"
echo "  🚀 Starting Task Board - App Tier (VM2)"
echo "═══════════════════════════════════════════════════════"

# Go to backend directory
cd ~/engse207-teams/term-project/week6-ntier/vm2-nodeJS || exit 1

# Start Node.js with PM2
echo ""
echo "1. Starting Node.js Backend..."
pm2 start server.js --name "taskboard-api"
pm2 status

# Verify service
echo ""
echo "═══════════════════════════════════════════════════════"
echo "  ✅ App Tier started!"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "  📍 Test URLs (from VM2):"
echo "     - Local API: http://localhost:3000/api/health"
echo ""
echo "  📊 Monitoring:"
echo "     - pm2 logs taskboard-api"
echo ""
