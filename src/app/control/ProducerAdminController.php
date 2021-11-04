<?php

namespace app\control;

use mf\auth\exception\AuthentificationException as AuthentificationException;
use mf\router\Router as Router;
use app\auth\AppAuthentification as AppAuthentification;
use app\view\ProducerView as ProducerView;
use app\model\User as User;

class ProducerAdminController extends \mf\control\AbstractController {
    
    public function login() 
    {
        $view_login = new ProducerView("");
        $view_login->render("renderLogin");
    }

}