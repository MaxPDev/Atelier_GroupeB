<?php

namespace app\view;

use mf\router\Router;
use app\auth\AppAuthentification;


use mf\utils\HttpRequest as HttpRequest;

class AppView extends \mf\view\AbstractView {
  
    /* Constructeur 
    *
    * Appelle le constructeur de la classe parent
    */
    public function __construct( $data )
    {
        parent::__construct($data);
    }

    /* Méthode renderHeader
     *
     *  Retourne le fragment HTML de l'entête (unique pour toutes les vues)
     */ 
    private function renderHeader()
    {
        return '<header></header>';
    }
    
    /* Méthode renderFooter
     *
     */
    private function renderFooter()
    {
        return "<footer></footer>";
    }

    /* Méthode renderHome

     */
    
    private function renderHome()
    {
        return "<article><h2>Informations</h2></article>";
    }


    private function renderLogin() 
    {

        // $route = new Router();
        // $check_login_route = $route->urlFor('check_login');
        $router = new Router();

        $login_form = <<<EOT
        <div class="login">
            <form action="{$router->urlFor("check_login")}" method="post">
                <input type="email" name="username" id="managerEmail" placeholder="loremipsum@mail.com" />
                <input type="password" name="password" id="managerPassword" placeholder="Type your password" />
                <input value="Login" type="submit">
            </form>   
        </div>
        EOT;

        return $login_form;
    }


    /* Méthode renderBody
     *
     * Retourne la framgment HTML de la balise <body> elle est appelée
     * par la méthode héritée render.
     *
     */
    
    public function renderBody($selector)
    {

        $auth = new AppAuthentification;
        $header = $this->renderHeader();
        $footer = $this->renderFooter();
        $center= $this->$selector();
        
        $body = <<<EOT
            ${center}
        EOT;

        return $body;
    }

}