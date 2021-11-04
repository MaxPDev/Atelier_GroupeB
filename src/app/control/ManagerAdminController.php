<?php

namespace app\control;

use mf\auth\exception\AuthentificationException as AuthentificationException;
use mf\router\Router as Router;
use app\auth\AppAuthentification as AppAuthentification;
use app\view\ManagerView as ManagerView;
use app\model\User as User;

class ManagerAdminController extends \mf\control\AbstractController {
    
    public function login() 
    {
        $view_login = new ManagerView("");
        $view_login->render("renderLogin");
    }

}