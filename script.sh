if [[ ! $(mysql -h "db.magento2" -u "magento2" -pmagento2 -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='magento2'") ]]
then
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
else
    echo "Magento2 seems installed - skipped"
fi
