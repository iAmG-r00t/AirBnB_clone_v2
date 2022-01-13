#!/usr/bin/env bash
# Prepare my webservers (web-01 & web-02)

# uncomment for easy debugging
#set -x

# colors
blue='\e[1;34m'
#brown='\e[0;33m'
green='\e[1;32m'
reset='\033[0m'

echo -e "${blue}Updating and doing some minor checks...${reset}\n"

sudo apt-get update -y -qq && \
	sudo apt-get install -y nginx -qq #install nginx

echo -e "\n${blue}Setting up some minor stuff.${reset}\n"

# allowing nginx on firewall
sudo ufw allow 'Nginx HTTP'

# Create directories...
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared

index_file=\
"<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>"

# create index.html for test directory
#shellcheck disable=SC2154
echo "$index_file" | sudo dd status=none of=/data/web_static/releases/test/index.html

# delete symlink directory if it exists
if [ -d "/data/web_static/current" ]; then
	sudo rm -rf /data/web_static/current
fi

# create symbolic link
sudo ln -s /data/web_static/releases/test /data/web_static/current

# give user ownership to directory
sudo chown -R "$USER":"$USER" /data/

# backup default server config file
sudo cp /etc/nginx/sites-enabled/default nginx-sites-enabled_default.backup

NEW_STRING="\\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n"
sudo sed -i "38i $NEW_STRING" /etc/nginx/sites-available/default

if [ "$(pgrep -c nginx)" -le 0 ]; then
	sudo service nginx start
else
	sudo service nginx restart
fi

echo -e "${green}Completed${reset}"
