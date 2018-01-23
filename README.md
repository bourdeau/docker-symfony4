Docker Symfony 4
==================

# Install Docker
```bash
sudo usermod -aG docker ${USER}
#Restart pc
```
# Install containers
```bash
docker-compose up
# Check everything is okay
# If so take down and up
docker-compose down
docker-compose up -d

# Put your Symfony 4 application in /app
# In your .env set 'mysql' for the host
# Ex: DATABASE_URL=mysql://root:yourpassword@mysql:3306/symfony
```


# Memo

## Build project
```bash
docker-compose up -d
```

## List container
```bash
docker-compose ps
```

## Take down container and remove
```bash
docker-compose down --volumes

docker-compose down --remove-orphans
```

## List images
```bash
docker images
```

## Delete image
```bash
docker rmi --force <ID_IMAGE>
```

## Connect SSH to container
```bash
docker exec -t -i <ID_CONTAINER> bash
```

## Show volumes
```bash
docker volume ls
```
