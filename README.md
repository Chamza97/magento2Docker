# Magento2 docker compose

Install a full magento2 environment including magento2 pre-installed and ready to go with only **one** command line
```sh
sudo docker-compose up
```

### Executing a docker compose up will
 1- reate 3 docker containers : nginx , php-fpm (xdebug included) and mariadb
 2- fetch magento2 from official repo 
 3- set files ouner + permissions 
 4- install magento2
 5- install sample-data


