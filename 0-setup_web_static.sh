#!/usr/bin/env bash
# Prepare my webservers (web-01 & web-02)

# uncomment for easy debugging
#set -x

echo -e "Updating and doing some minor checks...\n"

# install nginx if not present
if [ ! -x /usr/sbin/nginx ]; then
	sudo apt-get update -y -qq && \
	     sudo apt-get install -y nginx
fi

echo -e "\nSetting up some minor stuff.\n"

# Create directories...
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared/

# create index.html for test directory
index_file=\
"<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>"
#shellcheck disable=SC2154
echo "$index_file" | sudo dd status=none of=/data/web_static/releases/test/index.html

# create symbolic link
sudo ln -sf /data/web_static/releases/test /data/web_static/current

# give user ownership to directory
sudo chown -hR ubuntu:ubuntu /data/

# backup default server config file
sudo cp /etc/nginx/sites-enabled/default nginx-sites-enabled_default.backup

# Set-up the content of /data/web_static/current/ to redirect
# to domain.tech/hbnb_static
sudo sed -i '37i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
#sudo ln -sf '/etc/nginx/sites-available/default' '/etc/nginx/sites-enabled/default'

sudo service nginx restart

echo -e "Completed"
