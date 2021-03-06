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
use app\view\ClientView;
use app\view\ProducerView;
use app\view\ManagerView;
use app\view\AppView;

// Auth
use app\auth\AppAuthentification as AppAuthentification;
use mf\view\AbstractView;

// Session starting
session_start();

// Paramètre de connexion issus de conf.ini
$paramsServer = parse_ini_file("conf/conf.ini");

/* une instance de connexion  */
$db = new Illuminate\Database\Capsule\Manager();

$db->addConnection($paramsServer); /* configuration avec nos paramètres */
$db->setAsGlobal(); /* rendre la connexion visible dans tout le projet */
$db->bootEloquent(); /* établir la connexion */

AppView::addStyleSheet('html/css/style.css');
AppView::addStyleSheet('html/css/clientStyle.css');

$router = new Router(); //52

$router->addRoute(
    'home', //alias
    '/home/', //route
    '\app\control\ClientController', // controller
    'viewHome', // methode
    AppAuthentification::ACCESS_LEVEL_NONE
); // niveau accès

//Render login
$router->addRoute('login', '/login/', '\app\control\AppController', 'login', AppAuthentification::ACCESS_LEVEL_NONE);

//Check login
$router->addRoute('check_login', '/check_login/', '\app\control\AppController', 'checkLogin', AppAuthentification::ACCESS_LEVEL_NONE);

//Logout
$router->addRoute('logout', '/logout/', '\app\control\AppController', 'logout', AppAuthentification::ACCESS_LEVEL_NONE);

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
    AppAuthentification::ACCESS_LEVEL_PRODUCER
);

$router->addRoute(
    'producerProducts',
    '/producerProducts/',
    '\app\control\ProducerController',
    'viewMyProducts',
    AppAuthentification::ACCESS_LEVEL_PRODUCER
);

$router->addRoute(
    'producerOrderedProducts',
    '/producerOrderedProducts/',
    '\app\control\ProducerController',
    'viewMyOrderedProducts',
    AppAuthentification::ACCESS_LEVEL_PRODUCER
);

$router->addRoute(
    'producerProduct',
    '/producerProduct/',
    '\app\control\ProducerController',
    'viewProduct',
    AppAuthentification::ACCESS_LEVEL_PRODUCER
);

$router->addRoute(
    'clientProduct', //alias
    '/clientproduct/',   //route
    '\app\control\ClientController',   // controller
    'viewProduct',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientProducers', //alias
    '/clientproducers/',   //route
    '\app\control\ClientController',   // controller
    'viewProducers',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientProducer', //alias
    '/clientproducer/',   //route
    '\app\control\ClientController',   // controller
    'viewProducer',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientOrder',
    '/clientorder/',
    '\app\control\ClientController',
    'viewOrder',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'checkClientOrder',
    '/checkClientOrder/',
    '\app\control\ClientController',
    'checkOrder',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientcheckout', //alias
    '/clientcheckout/',   //route
    '\app\control\ClientController',   // controller
    'viewCheckout',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'clientAddOrder', //alias
    '/clientAddOrder/',   //route
    '\app\control\ClientController',   // controller
    'addToOrder',                 // methode
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'removeProduct',
    '/removeProduct/',
    '\app\control\ClientController',
    'deleteProductCheckout',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'updateQuantity',
    '/updateQuantity/',
    '\app\control\ClientController',
    'updateQuantity',
    AppAuthentification::ACCESS_LEVEL_NONE
);

$router->addRoute(
    'confirmOrder',
    '/confirmOrder/',
    '\app\control\ClientController',
    'confirmOrder',
    AppAuthentification::ACCESS_LEVEL_NONE
);

//Manager dashboard
$router->addRoute('dashboard', '/dashboard/', '\app\control\ManagerController', 'viewDashboard', AppAuthentification::ACCESS_LEVEL_MANAGER); //Change me to manager access level after auth

//List all orders
$router->addRoute('managerOrders', '/managerOrders/', '\app\control\ManagerController', 'viewOrders', AppAuthentification::ACCESS_LEVEL_MANAGER); //Change me to manager access level after auth

//View One order
$router->addRoute('checkOrder', '/checkOrder/', '\app\control\ManagerController', 'viewOrder', AppAuthentification::ACCESS_LEVEL_MANAGER); //Change me to manager access level after auth

//Paid order
$router->addRoute('markPaid', '/markPaid/', '\app\control\ManagerController', 'changeStatusPaid', AppAuthentification::ACCESS_LEVEL_MANAGER); //Change me to manager access level after auth

//Delivered order
$router->addRoute('markDelivered', '/markDelivered/', '\app\control\ManagerController', 'changeStatusDelivered', AppAuthentification::ACCESS_LEVEL_MANAGER); //Change me to manager access level after auth

$router->setDefaultRoute('/home/');
$router->run();
