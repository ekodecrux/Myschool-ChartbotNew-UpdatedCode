#!/bin/bash

# MySchool Chatbot Deployment Script
# Usage: bash deploy.sh

set -e

echo "=========================================="
echo "MySchool Chatbot Deployment"
echo "=========================================="
echo ""

APP_DIR=$(pwd)
echo "Application directory: $APP_DIR"
echo ""

# Step 1: Backup
echo "Creating backup..."
BACKUP_DIR="${APP_DIR}.backup-$(date +%Y%m%d-%H%M%S)"
if [ -d "$APP_DIR" ]; then
    cp -r "$APP_DIR" "$BACKUP_DIR"
    echo "Backup created: $BACKUP_DIR"
fi
echo ""

# Step 2: Pull latest code
echo "Pulling latest changes from GitHub..."
if git pull origin main; then
    echo "Git pull successful"
else
    echo "Git pull failed"
    exit 1
fi
echo ""

# Step 3: Install dependencies
echo "Installing dependencies..."
if npm install; then
    echo "Dependencies installed"
else
    echo "npm install failed"
    exit 1
fi
echo ""

# Step 4: Build
echo "Building application..."
if npm run build; then
    echo "Build successful"
else
    echo "Build failed"
    exit 1
fi
echo ""

# Step 5: Restart PM2
echo "Restarting PM2 processes..."
if pm2 restart all; then
    echo "PM2 restarted"
else
    echo "PM2 restart had issues, starting fresh..."
    pm2 delete all 2>/dev/null || true
    pm2 start npm --name "myschool-chatbot" -- start
fi
echo ""

# Step 6: Save PM2 configuration
echo "Saving PM2 configuration..."
pm2 save
echo "PM2 configuration saved"
echo ""

# Step 7: Show status
echo "Current PM2 Status:"
pm2 list
echo ""

# Step 8: Test endpoint
echo "Testing endpoints..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:3000 | grep -q "200"; then
    echo "Application responding"
else
    echo "Application not responding"
fi
echo ""

# Summary
echo "=========================================="
echo "Deployment Complete"
echo "=========================================="
echo ""
echo "Backup location: $BACKUP_DIR"
echo ""
echo "Verify:"
echo "1. https://myschoolchatbot.in"
echo "2. https://demo.myschoolchatbot.in"
echo ""
echo "Commands:"
echo "  View logs: pm2 logs"
echo "  Restart: pm2 restart all"
echo "=========================================="
