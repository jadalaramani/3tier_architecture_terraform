# #!/bin/bash
#     sudo apt update -y
#     curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
#     sudo apt-get install -y nodejs -y
#     sudo apt update -y
#     sudo npm install -g corepack -y
#     corepack enable
#     corepack prepare yarn@stable --activate
#     sudo npm install -g pm2
#!/bin/bash
sudo apt update -y
sudo pm2 startup
sudo env PATH=$PATH:/usr/bin /usr/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
sudo systemctl start pm2-root
sudo systemctl enable pm2-root 