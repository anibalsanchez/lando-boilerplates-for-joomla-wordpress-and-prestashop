#!/bin/sh

cd /app/www

cp configuration.php configuration.php.bak

cat configuration.php.bak | \
    sed "s/\$lifetime = '[^']\+'/\$lifetime = '150'/g" | \
	sed "s/\$mailer = '[^']\+'/\$mailer = 'smtp'/g" | \
    sed "s/\$smtpauth = '[^']\+'/\$smtpauth = '0'/g" | \
    sed "s/\$smtphost = '[^']\+'/\$smtphost = 'mailhog'/g" | \
    sed "s/\$smtppass = '[^']\+'/\$smtppass = ''/g" | \
    sed "s/\$smtpport = '[^']\+'/\$smtpport = '1025'/g" | \
    sed "s/\$smtpsecure = '[^']\+'/\$smtpsecure = 'none'/g" | \
    sed "s/\$smtpuser = '[^']\+'/\$smtpuser = ''/g" | \
    > configuration.php
