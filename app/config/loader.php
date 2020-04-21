<?php

$loader = new \Phalcon\Loader();

/** @var \Phalcon\Config $config */

// Melakukan register namespace
$loader->registerNamespaces([
    'Phalcon\Db' => APP_PATH . '/lib/Phalcon/Db',

    // Directories
    'App\Controllers' => $config->application->controllersDir,
    'App\Models' => $config->application->modelsDir,
]);

$loader->register();
