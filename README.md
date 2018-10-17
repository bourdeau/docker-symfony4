Docker Symfony 4
==================

## Install Docker

See doc: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

```bash
sudo usermod -aG docker ${USER}
sudo reboot
```

## Install docker-symfony4 & containers

```bash
git clone https://github.com/bourdeau/docker-symfony4.git && cd docker-symfony4

vim .env
# Edit env variables to match your application

docker-compose up -d
```

## Set up your Symfony4 application

```bash
# The path you defined above in .env
cd $SYMFONY_PATH
vim .env
# Set DATABASE_URL with the env variable you defined above
```

You are done!

Visit: http://localhost:8080


## Connect to a container

```bash
docker exec -it <CONTAINER_NAME> bash

# Composer is intalled in the apache container so you can:
cd /var/www/app && composer install --prefer-dist
```

## Deploy to Heroku

```bash
# Create the app
heroku create bourdeau-symfony

# Push the app
heroku container:push symfony --app bourdeau-symfony

# Add a dyno
heroku ps:scale symfony=1

heroku container:release symfony
heroku open --app bourdeau-symfony

heroku logs --tail

# List dyno

heroku ps
# Restart a dyno
heroku restart symfony.1
```
