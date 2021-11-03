<?php

namespace app\view;

use mf\router\Router as Router;
use app\auth\AppAuthentification as AppAuthentification;


use mf\utils\HttpRequest as HttpRequest;

class ClientView extends \mf\view\AbstractView {
  
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


        return "<article><h2>Informations</h2></article>";

    }

    private function renderTopCategoriesMain($categories) 
    {
        $nav_categories = '';

        foreach($categories as $category) {
            $nav_categories .= "<a href=''> $category->name </a>";
        }

        return $nav_categories;
    }

    private function renderAllProducts()
    {

        $categories = $this->data[0];
        $products = $this->data[1];

        $categories_list = $this->renderTopCategoriesMain($categories);
        $products_list = '';

        foreach ($products as $product) {
            $products_list .= "<div>$product->name </div> 
                              price : $product->unit_price </div>";
        }

        $products_html = <<<EOT
<nav>
 $categories_list
</nav>
<article>
 $products_list
</article>
EOT;
        return $products_html;
    }

    private function renderCategories()
    {
        //
    }


    private function renderProductsByCategory()
    {
        $products_by_category_html = <<<EOT
<article>
 Prod by cat
</article>
EOT;
        return $products_by_category_html;
    }

  

    private function renderLogin() 
    {

        // $route = new Router();
        // $check_login_route = $route->urlFor('check_login');

$login_form = <<<EOT
<article>
    <form id="login" method="post" class="form" action="">    

        <label> User Name </label>    
        <input type="text" name="username" id="username" placeholder="Username">        

        <label> Password </label>    
        <input type="password" name="password" id="password" placeholder="Password">    
        
        <input type="submit" name="log" id="log" value="Log In Here" >       

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

        /*
         * voire la classe AbstractView
         * 
         */
        $header = $this->renderHeader();
        $footer = $this->renderFooter();
        


        $center= $this->$selector();
        // switch ($selector) {
        //     case 'renderHome':
        //         $center = $this->renderHome();
        //         break;

        //     case 'viewLogin':
        //         $center = $this->renderLogin();
        //         break;


        //     case 'viewSignup':
        //         $center = $this->renderSignup();
        //         break;

        //     default:
        //         echo "Pas de fonction view correspondante";
        //         break;
        // }
        
$body = <<<EOT
${header}
${center}
${footer}
EOT;

        return $body;
        
    }

}