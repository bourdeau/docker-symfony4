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
You are done !
