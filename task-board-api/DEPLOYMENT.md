# Deployment Guide - Week 5

## Server Information

- **VM OS:** Ubuntu Server 22.04 LTS
- **VM IP:** 192.168.56.101 (example - yours may differ)
- **SSH Access:** ssh devlab@192.168.56.101
- **API Endpoint:** http://192.168.56.101:3000

## Architecture

```
Local Machine (Client)          Virtual Machine (Server)
─────────────────────           ────────────────────────
Frontend (Browser)     ─HTTP─>  Backend (Node.js + PM2)
http://localhost:8080           http://192.168.56.101:3000
                                        │
                                        ▼
                                   Database (SQLite)
```

## Deployment Steps

### 1. Access VM
```bash
ssh devlab@192.168.56.101
password: [your-vm-password]
```

### 2. Navigate to Project
```bash
cd ~/projects/task-board-api
```

### 3. Update Code (if using Git)
```bash
git pull origin main
npm install
```

### 4. Restart Application
```bash
pm2 restart task-board-api
```

### 5. Check Status
```bash
pm2 status
pm2 logs task-board-api --lines 20
```

## Accessing Services

### API (from local machine)
```
http://192.168.56.101:3000/api/tasks
http://192.168.56.101:3000/api/tasks/stats
```
### Frontend (local)
```
http://localhost:8080
```
## Troubleshooting

### API not accessible
```bash
# Check if PM2 is running
pm2 status

# Check firewall
sudo ufw status

# Check if port is listening
sudo netstat -tlnp | grep 3000
```

### Database errors
```bash
# Check database file
ls -lh database/tasks.db

# Test database connection
sqlite3 database/tasks.db "SELECT COUNT(*) FROM tasks;"
```

### Application crashes
```bash
# View error logs
pm2 logs task-board-api --err

# Restart app
pm2 restart task-board-api

# If persistent issues:
pm2 delete task-board-api
pm2 start ecosystem.config.js
```

## Maintenance

### Daily Checks
- `pm2 status` - Check if app is running
- `pm2 logs --lines 20` - Review recent logs

### Weekly Tasks
- `pm2 flush` - Clear old logs
- Check disk space: `df -h`

### Updates
```bash
cd ~/projects/task-board-api
git pull
npm install
pm2 restart task-board-api
```
