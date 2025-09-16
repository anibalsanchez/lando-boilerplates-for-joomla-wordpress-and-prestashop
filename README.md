# Lando LAMP Boilerplates

Pre-configured [Lando](https://docs.lando.dev/) recipes for rapid local development with popular CMS platforms.

## Requirements

- [Lando 3+](https://github.com/lando/lando/releases)
- Docker Desktop

## Features

- **PHP 8** with Xdebug support
- **MySQL 5.7/8.0** database
- **phpMyAdmin** for database management
- **MailHog** for email testing
- **Apache** web server
- **Composer 2** latest
- Custom tooling commands per platform

## Available Recipes

| Platform | Recipe | Description |
|----------|--------|--------------|
| Drupal | `drupal/` | Drupal 9+ development |
| Joomla | `joomla/` | Joomla 3/4 development |
| WordPress | `wordpress/` | WordPress development |
| Laravel | `laravel/` | Laravel framework |
| LAMP | `lamp/` | Generic LAMP stack |

## Quick Start

1. **Choose a recipe** and copy its files to your project directory:
   ```bash
   cp -r joomla/* /path/to/your/project/
   ```

2. **Customize the configuration**:
   - Edit `.lando.yml`
   - Replace `<NEW-CONTAINER-NAME>` with your project name

3. **Start your environment**:
   ```bash
   lando start
   ```

## Common Commands

```bash
# Start the environment
lando start

# Stop the environment
lando stop

# Restart services
lando restart

# Rebuild from scratch
lando rebuild

# Destroy environment
lando destroy

# Access MySQL CLI
lando mysql
```

## Database Configuration

All recipes use consistent database settings:

- **Host**: `database`
- **User**: `{project-name}db`
- **Password**: `{project-name}db`
- **Database**: `{project-name}db`
- **Port**: `3306`

## Service URLs

After running `lando start`, access your services at:

- **Application**: `http://localhost:8080` or `https://{project-name}.lndo.site`
- **phpMyAdmin**: `http://phpmyadmin.lndo.site`
- **MailHog**: `http://mailhog.lndo.site`

## Platform-Specific Features

### Joomla

```bash
# Install latest Joomla
lando install

# Apply development configuration
lando dev-config

# Install extensions
lando install-extension

# Restore Akeeba backups
lando kick-restore
lando unite-restore
lando unite-restore-s3

# Install Patch Tester
lando install-patchtester
```

### WordPress

```bash
# Install WordPress with WP-CLI
lando install
```

### Laravel

```bash
# Laravel installer is pre-configured
# Redis cache service included
```

## SSL Certificates

For HTTPS support, [trust the Lando CA](https://docs.lando.dev/config/security.html#trusting-the-ca):

```bash
# Trust Lando's SSL certificate
lando --help
```

## Troubleshooting

- **Port conflicts**: Change port mappings in `.lando.yml`
- **Permission issues**: Ensure Docker has proper permissions
- **Service not starting**: Run `lando logs` to check errors

## Contributing

Contributions welcome! Please read the contribution guidelines before submitting PRs.

## License

MIT License - Copyright (c) 2012-2025 Extly, CB
