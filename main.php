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
use app\model\User as User;

// Controllers
use app\control\AppController as AppController;
use app\control\AppAdminController as AppAdminController;

// View
use app\view\AppView as AppView;


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


AppView::addStyleSheet('html/css/style.css');

//////////////////////////////

$router = new Router();
$router->addRoute('home', //alias
                  '/home/',   //route
                  '\app\control\AppController',   // controller
                  'viewHome',                 // methode
                  AppAuthentification::ACCESS_LEVEL_NONE);      // niveau accès

$router->addRoute('login',
                  '/login/',
                  '\app\control\AppAdminController',
                  'login',
                  AppAuthentification::ACCESS_LEVEL_NONE);

$router->setDefaultRoute('/home/');
$router->run(); 
