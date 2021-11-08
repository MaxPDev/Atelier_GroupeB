<?php

namespace mf\router;

use mf\auth\Authentification as Authentification;
// bien pas TweeterAuthentification

class Router extends AbstractRouter {

    /* Constructeur :
     *
     * Appelle le constructeur parent
     *
     * c.f. la classe \mf\router\AbstractRouter
     *
     */
    public function __construct() 
    {
        parent::__construct();
    }

    public function addRoute($name, $url, $ctrl, $mth, $lvl) 
    {

        if (!isset(self::$routes[$url])) {
            self::$routes[$url] = [$ctrl, $mth, $lvl];
            self::$aliases[$name] = $url;
        } else {
            return "<br>Route already exisit!<br>";
        }
    }

    public function setDefaultRoute($url) 
    {
        self::$aliases['default'] = $url;
    }

    public function run()
    {
        $auth =new Authentification;
        $currentPath = $this->http_req->path_info;
        if (array_key_exists($currentPath, self::$routes) && $auth->checkAccessRight(self::$routes[$currentPath][2])) {
            //Personalized route
            $controler = new self::$routes[$currentPath][0]();
            $fn = self::$routes[$currentPath][1];
            $controler->$fn();
        } else {
            //Default route
            $defaultUrl = self::$aliases['default'];
            $controler = new self::$routes[$defaultUrl][0]();
            $fn = self::$routes[$defaultUrl][1];
            $controler->$fn();
        }
    }

    public function urlFor($route_name, $param_list=[]) 
    {
        
        $url = $this->http_req->script_name . self::$aliases[$route_name];
        
        if (count($param_list)) {
            $url .= "?";
            foreach ($param_list as $param) {
                if ($param_list[0] === $param)
                    $url .= $param[0] . "=" . $param[1];
                else
                    $url .= "&amp;" . $param[0] . "=" . $param[1];
            }
        }
        return $url;
    }

    // !! : Gérer erreur/exception toussa toussa
    static function executeRoute($aliase)
    {
        $url = self::$aliases[$aliase];
        $controler = new self::$routes[$url][0]();
        $fn = self::$routes[$url][1];
        $controler->$fn();
    }

}
