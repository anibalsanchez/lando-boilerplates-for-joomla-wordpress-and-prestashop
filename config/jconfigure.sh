#!/bin/sh

cd /app/www

cat configuration.php | \
    sed "s/$lifetime = '15'/$lifetime = '150'/g" | \
    sed "s/$smtphost = 'localhost'/$smtphost = 'mailhog'/g" | \
    sed "s/$smtpport = '25'/$smtpport = '1025'/g" \
    > configuration.mydefault.php

rm -f configuration.php
cp configuration.mydefault.php configuration.php
rm configuration.mydefault.php