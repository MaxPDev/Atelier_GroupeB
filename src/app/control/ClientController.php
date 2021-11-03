<?php

namespace app\control;


use mf\utils\HttpRequest as HttpRequest;
use mf\router\Router as Router;
use app\view\AppView as AppView;


class ClientController extends \mf\control\AbstractController {


    /* Constructeur :
     * 
     * Appelle le constructeur parent
     *
     * c.f. la classe \mf\control\AbstractController
     * 
     */
    
    public function __construct()
    {
        parent::__construct();
    }


    /* Méthode viewHome : 
     */
    
    public function viewHome()
    {
        $view = new AppView(null);
        $view->render('renderHome');
    }

}
