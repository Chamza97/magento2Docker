# Magento2 docker compose

### prerequisite
You should install [docker](https://docs.docker.com/engine/installation) and [docker compose](https://docs.docker.com/compose/install/) before using this repo to setup Magento2 environment.

### Magento2 install

Install full magento2 environment including magento2 pre-installed with sample data using only  **one** command line:
```sh
docker-compose up
```
### Test in browser
Magento application is accessible on : [local.magento2](http://local.magento2)


### Executing  docker-compose up will:
 1- create 3 docker containers : nginx , php-fpm (xdebug included) and mariadb.

 2- fetch magento2 from official repo.
 
 3- install magento2.
 
 4- install sample-data.

 5- set files owner + permissions.




