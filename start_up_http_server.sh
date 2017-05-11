sed -i '/local.magento2/d'  /etc/hosthosts
awk 'END{print $1 " local.magento2"}' /etc/hosts >> /etc/hosthosts
nginx -g 'daemon off;'
