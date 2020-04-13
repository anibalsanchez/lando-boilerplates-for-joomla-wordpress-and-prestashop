#!/bin/bash

WEBROOT=$1
JPA_FILE=${2##--jpa_filename=}".jpa"

rm $WEBROOT/joomla-unite.xml
rm $WEBROOT/unite.phar
rm $WEBROOT/*.jpa
echo $JPA_FILE Backup installed successfully