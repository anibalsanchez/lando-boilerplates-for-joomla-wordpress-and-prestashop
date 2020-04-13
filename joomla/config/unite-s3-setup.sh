#!/bin/bash

MYSQL_DATABASE=$1
MYSQL_USER=$2
MYSQL_PASSWORD=$3
WEBROOT=$4
APP_NAME=$5
XML_PATTERN_FILE=$6
JPA_FILE=${7##--jpa_filename=}".jpa"
BUCKET_NAME=${8##--s3_bucket=}
REGION_NAME=${9##--s3_region=}
JPA_FILEPATH=${10##--s3_filepath=}${JPA_FILE}

echo Resetting the database $1 ...

mysql -h database -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE << MYSQL
	DROP DATABASE IF EXISTS $MYSQL_DATABASE;
	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
MYSQL

echo deleting all folders and files in /www folder ...

if [ "$(ls -A $WEBROOT)" ]; then
	rm -rf $WEBROOT;
	mkdir $WEBROOT;
fi

echo Configuring Unite: $JPA_FILE, $APP_NAME, $WEBROOT from $XML_PATTERN_FILE
echo Amazon s3 configuration: bucket: $BUCKET_NAME, region: $REGION_NAME, filepath and filename: $JPA_FILEPATH

REPLACE_JPA_FILE="s/JPA_FILE/$JPA_FILE/g"
REPLACE_BUCKET_NAME="s/BUCKET_NAME/$BUCKET_NAME/g"
REPLACE_REGION_NAME="s/REGION_NAME/$REGION_NAME/g"
REPLACE_JPA_FILEPATH="s#JPAFILEPATH#${JPA_FILEPATH}#g"

REPLACE_APP_NAME="s/APP_NAME/$APP_NAME/g"
REPLACE_WEBROOT="s/WEBROOT/\/app\/www/g"

cd /app/config

echo creating joomla-unite from $XML_PATTERN_FILE to $WEBROOT
cat $XML_PATTERN_FILE | \
	sed $REPLACE_JPA_FILE | \
	sed $REPLACE_BUCKET_NAME | \
	sed $REPLACE_REGION_NAME | \
	sed $REPLACE_JPA_FILEPATH | \
	sed $REPLACE_APP_NAME | \
    sed $REPLACE_WEBROOT \
    > $WEBROOT/joomla-unite.tmp