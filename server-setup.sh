#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g typescript
sudo npm install -g forever
sudo npm install -g yarn

# nginx
sudo apt-get install nginx

# letsencrypt
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

sudo certbot certonly --webroot --webroot-path=/home/ubuntu/mailchimp -d mailchimp.tsmean.com

ln -s /etc/letsencrypt/live/mailchimp.tsmean.com/privkey.pem /etc/nginx/ssl/nginx.key
ln -s /etc/letsencrypt/live/mailchimp.tsmean.com/fullchain.pem /etc/nginx/ssl/nginx.crt

# strong diffie hellman
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# Cronjobs: sudo crontab -e
# 15 3 * * * /usr/bin/certbot renew --quiet --renew-hook "/bin/systemctl reload nginx"
