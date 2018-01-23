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

docker-compose up
# Check everything is okay
# If so take down and up
docker-compose down
docker-compose up -d
```

Put your Symfony 4 application in /app
In your .env set 'mysql' for the host
Ex: DATABASE_URL=mysql://root:yourpassword@mysql:3306/symfony

Then: http://localhost:8080

## Bug
- Apache doesn't start properly...

```bash
docker exec -t -i <ID_CONTAINER_APACHE> bash
service apache2 restart
```
