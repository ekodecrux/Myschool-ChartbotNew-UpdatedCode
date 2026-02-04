# MySchool Chatbot - Hostinger Deployment Guide

## Server Information
- **Server IP**: 88.222.244.84
- **SSH Access**: `ssh root@88.222.244.84`
- **Domains**: 
  - myschoolchatbot.in (Production)
  - demo.myschoolchatbot.in (Demo)

## Prerequisites
- Node.js 18+ installed
- npm or pnpm package manager
- PM2 process manager
- Nginx web server
- MySQL database

---

## Method 1: Quick Deployment

SSH into server and run:
```bash
ssh root@88.222.244.84
cd /var/www/myschool-chatbot4
git pull origin main && npm install && npm run build && pm2 restart all && pm2 save
```

---

## Method 2: Fresh Installation

### Step 1: Clone Repository
```bash
cd /var/www
git clone https://github.com/ekodecrux/myschool-chatbot4.git
cd myschool-chatbot4
```

### Step 2: Install Dependencies
```bash
npm install
```

### Step 3: Configure Environment
Create `.env` file:
```env
GROQ_API_KEY=your_groq_api_key
DATABASE_URL=mysql://user:password@localhost:3306/myschool
JWT_SECRET=your_jwt_secret
NODE_ENV=production
PORT=3000
```

### Step 4: Build Application
```bash
npm run build
```

### Step 5: Start with PM2
```bash
pm2 start npm --name "myschool-chatbot" -- start
pm2 save
pm2 startup
```

---

## Nginx Configuration

### Production Domain
File: `/etc/nginx/sites-available/myschoolchatbot.in`
```nginx
server {
    listen 80;
    server_name myschoolchatbot.in www.myschoolchatbot.in;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### Demo Domain
File: `/etc/nginx/sites-available/demo.myschoolchatbot.in`
```nginx
server {
    listen 80;
    server_name demo.myschoolchatbot.in;
    
    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### Enable Sites and Restart
```bash
sudo ln -s /etc/nginx/sites-available/myschoolchatbot.in /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/demo.myschoolchatbot.in /etc/nginx/sites-enabled/
nginx -t
sudo systemctl reload nginx
```

---

## SSL Setup (Certbot)
```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d myschoolchatbot.in -d www.myschoolchatbot.in
sudo certbot --nginx -d demo.myschoolchatbot.in
```

---

## Monitoring Commands

```bash
# Check running processes
pm2 list

# View logs
pm2 logs --lines 50

# Check errors
pm2 logs --err

# Restart services
pm2 restart all

# View Nginx logs
tail -f /var/log/nginx/error.log
```

---

## Testing Translation Feature

The chatbot supports multilingual queries:
- **Telugu**: జంతువుల చిత్రాలు (animal images)
- **Hindi**: कक्षा 5 गणित (class 5 maths)
- **Gujarati**: વિજ્ઞાન પરીક્ષા (science exam)

---

## Rollback Procedure

```bash
pm2 delete all
cd /var/www
mv myschool-chatbot4 myschool-chatbot4.failed
mv myschool-chatbot4.backup myschool-chatbot4
cd myschool-chatbot4
pm2 start npm --name "myschool-chatbot" -- start
```

---

## Post-Deployment Checklist

- [ ] Git pull successful
- [ ] Dependencies installed
- [ ] Build completed
- [ ] PM2 processes running
- [ ] Production site accessible
- [ ] Demo site accessible
- [ ] UI displays correctly
- [ ] Translation working
- [ ] No errors in logs

---

## Contact

- **Repository**: https://github.com/ekodecrux/myschool-chatbot4
- **Production**: https://myschoolchatbot.in
- **Demo**: https://demo.myschoolchatbot.in

**Developed by Abhishek & Mahesh**
