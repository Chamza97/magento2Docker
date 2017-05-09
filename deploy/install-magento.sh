if [ ! -f ../www/composer.json ]; then
composer config --global http-basic.repo.magento.com  d513194cb7498ee45e3c079d4b7f84f9  bbdca044e99d729250add110a9441a92 \
  && composer create-project --repository-url=https://repo.magento.com/ \
  magento/project-community-edition ../www -vvv

else
 echo 'Magento2 source code seems to be already downloaded - skipped'
fi

chmod u+x ../www/bin/magento

../www/bin/magento setup:install \
--base-url=http://local.magento2/ \
--db-host=database.magento2 \
--db-name=magento2 \
--db-user=magento2 \
--db-password=magento2 \
--admin-firstname=Magento \
--admin-lastname=User \
--admin-email=user@example.com \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=USD \
--timezone=America/Chicago \
--use-rewrites=1 \
--cleanup-database \
--use-sample-data



chown -R www-data:www-data ../www
