#!/usr/bin/env bash
rootdir="/etc/nginxtest"
server="ubuntu@35.158.213.131"

echo "Upload contents"
# rsync -avz --delete -e 'ssh' "${server}:/etc/nginx/" "./nginx"
rsync -avz --delete -e 'ssh' "./nginx/" "${server}:nginx"
ssh ${server} "sudo rm -rf /etc/nginxbu"
ssh ${server} "sudo mv /etc/nginx /etc/nginxbu"
ssh ${server} "sudo mv nginx /etc/nginx"
ssh ${server} "sudo nginx -t"
#ssh ${server} "sudo service nginx reload"
