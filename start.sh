#!/bin/bash
APACHE_DIR="/var/www/html"
mkdir /var/www/html/glpi
GLPI_DIR="${APACHE_DIR}/glpi"
GLPI_SOURCE_URL=${GLPI_SOURCE_URL:-"https://github.com/glpi-project/glpi/releases/download/9.3.0/glpi-9.3.tgz"}

chown -R www-data $GLPI_DIR
VHOST=/etc/apache2/sites-enabled/000-default.conf

sed -i -- 's/DocumentRoot .*/DocumentRoot \/var\/www\/html\/glpi/g' $VHOST
sed -i -- '/ServerSignature /d' $VHOST
awk '/<\/VirtualHost>/{print "ServerSignature Off" RS $0;next}1' $VHOST > tmp && mv tmp $VHOST
sed -i -- '/<Directory /d' $VHOST
awk '/<\/VirtualHost>/{print "<Directory \"/var/www/html/glpi\">" RS $0;next}1' $VHOST > tmp && mv tmp $VHOST
sed -i -- '/AllowOverride All/d' $VHOST
awk '/<\/VirtualHost>/{print "AllowOverride All" RS $0;next}1' $VHOST > tmp && mv tmp $VHOST
sed -i -- '/<\/Directory/d' $VHOST
awk '/<\/VirtualHost>/{print "</Directory>" RS $0;next}1' $VHOST > tmp && mv tmp $VHOST

chown www-data .

service apache2 restart

tail -f /var/log/apache2/error.log -f /var/log/apache2/access.log
