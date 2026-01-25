#!/bin/bash
# scripts/start-web.sh
# Start Web Tier only (Nginx)

echo "═══════════════════════════════════════════════════════"
echo "  🌐 Starting Web Tier (Nginx Only)"
echo "═══════════════════════════════════════════════════════"

# Start Nginx
echo "1. Starting Nginx..."
sudo systemctl start nginx
sudo systemctl status nginx --no-pager | head -3

# Verify Web Tier
echo ""
echo "═══════════════════════════════════════════════════════"
echo "  ✅ Web Tier is running!"
echo "═══════════════════════════════════════════════════════"
echo ""
echo "  📍 Access URLs:"
echo "     - HTTPS Frontend: https://taskboard.local"
echo "     - Nginx Health:  https://taskboard.local/nginx-health"
echo ""
echo "  📊 Monitoring:"
echo "     - sudo systemctl status nginx"
echo "     - sudo tail -f /var/log/nginx/taskboard_access.log"
echo ""
