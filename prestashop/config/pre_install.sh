#!/bin/sh

echo "$MYSQL_DATABASE Installing PrestaShop ... (User pub@prestashop.com - Password 0123456789)"
unzip -o $LANDO_WEBROOT/prestashop_*.zip -d $LANDO_WEBROOT/
unzip -o $LANDO_WEBROOT/prestashop.zip -d $LANDO_WEBROOT/

