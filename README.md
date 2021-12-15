# Yii2 fpm docker-compose template

### This config of docker-compose uses the following Docker builds
1. [nginx](https://registry.hub.docker.com/_/nginx)
2. [postgres](https://registry.hub.docker.com/_/postgres)
3. [php:7.4-fpm](https://hub.docker.com/_/php)

### That it is
This is the docker-compose template for Yii2 on PHP 7.4 fpm, Nginx (this template use 1.17.8) and PostgreSQL (this template use 10.19).
You can use this template to quickly set up docker-compose in your project.

### How use this template
1. Replace the word `yii2advanced` in all files (_you can skip this point_)
2. Copy `docker-compose.yml` file and `docker/` directory to root of your Yii2 project
3. Change nginx config files at `docker/nginx/configs/` for your project
4. Generate self-signed ssl certificate for nginx ([DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04)).
You can use the sample certificate files from `docker/nginx/certs/`
5. Add to your `/etc/hosts` file this line: `127.0.0.1 local.yousitedomain.com local.admin.yousitedomain.com`
6. Run `docker-compose up -d` at your project

[//]: # (test)
