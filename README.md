# Lando Boilerplates for Joomla, WordPress, PrestaShop

Recipes for [Lando](https://docs.devwithlando.io/) - Docker containers. Tested with Joomla, WordPress, PrestaShop, etc.

These Recipes configure a local development site based on Lando and Docker with the most common tools for Lamp and CMS development. It is based on [Lando](https://docs.devwithlando.io/) and Docker. So, all the available tooling can also be applied to these recipes.

> For a general introduction: [Devops with Lando and Docker](https://extly.tech/media/devops-with-lando-and-docker/index.html#/), By Anibal Sanchez, Extly.Tech. Ubucon Europe - Xixón, Spain - 27-29th of April 2018. Slides: [joo.nu/devops](http://joo.nu/devops)

In my practice, I have configured the recipes to have the following services:

- A LAMP site, on the `www` folder
- phpMyAdmin, to handle the administration of MySQL
- MailHog, to handle SMTP testing of mails

**Mise en place**: Clone this repository and create a destination folder `mydevsite` for your new local development site. Choose which CMS you want to install and copy all files to the destination folder `mydevsite` (remember to also copy the hidden `.lando.yml`). Follow the next steps.

## Joomla Template

### Step 1 - Review and Customize the Recipe

Open the `.lando.yml` and replace the **$replace-with-a-name$** (including the $) with the **myname** of your local development site.

The recipe is going to create:

- A site with the **myname**

A database with these connection settings:

- Host Name: database
- User **mynamedb**
- Password **mynamedb**
- Database: **mynamedb**

### Step 2 - Review and Customize the Recipe

- To start the Docker container:

    lando start

After starting the container, you will receive a command line output like this one:

    BOOMSHAKALAKA!!!

    Your app has started up correctly.
    Here are some vitals:

    NAME            myname
    LOCATION        /home/myuser/mysites/mydevsite
    SERVICES        appserver, database, pma, mailhog

    APPSERVER URLS  https://localhost:32775
                    http://localhost:8080
                    http://localhost:32774
                    http://myname.lndo.site
                    https://myname.lndo.site

    PMA URLS        http://localhost:32769
                    http://phpmyadmin.lndo.site
                    https://phpmyadmin.lndo.site

    MAILHOG URLS    http://localhost:32773
                    http://mailhog.lndo.site
                    https://mailhog.lndo.site

Great! The site is ready, and available on APPSERVER URLS, there is also a phpmyadmin and a mailhog.

- To stop the Docker container:

    lando stop

- To restart the Docker container:

    lando restart

- To rebuild the Docker container:

    lando rebuild

- To destroy the Docker container (destroy for ever):

    lando destroy

- To access the mysql server:

    lando mysql

### Step 3 - Optional commands for Joomla

- To download the latest [Joomla](https://www.joomla.org) zip file and extract it to the _www_ folder:

    lando install

 After extraction, visit one of the APPSERVER URLS to complete the installation. For example: http://localhost:8080.

- To apply my development configuration to a site:

    lando dev-config

This is handy script to disable security plugins, CDNs, disable cache, configure the MailHog, etc.

- To download and extract an Akeeba backup with [kickstart](https://www.akeebabackup.com/products/akeeba-kickstart.html):

    lando kick-restore

After the extraction, visit the site to complete the installation. For instance: http://localhost:8080/k.php.

After the installation, remember to execute `lando dev-config`, to apply the best practices.

- To extract and install an Akeeba backup with [unite](https://www.akeebabackup.com/products/akeeba-unite.html):

    lando unite-restore

After the installation, remember to execute `lando dev-config`, to apply the best practices.

### LAMP Template

### WordPress Template

## Copyright

* Copyright (c)2007-2018 Extly, CB. All rights reserved.
* Distributed under the MIT license
