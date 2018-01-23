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
# Edit SYMFONY_PATH to set your Symfony path app

docker-compose up -d
```
You are done

## Set up your Symfony4 application

```bash
# The path you defined above in .env
cd $SYMFONY_PATH
vim .env
# Set DATABASE_URL to mysql://symfony:symfonypass@mysql:3306/symfony
```

## Bug
- Apache doesn't start properly...

```bash
docker exec -it apache bash
service apache2 start
```
