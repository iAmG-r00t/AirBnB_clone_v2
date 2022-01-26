# 0x03. AirBnB clone - Deploy static 

<p align="center">
  <img src="https://s3.amazonaws.com/intranet-projects-files/holbertonschool-higher-level_programming+/288/aribnb_diagram_0.jpg?cache=off"/>
</p>

## Resource

<details>
<summary>CI/CD</summary><br>
<a href='https://postimg.cc/FkQnbL3j' target='_blank'><img src='https://i.postimg.cc/MHc2S0Gr/image.png' border='0' alt='image'/></a>
<ul>
  <li>Links from screenshot
  <ul>
      <li><a href="http://agilemanifesto.org/principles.html">Twelve Principles of Agile Software</a></li>
  </ul>
  </li>
</ul>
</details>

- [AirBnB clone](https://gracious-blackwell-eeb341.netlify.app/)
- [How to use Fabric](https://www.digitalocean.com/community/tutorials/how-to-use-fabric-to-automate-administration-tasks-and-deployments)
- [How to use Fabric in Python](https://www.pythonforbeginners.com/systems-programming/how-to-use-fabric-in-python)
- [Fabric and command line options](https://docs.fabfile.org/en/1.13/usage/fab.html)
- [Nginx configuration for beginners](https://nginx.org/en/docs/beginners_guide.html)
- [Difference between root and alias on NGINX](https://blog.heitorsilva.com/en/nginx/diferenca-entre-root-e-alias-do-nginx/)
- [Fabric for Python 3](https://github.com/fabric/fabric)
- [Fabric Documentation](https://www.fabfile.org/)

<details>
<summary>Installing Fabric</summary>

```sh
# first install python3 and pip3
sudo apt-get install python3 python3-pip

# now lets install fabric
pip3 install Fabric3
```

</details>

## Tasks

<details>
<summary><a href="./0-setup_web_static.sh">0. Prepare your web servers</a></summary><br>
<a href='https://postimg.cc/nMXBWsMz' target='_blank'><img src='https://i.postimg.cc/wxV27Lph/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./1-pack_web_static.py">1. Compress before sending</a></summary><br>
<a href='https://postimg.cc/8F6n712g' target='_blank'><img src='https://i.postimg.cc/d0HMS3n3/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./2-do_deploy_web_static.py">2. Deploy archive!</a></summary><br>
<a href='https://postimg.cc/DJbFykgS' target='_blank'><img src='https://i.postimg.cc/76KL9qJn/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./3-deploy_web_static.py">3. Full deployment</a></summary><br>

<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/dV5n5KNx/image.png' border='0' alt='image'/></a>
```sh
guillaume@ubuntu:~/AirBnB_clone_v2$ fab -f 3-deploy_web_static.py deploy -i my_ssh_private_key -u ubuntu
[52.55.249.213] Executing task 'deploy'
Packing web_static to versions/web_static_20170315015620.tgz
[localhost] local: tar -cvzf versions/web_static_20170315015620.tgz web_static
web_static/
web_static/0-index.html
web_static/1-index.html
web_static/100-index.html
web_static/2-index.html
web_static/3-index.html
web_static/4-index.html
web_static/5-index.html
web_static/6-index.html
web_static/7-index.html
web_static/8-index.html
web_static/images/
web_static/images/icon.png
web_static/images/icon_bath.png
web_static/images/icon_bed.png
web_static/images/icon_group.png
web_static/images/icon_pets.png
web_static/images/icon_tv.png
web_static/images/icon_wifi.png
web_static/images/logo.png
web_static/index.html
web_static/styles/
web_static/styles/100-places.css
web_static/styles/2-common.css
web_static/styles/2-footer.css
web_static/styles/2-header.css
web_static/styles/3-common.css
web_static/styles/3-footer.css
web_static/styles/3-header.css
web_static/styles/4-common.css
web_static/styles/4-filters.css
web_static/styles/5-filters.css
web_static/styles/6-filters.css
web_static/styles/7-places.css
web_static/styles/8-places.css
web_static/styles/common.css
web_static/styles/filters.css
web_static/styles/footer.css
web_static/styles/header.css
web_static/styles/places.css
web_static packed: versions/web_static_20170315015620.tgz -> 27280335Bytes
[52.55.249.213] put: versions/web_static_20170315015620.tgz -> /tmp/web_static_20170315015620.tgz
[52.55.249.213] run: mkdir -p /data/web_static/releases/web_static_20170315015620/
[52.55.249.213] run: tar -xzf /tmp/web_static_20170315015620.tgz -C /data/web_static/releases/web_static_20170315015620/
[52.55.249.213] run: rm /tmp/web_static_20170315015620.tgz
[52.55.249.213] run: mv /data/web_static/releases/web_static_20170315015620/web_static/* /data/web_static/releases/web_static_20170315015620/
[52.55.249.213] run: rm -rf /data/web_static/releases/web_static_20170315015620/web_static
[52.55.249.213] run: rm -rf /data/web_static/current
[52.55.249.213] run: ln -s /data/web_static/releases/web_static_20170315015620/ /data/web_static/current
New version deployed!
[54.157.32.137] Executing task 'deploy'
[54.157.32.137] put: versions/web_static_20170315015620.tgz -> /tmp/web_static_20170315015620.tgz
[54.157.32.137] run: mkdir -p /data/web_static/releases/web_static_20170315015620/
[54.157.32.137] run: tar -xzf /tmp/web_static_20170315015620.tgz -C /data/web_static/releases/web_static_20170315015620/
[54.157.32.137] run: rm /tmp/web_static_20170315015620.tgz
[54.157.32.137] run: mv /data/web_static/releases/web_static_20170315015620/web_static/* /data/web_static/releases/web_static_20170315015620/
[54.157.32.137] run: rm -rf /data/web_static/releases/web_static_20170315015620/web_static
[54.157.32.137] run: rm -rf /data/web_static/current
[54.157.32.137] run: ln -s /data/web_static/releases/web_static_20170315015620/ /data/web_static/current
New version deployed!

Done.
Disconnecting from 54.157.32.137... done.
Disconnecting from 52.55.249.213... done.
guillaume@ubuntu:~/AirBnB_clone_v2$ 
guillaume@ubuntu:~/AirBnB_clone_v2$ curl 54.157.32.137/hbnb_static/0-index.html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>AirBnB clone</title>
    </head>
    <body style="margin: 0px; padding: 0px;">
        <header style="height: 70px; width: 100%; background-color: #FF0000">
        </header>

        <footer style="position: absolute; left: 0; bottom: 0; height: 60px; width: 100%; background-color: #00FF00; text-align: center; overflow: hidden;">
            <p style="line-height: 60px; margin: 0px;">Holberton School</p>
        </footer>
    </body>
</html>
guillaume@ubuntu:~/AirBnB_clone_v2$
```

</details>

<details>
<summary><a href="./100-clean_web_static.py">3. Keep it clean!</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/MKXrvvvP/image.png' border='0' alt='image'/></a>
</details>

<details>
<summary><a href="./101-setup_web_static.pp">4. Puppet for setup</a></summary><br>
<a href='https://postimages.org/' target='_blank'><img src='https://i.postimg.cc/ZKbnzzsx/image.png' border='0' alt='image'/></a>
</details>
