sh ./install-magento.sh

#printf "\n $(docker inspect $(docker ps | grep http-server.magento2 | awk '{print $1;}') | egrep IPAddress.*[0-9]+ | egrep -o [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) local.magento" > /etc/hosts
awk 'END{print $1 " local.magento2"}' /etc/hosts
php-fpm
