<?php
declare(strict_types=1);

use Phalcon\Di\FactoryDefault;

error_reporting(E_ALL);
ini_set('display_errors', 'true');

// Set Base Path
define('BASE_PATH', dirname(__DIR__));

// Set App Path
define('APP_PATH', BASE_PATH . '/app');

// Autoload
require __DIR__ . '/../vendor/autoload.php';

$dotenv = \Dotenv\Dotenv::createImmutable(__DIR__.'/../');
$dotenv->load();

try 
{
    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();

    // Register config
    $config = include APP_PATH . "/config/config.php";

    // Register autoloader
    include APP_PATH . '/config/loader.php';

    // Register services
    include APP_PATH . '/config/services.php';

    // Handle routes
    include APP_PATH . '/config/router.php';

    // Handle request
    $application = new \Phalcon\Mvc\Application($di);

    echo $application->handle($di->get('request_uri'))->getContent();
} 

catch (\Exception $e) 
{
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
