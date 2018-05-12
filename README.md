
# Lando Boilerplates

Recipes for Lando - Docker containers. Tested with Joomla, WordPress, PrestaShop, Laravel, Symphony, etc.

## Joomla Template

### Step 1 - Review and Customize the Recipe

Remember to replace the **$replace-with-a-name$**.

### Step 2 - Review and Customize the Recipe

To start the Docker container:

    lando start

### Step 3 - Optional - Available Commands

To access the mysql server:

    lando mysql

To download and extract Joomla 3 (after the extraction, visit one of the APPSERVER URLS to complete the installation):

    lando install

To download and extract Joomla 4 (after the extraction, visit one of the APPSERVER URLS to complete the installation):

    lando install-j4

To apply my dev configuration to a J site:

    lando dev-config

To download and extract an Akeeba backup with [kickstart](https://www.akeebabackup.com/products/akeeba-kickstart.html):

    lando kick-restore

To extract and install an Akeeba backup with [unite](https://www.akeebabackup.com/products/akeeba-unite.html):

    lando unite-restore

### LAMP Template

### WordPress Template


## Copyright

- Copyright (c)2007-2018 Extly, CB. All rights reserved.
- Distributed under the GNU General Public License version 3 or later
