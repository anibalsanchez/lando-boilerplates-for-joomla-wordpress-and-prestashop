#!/bin/sh

cd /app/www

cp -f configuration.php configuration.php.bak

cat configuration.php.bak | \
	sed "s/\$mailer = '[^']\+'/\$mailer = 'smtp'/g" | \
    sed "s/\$caching = '[^']\+'/\$caching = '0'/g" | \
    sed "s/\$error_reporting = '[^']\+'/\$error_reporting = 'default'/g" | \
    sed "s/\$force_ssl = '[^']\+'/\$force_ssl = '0'/g" | \
    sed "s/\$gzip = '[^']\+'/\$gzip = '0'/g" | \
    sed "s/\$lifetime = '[^']\+'/\$lifetime = '150'/g" | \
    sed "s/\$sef = '[^']\+'/\$sef = '0'/g" | \
    sed "s/\$smtpauth = '[^']\+'/\$smtpauth = '0'/g" | \
    sed "s/\$smtphost = '[^']\+'/\$smtphost = 'mailhog'/g" | \
    sed "s/\$smtppass = '[^']\+'/\$smtppass = ''/g" | \
    sed "s/\$smtpport = '[^']\+'/\$smtpport = '1025'/g" | \
    sed "s/\$smtpsecure = '[^']\+'/\$smtpsecure = 'none'/g" | \
    sed "s/\$smtpuser = '[^']\+'/\$smtpuser = ''/g" \
    > configuration.php.new
cp -f configuration.php.new configuration.php
rm configuration.php.new

mv plugins/system/adaptiveimagesforjoomla plugins/system/adaptiveimagesforjoomla.disabled 2> /dev/null
mv plugins/system/admintools plugins/system/admintools.disabled 2> /dev/null
mv plugins/system/cdnforjoomla plugins/system/cdnforjoomla.disabled 2> /dev/null
mv plugins/system/jch_optimize plugins/system/jch_optimize.disabled 2> /dev/null
mv plugins/system/jotcache plugins/system/jotcache.disabled 2> /dev/null
mv plugins/system/jotmarker plugins/system/jotmarker.disabled 2> /dev/null
mv plugins/twofactorauth plugins/twofactorauth.disabled 2> /dev/null

mv .htaccess htaccess.disabled 2> /dev/null
cp htaccess.txt .htaccess 2> /dev/null

echo Configured!