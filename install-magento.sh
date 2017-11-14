if [ ! -f ./src/composer.json ]; then
composer config --global http-basic.repo.magento.com  $MAG_PUBLIC_KEY  $MAG_PRIVATE_KEY \
  && composer create-project --repository-url=https://repo.magento.com/ \
  magento/project-community-edition ./src -vvv

else
 echo 'Magento2 source code seems to be already downloaded - skipped'
fi


until mysql -h "db.magento2" -u "magento2" -pmagento2; do
  >&2 echo "mariadb is unavailable - sleeping"
  sleep 1
done

chmod u+x ./src/bin/magento

(cd src && composer config  http-basic.repo.magento.com  $MAG_PUBLIC_KEY  $MAG_PRIVATE_KEY)
./src/bin/magento sampledata:deploy

./src/bin/magento setup:install \
--base-url=http://local.magento2/ \
--db-host=db.magento2 \
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


chown -R www-data:www-data ./src
