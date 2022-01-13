#!/usr/bin/env bash
# Prepare my webservers (web-01 & web-02)

# uncomment for easy debugging
#set -x

# colors
blue='\e[1;34m'
brown='\e[0;33m'
green='\e[1;32m'
reset='\033[0m'

echo -e "${blue}Updating and doing some minor checks...${reset}\n"

function install() {
	command -v "$1" &> /dev/null

	#shellcheck disable=SC2181
	if [ $? -ne 0 ]; then
		echo -e "	Installing: ${brown}$1${reset}\n"
		sudo apt-get update -y -qq && \
			sudo apt-get install -y "$1" -qq
		echo -e "\n"
	else
		echo -e "	${green}${1} is already installed.${reset}\n"
	fi
}

install nginx #install nginx

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
if [ -d "/data/web_static/releases/test/" ]; then
	#shellcheck disable=SC2154
	echo "$index_file" | sudo dd status=none of=/data/web_static/releases/test/index.html
fi

# create symbolic link
if [[ -L "/data/web_static/current" && -d "/data/web_static/current" ]]; then
	sudo rm -rf /data/web_static/current
	sudo ln -s /data/web_static/releases/test /data/web_static/current
else
	sudo ln -s /data/web_static/releases/test /data/web_static/current
fi

# give user ownership to directory
sudo chown -R "$USER":"$USER" /data/

# backup default server config file
sudo cp /etc/nginx/sites-enabled/default nginx-sites-enabled_default.backup

server_config=\
"server {
		listen 80 default_server;
		listen [::]:80 default_server;
		root /var/www/html;
		index index.html index.htm index.nginx-debian.html
		server_name_;
		add_header X-Served-By \$hostname;
		location /hbnb_static {
			alias /data/web_static/current/;
		}
		if (\$request_filename ~ redirect_me){
			rewrite ^ https://th3-gr00t.tk/ permanent;
		}
}"

#shellcheck disable=SC2154
echo "$server_config" | sudo dd status=none of=/etc/nginx/sites-enabled/default

if [ "$(pgrep -c nginx)" -le 0 ]; then
	sudo service nginx start
else
	sudo service nginx restart
fi
