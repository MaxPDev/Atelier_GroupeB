<?php

namespace app\view;

use mf\router\Router as Router;


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
        return '<header> App </header>';
    }
    
    /* Méthode renderFooter
     *
     */
    private function renderFooter()
    {
        return "<footer>App Project</footer>";
    }

    /* Méthode renderHome

     */
    
    private function renderHome()
    {


        return "<article><h2>Let's Code !</h2></article>";

    }
  

    public function renderLogin() 
    {

        $route = new Router();
        $check_login_route = $route->urlFor('check_login');

$login_form = <<<EOT
<article class='theme-backcolor1'>
    <form id="login" method="post" class="form" action="$check_login_route">    

        <label> User Name </label>    
        <input type="text" name="username" id="username" class="forms-text" placeholder="Username">        

        <label> Password </label>    
        <input type="password" name="password" id="password" class="forms-text" placeholder="Password">    
        
        <input type="submit" name="log" id="log" class="forms-button" value="Log In Here" >       

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

        $auth = new TweeterAuthentification;

        /*
         * voire la classe AbstractView
         * 
         */
        $header = $this->renderHeader();
        $footer = $this->renderFooter();
        
        switch ($selector) {
            case 'renderHome':
                $center = $this->renderHome();
                break;

            case 'viewLogin':
                $center = $this->renderLogin();
                break;


            case 'viewSignup':
                $center = $this->renderSignup();
                break;

            default:
                echo "Pas de fonction view correspondante";
                break;
        }
        
$body = <<<EOT
${header}
${center}
${footer}
EOT;

        return $body;
        
    }











    
}
