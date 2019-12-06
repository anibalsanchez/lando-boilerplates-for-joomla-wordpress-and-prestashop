#!/bin/sh

cd /app/config

JPA_PATTERN_FILE=$1
APP_NAME=$2
WEBROOT=$3

echo Configuring Unite: $JPA_PATTERN_FILE, $APP_NAME, $WEBROOT

JPA_FILE=`cd $WEBROOT; find . -name "$JPA_PATTERN_FILE" -type f -printf '%P\n'`
REPLACE_JPA_FILE="s/JPA_FILE/$JPA_FILE/g"

REPLACE_APP_NAME="s/APP_NAME/$APP_NAME/g"
REPLACE_WEBROOT="s/WEBROOT/\/app\/www/g"

cat joomla-unite_tpl.xml | \
	sed $REPLACE_JPA_FILE | \
	sed $REPLACE_APP_NAME | \
    sed $REPLACE_WEBROOT \
    > $WEBROOT/joomla-unite.tmp
