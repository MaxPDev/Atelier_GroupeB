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

$db->addConnection( $paramsServer ); /* configuration avec nos paramètres */
$db->setAsGlobal();            /* rendre la connexion visible dans tout le projet */
$db->bootEloquent();           /* établir la connexion */


//AppView::addStyleSheet('html/css/style.css');


$router = new Router(); //52

$router->addRoute('home', //alias
                  '/home/',   //route
                  '\app\control\ClientController',   // controller
                  'viewHome',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);      // niveau accès


$router->addRoute('login_producer',
                  '/login_producer/',
                  '\app\control\ProducerAdminController',
                  'login',
                  AppAuthentification::ACCESS_LEVEL_NONE);


//List all products by categories
$router->addRoute('dashboard', 
                  '/dashboard/',   
                  '\app\control\ManagerController',   
                  'viewDashboard',                 
                  AppAuthentification::ACCESS_LEVEL_NONE); 
$router->addRoute('login_manager',
                  '/login_manager/',
                  '\app\control\ManagerAdminController',
                  'login',
                  AppAuthentification::ACCESS_LEVEL_NONE);

$router->addRoute('products', //alias
                  '/products/',   //route
                  '\app\control\ClientController',   // controller
                  'viewAllProducts',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);

$router->setDefaultRoute('/home/');
$router->run(); 
