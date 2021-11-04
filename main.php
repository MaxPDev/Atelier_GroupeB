<?php

declare(strict_types=1);

// Affichage des erreurs
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

// Autoloader
/* pour le chargement automatique des classes d'Eloquent (dans le répertoire vendor) */
require __DIR__ . '/vendor/autoload.php';


// Router
use mf\router\Router as Router;

// Models
use app\model\User;
use app\model\Manager;
use app\model\Producer;
use app\model\Product;

// Controllers
use app\control\AppController as AppController;
use app\control\AppAdminController as AppAdminController;

// View
use app\view\ClientView as ClientView;
use app\view\ProducerView as ProducerView;
use app\view\ManagerView as ManagerView;


// Auth
use app\auth\AppAuthentification as AppAuthentification;

// Session starting
session_start();

// Paramètre de connexion issus de conf.ini
$paramsServer = parse_ini_file("conf/conf.ini");

/* une instance de connexion  */
$db = new Illuminate\Database\Capsule\Manager();

$db->addConnection($paramsServer); /* configuration avec nos paramètres */
$db->setAsGlobal();            /* rendre la connexion visible dans tout le projet */
$db->bootEloquent();           /* établir la connexion */


//AppView::addStyleSheet('html/css/style.css');


$router = new Router(); //52

$router->addRoute(
    'home', //alias
    '/home/',   //route
    '\app\control\ClientController',   // controller
    'viewHome',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);      // niveau accès


$router->addRoute(
    'login_producer',
    '/login_producer/',
    '\app\control\ProducerAdminController',
    'login',
    AppAuthentification::ACCESS_LEVEL_NONE
);


//List all products by categories
$router->addRoute(
    'dashboard',
    '/dashboard/',
    '\app\control\ManagerController',
    'viewDashboard',
    AppAuthentification::ACCESS_LEVEL_NONE
);
$router->addRoute(
    'login_manager',
    '/login_manager/',
    '\app\control\ManagerAdminController',
    'login',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientProducts', //alias
    '/clientproducts/',   //route
    '\app\control\ClientController',   // controller
    'viewAllProducts',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

//Producer routes

$router->addRoute(
    'producerProfile',
    '/producerProfile/',
    '\app\control\ProducerController',
    'viewMyProfile',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'producerProducts',
    '/producerProducts/',
    '\app\control\ProducerController',
    'viewMyProducts',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'producerOrderedProducts',
    '/producerOrderedProducts/',
    '\app\control\ProducerController',
    'viewMyOrderedProducts',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'producerProduct',
    '/producerProduct/',
    '\app\control\ProducerController',
    'viewProduct',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute('clientProduct', //alias
                  '/clientproduct/',   //route
                  '\app\control\ClientController',   // controller
                  'viewProduct',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);

$router->addRoute('clientProducers', //alias
                  '/clientproducers/',   //route
                  '\app\control\ClientController',   // controller
                  'viewProducers',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);

$router->addRoute('clientProducer', //alias
                  '/clientproducer/',   //route
                  '\app\control\ClientController',   // controller
                  'viewProducer',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);

//Manager dashboard
$router->addRoute('dashboard', 
                  '/dashboard/',   
                  '\app\control\ManagerController',   
                  'viewDashboard',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); //Change me to manager access level after auth

//List all orders
$router->addRoute('managerOrders', 
                  '/managerOrders/',   
                  '\app\control\ManagerController',   
                  'viewOrders',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); //Change me to manager access level after auth

//View One order
$router->addRoute('checkOrder', 
                  '/checkOrder/',   
                  '\app\control\ManagerController',   
                  'viewOrder',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); //Change me to manager access level after auth

//Paid order
$router->addRoute('markPaid', 
                  '/markPaid/',   
                  '\app\control\ManagerController',   
                  'changeStatusPaid',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); //Change me to manager access level after auth
  
//Delivered order
$router->addRoute('markDelivered', 
                  '/markDelivered/',   
                  '\app\control\ManagerController',   
                  'changeStatusDelivered',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); //Change me to manager access level after auth

       
$router->setDefaultRoute('/home/');
$router->run();
