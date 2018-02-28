#!/bin/sh

sed -i s/DBNAME/${DBNAME}/g /var/www/site/orangehrm-3.3.2/lib/confs/Conf.php
sed -i s/DBPORT/${DBPORT}/g /var/www/site/orangehrm-3.3.2/lib/confs/Conf.php
sed -i s/DBUSERNAME/${DBUSERNAME}/g /var/www/site/orangehrm-3.3.2/lib/confs/Conf.php
sed -i s/DBPASSWD/${DBPASSWD}/g /var/www/site/orangehrm-3.3.2/lib/confs/Conf.php
sed -i s/DBHOST/${DBHOST}/g /var/www/site/orangehrm-3.3.2/lib/confs/Conf.php




sed -i s/DBNAME/${DBNAME}/g /var/www/site/orangehrm-3.3.2/symfony/config/databases.yml
sed -i s/DBPORT/${DBPORT}/g /var/www/site/orangehrm-3.3.2/symfony/config/databases.yml
sed -i s/DBUSERNAME/${DBUSERNAME}/g /var/www/site/orangehrm-3.3.2/symfony/config/databases.yml
sed -i s/DBPASSWD/${DBPASSWD}/g /var/www/site/orangehrm-3.3.2/symfony/config/databases.yml
sed -i s/DBHOST/${DBHOST}/g /var/www/site/orangehrm-3.3.2/symfony/config/databases.yml


/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
