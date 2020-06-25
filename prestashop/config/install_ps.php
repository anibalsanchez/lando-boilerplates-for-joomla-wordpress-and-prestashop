<?php

/*
 * @package     Extly.VM
 *
 * @author      Extly, CB. <team@extly.com>
 * @copyright   Copyright (C) 2012-2020 Extly, CB <team@extly.com>
 * @license     MIT
 *
 * @see         https://www.extly.com
 */

$landoInfo = json_decode(getenv('LANDO_INFO'), true);
$landoWebroot = getenv('LANDO_WEBROOT');

$url = $landoInfo['appserver']['urls'][0];
$domain = parse_url($url, PHP_URL_HOST);

$dbServer = $landoInfo['database']['internal_connection']['host'];
$dbName = $landoInfo['database']['creds']['database'];
$dbUser = $landoInfo['database']['creds']['user'];
$dbPassword = $landoInfo['database']['creds']['password'];

$cmd = [
    'php',
    $landoWebroot.'/install/index_cli.php',
    '--',
    '--domain='.$domain,
    '--db_server='.$dbServer,
    '--db_name='.$dbName,
    '--db_user='.$dbUser,
    '--db_password='.$dbPassword,
];
$installScript = implode(' ', $cmd);

shell_exec($installScript);
