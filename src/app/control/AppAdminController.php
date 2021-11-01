<?php

namespace app\control;

use mf\auth\exception\AuthentificationException as AuthentificationException;
use mf\router\Router as Router;
use app\auth\AppAuthentification as AppAuthentification;
use app\view\AppView as AppView;
use app\model\User as User;

class AppAdminController extends \mf\control\AbstractController {
    
    public function login() 
    {
        $view_login = new AppView("");
        $view_login->render("viewLogin");
    }

}