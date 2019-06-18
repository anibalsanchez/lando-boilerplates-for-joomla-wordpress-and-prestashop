# Lando Boilerplates for Joomla, WordPress and PrestaShop

**REQUIREMENTS**: Lando 3.0.0-RC.2+ - Tested on 3.0.0-RC.17. Download the latest Lando release from: <https://github.com/lando/lando/releases>.

Recipes for [Lando](https://docs.devwithlando.io/) - Docker containers. Tested with Joomla, WordPress, PrestaShop, etc.

These Recipes configure a local development site based on Lando and Docker with the most common tools for Lamp and CMS development. It is based on [Lando](https://docs.devwithlando.io/) and Docker. So, all the available tooling can also be applied to these recipes.

> For a general introduction: [Devops with Lando and Docker](https://extly.tech/media/devops-with-lando-and-docker/index.html#/), By Anibal Sanchez, Extly.Tech. Ubucon Europe - Xixón, Spain - 27-29th of April 2018. Slides: [joo.nu/devops](http://joo.nu/devops)

In my practice, I have configured the recipes to have the following services:

- A LAMP site, on the `www` folder
- phpMyAdmin, to handle the administration of MySQL
- MailHog, to handle SMTP testing of mails

## How to Start

- Choose which CMS you want to install and copy only those files into the destination folder `mydevsite` (remember to also copy the hidden `.lando.yml`). Follow the next steps.

## Joomla Recipe

### Step 1 - Review and Customize the Recipe

Open the `.lando.yml` and replace the `$replace-with-a-name$` (including the $) with the **myname** of your local development site.

The recipe is going to create:

- A site with the **myname**

A database with these connection settings:

- Host Name: database
- User **mynamedb**
- Password **mynamedb**
- Database: **mynamedb**

### Step 2 - Review and Customize the Recipe for Joomla

- To start the Docker container:

    `lando start`

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

    `lando stop`

- To restart the Docker container:

   `lando restart`

- To rebuild the Docker container:

    `lando rebuild`

- To destroy the Docker container (destroy for ever):

    `lando destroy`

- To access the mysql server:

    `lando mysql`

### Step 3 - Optional commands for Joomla

- To download the latest [Joomla](https://www.joomla.org) zip file and extract it to the _www_ folder:

    `lando install`

 After extraction, visit one of the APPSERVER URLS to complete the installation. For example: http://localhost:8080.

- To apply my development configuration to a site:

    `lando dev-config`

This is handy script to disable security plugins, CDNs, disable cache, configure the MailHog, etc.

- To download and extract an Akeeba backup with [kickstart](https://www.akeebabackup.com/products/akeeba-kickstart.html):

    `lando kick-restore`

After the extraction, visit the site to complete the installation. For instance: http://localhost:8080/k.php.

After the installation, remember to execute `lando dev-config`, to apply the best practices.

- To extract and install an Akeeba backup with [unite](https://www.akeebabackup.com/products/akeeba-unite.html):

    `lando unite-restore`

After the installation, remember to execute `lando dev-config`, to apply the best practices.

### Step 4 - Optional commands for Joomla - JMAD18 SPECIAL EDITION

- To intall an extension

    `lando install-extension`

The extension must be copied into the tmp/ folder and named "the-extension.zip".

- To intall the *Patch Tester* for the Joomla, Pizza, Bugs and Fun session.

    `lando install-patchtester`

### WordPress Recipe

### Step 1 - Review and Customize the Recipe for WordPress

Open the `.lando.yml` and replace the **wp_tpl** with the **myname** of your local development site.

The recipe is going to create:

- A site with the **myname**

A database with these connection settings:

- Host Name: database
- User **mynamedb**
- Password **mynamedb**
- Database: **mynamedb**

### Step 2 - Review and Customize the Recipe

- To start the Docker container:

    `lando start`

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

    `lando stop`

- To restart the Docker container:

   `lando restart`

- To rebuild the Docker container:

    `lando rebuild`

- To destroy the Docker container (destroy for ever):

    `lando destroy`

- To access the mysql server:

    `lando mysql`

### Step 3 - Optional commands for WordPress

To install [WordPress](https://wordpress.org/), you can download the latest WordPress zip file and extract it to the _www_ folder, then install it from there following the usual process. As a handy way to support it in the receipe, I have configured a command, based on Lando [tooling](https://docs.devwithlando.io/config/tooling.html) to use [WP CLI](https://wp-cli.org/), to install Wordpress and Gutenberg plugin with a single line:

    lando wp-install

### PrestaShop Recipe

#### Step 1 - Review and Customize the PrestaShop Recipe

Open the `.lando.yml` and replace the `$replace-with-a-name$` (including the $) with the **myname** of your local development site. For instance, in this sample recipe, `$replace-with-a-name$` has been replaced with `ps`.

The recipe is going to create:

- A site with the **myname**. In this sample recipe, `ps`.

A database with these connection settings:

- Host Name: database
- User **mynamedb** (`psdb`)
- Password **mynamedb** (`psdb`)
- Database: **mynamedb** (`psdb`)

#### Step 2 - Review and Customize the Recipe for PrestaShop

- To start the Docker container:

    `lando start`

After starting the container, you will receive a command line output like this one:

```bash
BOOMSHAKALAKA!!!

Your app has started up correctly.
Here are some vitals:

 NAME            ps
 LOCATION        /home/anibal/3_VM/ps
 SERVICES        appserver, database, pma, mailhog
 APPSERVER URLS  https://localhost:33887
                 http://localhost:8080
                 http://localhost:33886
                 http://ps.lndo.site
                 https://ps.lndo.site
 PMA URLS        http://localhost:33888
                 http://phpmyadmin.lndo.site
                 https://phpmyadmin.lndo.site
 MAILHOG URLS    http://localhost:33885
                 http://mailhog.lndo.site
                 https://mailhog.lndo.site
```

Great! The site is ready, and available on APPSERVER URLS, there is also a phpmyadmin and a mailhog.

- To stop the Docker container:

    `lando stop`

- To restart the Docker container:

   `lando restart`

- To rebuild the Docker container:

    `lando rebuild`

- To destroy the Docker container (destroy for ever):

    `lando destroy`

- To access the mysql server:

    `lando mysql`

#### Step 3 - Optional commands for PrestaShop

- To install the latest [PrestaShop](https://www.joomla.org), please [download](https://www.prestashop.com/en/previous-versions) the zip file (<https://www.prestashop.com/en/previous-versions>) and copy it into the _www_ folder. Then, execute this command:

    `lando install`

After installation, visit one of the APPSERVER URLS. In our case, https://ps.lndo.site.

## Copyright & License

- Copyright (c)2007-2019 Extly, CB. All rights reserved.
- Distributed under the MIT license
