<?php

namespace app\view;

use mf\router\Router as Router;
use app\auth\AppAuthentification as AppAuthentification;
use app\model\User;
use mf\utils\HttpRequest as HttpRequest;

class ProducerView extends \mf\view\AbstractView
{

    /* Constructeur 
    *
    * Appelle le constructeur de la classe parent
    */
    public function __construct($data)
    {
        parent::__construct($data);
    }

    /* Méthode renderHeader
     *
     *  Retourne le fragment HTML de l'entête (unique pour toutes les vues)
     */
    private function renderHeader()
    {
        $req = new HttpRequest();

        $router = new Router();

        $producer = User::find($_SESSION['user_login']);

        $currentPath = $_SERVER["REQUEST_URI"];
        $currentPath = substr($currentPath, 0, -1);
        $pathAliase = substr($currentPath, strrpos($currentPath, "/") + 1);

        $route1 = "";
        $route2 = "";
        $route3 = "";

        switch ($pathAliase) {
            case 'producerOrderedProducts':
                $route1 = 'class="active"';
                break;
            case 'producerProducts':
                $route2 = 'class="active"';
                break;
            case 'producerProfile':
                $route3 = 'class="active"';
                break;
        }

        $html = <<<EOT
            <header id="headerManager">
                <img id="header_logo" src="$req->root/html/img/logo.png" alt="Le Hangar Local">
                <h3>{$producer->name}</h3>
                <nav>
                    <ul>
                        <li $route1><a href="{$router->urlFor('producerOrderedProducts')}">Ordererd products</a></li>
                        <li $route2><a href="{$router->urlFor('producerProducts')}">My Products</a></li>
                        <li $route3><a href="{$router->urlFor('producerProfile')}">Profile</a></li>
                        <li><a href="{$router->urlFor("logout")}">Logout</a></li>
                    </ul>
                </nav>
            </header>
        EOT;

        return $html;
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

        /**
         * Check abstractView
         */
        $header = $this->renderHeader();
        $center = $this->$selector();


        $body = <<<EOT
            <main id="managerBody">
                ${header}
                <section>
                    ${center}
                </section>
            </main>
        EOT;

        return $body;
    }

    /**
     * Render one product (by id)
     */
    public function renderProduct()
    {
        $product = $this->data;

        $qteProduct = 0;
        foreach ($product->orders as $p) {
            $qteProduct = $p->pivot->quantity;
        }

        $total = $qteProduct * $product->unit_price;

        $html = <<<EOT
        <h1>{$product->name}</h1>
        <section id="producerProductPage">
            <article class="producerInfoProduct">
                <h2>Total orders</h2>
                <h1>{$qteProduct}</h1>
            </article>
            <article class="producerInfoProduct">
                <h2>Unit Price</h2>
                <h1>{$product->unit_price} €</h1>
            </article>
            <article class="producerInfoProduct">
                <h2>Total earning</h2>
                <h1>{$total}€</h1>
            </article>
            <article>
                <h2>{$product->category->name}</h2>
                {$product->description}
            </article>
            <article>
                <img src="{$product->img_url}" alt="Product Image">
            </article>
        </section>
        EOT;

        return $html;
    }

    /**
     * Render producer profile
     */
    public function renderProfile()
    {
        $req = new HttpRequest();

        $producer = $this->data;

        $html = <<<EOT
        <img src="$req->root/html/elements/producer-avatar.png" alt="pictureProfileProducer">
        <h1>{$producer->user->name}</h1>
        <section id="producerProfile">
            <div>
                <h4>Phone</h4>
                <h1>{$producer->user->phone}</h1>   
            </div>
            <div>
                <h4>mail</h4>
                <h1>{$producer->user->mail}</h1>   
            </div>
            <div>
                <h4>Location</h4>
                <h1>{$producer->location}</h1>   
            </div>
            <div>
                <h4>siret</h4>
                <h1>{$producer->siret}</h1>   
            </div>
        </section>
        EOT;

        return $html;
    }

    /**
     * Render producer ordered products 
     */
    public function renderMyOrderedProducts()
    {
        $router = new Router();

        $productsHtml = "<h1>Ordered Products</h1>";
        foreach ($this->data as $product) {
            foreach ($product->orders as $order) {
                $total = $product->unit_price * $order->pivot->quantity;

                $productsHtml .= <<<EOT
                    <tr>
                        <td>{$product->name}</td>
                        <td>{$order->pivot->quantity}</td>
                        <td>{$product->unit_price} €</td>
                        <td>{$total} €</td>
                        <td>{$order->created_at}</td>
                        <td><a href="{$router->urlFor('producerProduct', [['id',$product->id]])}">View</a></td>
                    </tr>
                EOT;
            }
        }

        $html = <<<EOT
            <table class="tableList">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    $productsHtml
                </tbody>
            </table>
        EOT;

        return $html;
    }

    /**
     * Render producer products
     */
    public function renderMyProducts()
    {
        $router = new Router();

        $productsHtml = "<h1>My Products</h1>";
        foreach ($this->data as $product) {
            $productsHtml .= <<<EOT
                <tr>
                    <td>{$product->name}</td>
                    <td>{$product->category->name}</td>
                    <td><a href="{$router->urlFor('producerProduct', [['id',$product->id]])}">View</a></td>
                </tr>
            EOT;
        }

        $html = <<<EOT
            <table class="tableList">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    $productsHtml
                </tbody>
            </table>
        EOT;

        return $html;
    }
}
