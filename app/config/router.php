<?php

/** @var \Phalcon\Mvc\Router $router */
$router = $di->getRouter();
$config = $di->getConfig();

$router->removeExtraSlashes(true);

// Mengatur routes
$router->add('/', [
    'namespace' => 'App\Controllers',
    'controller' =>  'index',
    'action' =>  'index'
]);


$router->add('/:controller', [
    'namespace' => 'App\Controllers',
    'controller' =>  1,
    'action' =>  'index'
]);

$router->add('/:controller/:params', [
    'namespace' => 'App\Controllers',
    'controller' =>  1,
    'action' =>  'index',
    'params' => 2
]);

$router->add('/:controller/:action', [
    'namespace' => 'App\Controllers',
    'controller' =>  1,
    'action' =>  2,
]);

$router->add('/:controller/:action/:params', [
    'namespace' => 'App\Controllers',
    'controller' =>  1,
    'action' =>  2,
    'params' =>  3,
]);

$router->notFound([
    'namespace' => 'App\Controllers',
    'controller' => 'error',
    'action' => 'notFound',
]);

$router->add('/register', [
    'namespace' => 'App\Controllers',
    'controller' =>  'users',
    'action' =>  'register',
]);

$router->add('/login', [
    'namespace' => 'App\Controllers',
    'controller' =>  'users',
    'action' =>  'login',
]);

$router->add('/logout', [
    'namespace' => 'App\Controllers',
    'controller' =>  'users',
    'action' =>  'logout',
]);

$router->add('/pembayaran', [
    'namespace' => 'App\Controllers',
    'controller' =>  'pesanan',
    'action' =>  'pembayaran',
]);

$router->handle($di->get('request_uri'));