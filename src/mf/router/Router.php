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

        (!isset(self::$routes[$url])) {
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
    
        $auth = new Authentification();
        $url = $this->http_req->path_info;
        
        if(array_key_exists($url, self::$routes)) {

            if($auth->checkAccessRight(self::$routes[$url][2])) {
                
                $controler = new self::$routes[$url][0];
                $mth = self::$routes[$url][1];
                $controler->$mth();
            }
        } else {
            $default_url = self::$aliases['default'];
            $controler = new self::$routes[$default_url][0];
            $default_mth= self::$routes[$default_url][1];;
            $controler->$default_mth();
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
    public static function executeRoute(string $alias) 
    {
        $url = self::$aliases[$alias];
        $controler = new self::$routes[$url][0];
        $mth = self::$routes[$url][1];
        $ctrl_obj->$mth();
    }

}
