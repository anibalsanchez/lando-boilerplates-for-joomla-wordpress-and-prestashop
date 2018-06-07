# Lando Boilerplates

Recipes for Lando - Docker containers. Tested with Joomla, WordPress, PrestaShop, Laravel, Symphony, etc.

**Mise en place**: Clone this repository and create a _destination folder_ for your new local development site. Choose which CMS you want to install and copy all files to the _destination folder_ (remember to also copy the hidden `.lando.yml`). Follow the next steps.

## Joomla Template

### Step 1 - Review and Customize the Recipe

Open the `.lando.yml` and replace the **$replace-with-a-name$** (including the $) with the **name** of your local development site.

The recipe is going to create:

- A site with the **name**
- A database withe user **namedb**, password **namedb** and schema **namedb**.

### Step 2 - Review and Customize the Recipe

To start the Docker container:

    lando start

To stop the Docker container:

    lando stop

To restart the Docker container:

    lando stop

To rebuild the Docker container:

    lando rebuild

To destroy the Docker container (destroy for ever):

    lando destroy

### Step 3 - Optional Commands

To access the mysql server:

    lando mysql

To download and extract (after the extraction, visit one of the APPSERVER URLS to complete the installation):

    lando install

To apply my development configuration to a site:

    lando dev-config

To download and extract an Akeeba backup with [kickstart](https://www.akeebabackup.com/products/akeeba-kickstart.html):

    lando kick-restore

To extract and install an Akeeba backup with [unite](https://www.akeebabackup.com/products/akeeba-unite.html):

    lando unite-restore

### LAMP Template

### WordPress Template

## Copyright

* Copyright (c)2007-2018 Extly, CB. All rights reserved.
* Distributed under the MIT license
