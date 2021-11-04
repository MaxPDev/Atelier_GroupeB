<?php

namespace app\control;


use mf\utils\HttpRequest;
use mf\router\Router;
use app\view\AppView;
use app\auth\AppAuthentification;
use mf\auth\exception\AuthentificationException;


class AppController extends \mf\control\AbstractController {


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


    /**
     * Render home page
     */
    public function viewHome()
    {
        $view = new AppView(null);
        $view->render('renderHome');
    }
    

    /**
     * Render login page
     */
    public function login() 
    {
        $view_login = new AppView(null);
        $view_login->render("renderLogin");
    }

    /**
     * Check login
     */
    public function checkLogin()
    {
        //Filtering
        $username = filter_var($_POST['username'], FILTER_SANITIZE_SPECIAL_CHARS);

        $router = new Router();
        if (!empty($_POST['password']) && !empty($username)) {
            //Check if fields !empty
            $auth = new AppAuthentification();
            try {
                $user = $auth->loginUser($_POST['username'], $_POST['password']);
                $vue = new AppView($user);
                unset($_SESSION['loginError']); //Unset error messages
                $router->executeRoute('home'); //Redirect to followees page
            } catch (AuthentificationException $e) {
                $_SESSION['loginError'] = $e->getMessage();
                $router->executeRoute('login');
            }
        } else {
            //One+ fields are empty
            $_SESSION['loginError'] = "Ops! Please insert a username and a password";
            $router->executeRoute('login');
        }
    }

    /**
     * Logout
     */
    public function logout()
    {
        $auth = new AppAuthentification();
        $router = new Router();
        $auth->logout();
        $router->executeRoute('login');
    }

}
