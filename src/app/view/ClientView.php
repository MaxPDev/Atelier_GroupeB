<?php

namespace app\view;

use mf\router\Router;
use app\auth\AppAuthentification;


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
        return '<header> App MENU TO DO </header>';
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
        $route = new Router();


        $nav_categories = '';

        foreach($categories as $category) {
            $nav_categories .= "<a href=''> $category->name </a>";
        }

        return $nav_categories;
    }

    private function renderAllProducts()
    {
        $route = new Router();
        
        $categories = $this->data[0];
        $products = $this->data[1];
        
        $categories_list = $this->renderTopCategoriesMain($categories);
        $products_list = '';
        
        foreach ($products as $product) {
            $product_link = $route->urlFor('clientProduct',[['id',$product->id]]);

            $products_list .= "<div><a href='$product_link'>$product->name </a></div> 
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

    private function renderProduct()
    {
        $route = new Router();

        $product = $this->data[0];
        $producer = $this->data[1]; //passer producer en param ou select seulent id + name
        $producer_user = $producer->user;
        // to do : add to panier

        $product_article = <<<IMG
<img src="$product->img_url">
<p>Price :$product->unit_price</p>
<button> nb ajouté TO DO link panier TO DO </button>
<p>Producer : $producer_user->name TO DO </p>
<p> $product->description </p>
IMG;

        $product_html = <<<EOT
<article>
        $product_article
</article>
EOT;
        return $product_html;
    }

    // Render One Producer View
    private function renderProducer()
    {
        $route = new Router();

        $producer = $this->data;
        $producer_user = $producer->user;
        $producer_products = $producer->products()->get();
        
        // html for producer top view
        $producer_html = <<<PROD
<div>
<h2>Producer</h2>
<p>$producer_user->name</p>
<p>$producer_user->mail | $producer_user->phone</p>

</div>
PROD;

    // html for producer's products
    $producer_product_html = '';

    foreach ($producer_products as $product) {
        $product_link = $route->urlFor('clientProduct',[['id',$product->id]]);
        
        $producer_product_html .= <<<PRODUCT
<img src="$product->img_url" style="width:200px">
<p>Price : $product->unit_price</p>
<button> nb ajouté TO DO link panier TO DO </button><br>
PRODUCT;
    }

    $producer_all_html = <<<EOL
$producer_html
$producer_product_html
EOL;


        return $producer_all_html;
    }



    // render html for Fproducers
    private function renderProducers()
    {
        
        // header 1 , header 2 ?
        $producers = $this->data;

        $producers_article = '';
        
        foreach ($producers as $producer) {
            $producer_user = $producer->user;
            $products_count = $producer->products()->get()->count();
            

            $producers_article .= "<div>Nom : $producer_user->name</div>
                                   <div>location $producer->location</div>
                                   <div>Produit nombre $products_count</div>
                                   <div>Nombre order by Producer TO DO </div>";
        }
        
        $producers_html = <<<PRODS
        <h2>PRODUCERS </h2>
$producers_article
PRODS;

        return $producers_html;
    }

    private function renderOrder()
    {
        $order_html = <<<ORDER
<h1>Order to do</h1>
ORDER;

        return $order_html;
    }

    private function renderCheckout()
    {
        $checkout_html = <<<CHECKOUT
    <h1>Checkout to do</h1>
CHECKOUT;

        return $checkout_html;
    }


    // private function renderCategories()
    // {
        
    // }


//     private function renderProductsByCategory()
//     {
//         $products_by_category_html = <<<EOT
// <article>
//  Prod by cat
// </article>
// EOT;
//         return $products_by_category_html;
//     }

  

//     private function renderLogin() 
//     {

//         // $route = new Router();
//         // $check_login_route = $route->urlFor('check_login');

// $login_form = <<<EOT
// <article>
//     <form id="login" method="post" class="form" action="">    

//         <label> User Name </label>    
//         <input type="text" name="username" id="username" placeholder="Username">        

//         <label> Password </label>    
//         <input type="password" name="password" id="password" placeholder="Password">    
        
//         <input type="submit" name="log" id="log" value="Log In Here" >       

//     </form>
// </article>
// EOT;

//         return $login_form;

//     }


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