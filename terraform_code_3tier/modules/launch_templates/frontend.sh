# #!/bin/bash
# sudo apt update -y
# sudo apt install apache2 -y
# curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
# sudo apt-get install -y nodejs -y
# sudo apt update -y
# sudo npm install -g corepack -y
# corepack enable
# corepack prepare yarn@stable --activate
# sudo npm install -g pm2 

#!/bin/bash
sudo apt update -y
sleep 90
sudo systemctl start apache2.service 