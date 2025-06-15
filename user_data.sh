#!/bin/bash
yum update -y
yum install -y docker git curl

systemctl enable docker
systemctl start docker

# Install Node.js 20
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
yum install -y nodejs

usermod -aG docker ec2-user

# Clone and run React app
cd /home/ec2-user
git clone https://github.com/Ahmeddraaza/fruit-db-app.git
cd reactapp

# If you have Dockerfile in your repo root
docker build -t reactapp .

# Assuming your React app exposes port 3000 (update if different)
docker run -d -p 80:80 reactapp


