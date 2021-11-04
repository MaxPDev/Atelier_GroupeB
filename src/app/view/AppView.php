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
        <article>
            <form action="{$router->urlFor("check_login")}" method="post">
                <input class="forms-text" type="text" name="username" placeholder="username" />
                <input class="forms-text" type="password" name="password" placeholder="password" />
                <button class="forms-button" name="login_button" type="submit">Login</button>
            </form>   
        </article>
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
            ${header}
            ${center}
            ${footer}
        EOT;

        return $body;
    }

}