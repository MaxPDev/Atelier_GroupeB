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
        $router = new Router();

        $producer = User::find($_SESSION['user_login']);

        $html = <<<EOT
            <header>
                <img id="header_logo" src="./img/logo.png" alt="Le Hangar Local">
                <h3>{$producer->name}</h3>
                <nav>
                    <ul>
                        <li><a href="{$router->urlFor('producerOrderedProducts')}">Ordererd products</a></li>
                        <li id="active"><a href="{$router->urlFor('producerProducts')}">My Products</a></li>
                        <li><a href="{$router->urlFor('producerProfile')}">Profile</a></li>
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

        /*
         * voire la classe AbstractView
         * 
         */
        $header = $this->renderHeader();
        $center = $this->$selector();


        $body = <<<EOT
${header}
${center}
EOT;

        return $body;
    }

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
        <section>
            <div>
                <h6>Unit Price</h6>
                <h1>{$product->unit_price}</h1>   
            </div>
            <div>
                <h6>Total earning</h6>
                <h1>{$total}</h1>   
            </div>
            <div>
                <h6>Total orders</h6>
                <h1>{$qteProduct}</h1>   
            </div>
        </section>

        <section>
            <div>category {$product->category->name}</div>
            <div>{$product->description}</div>
            <div>
                <img srcset="{$product->img_url}" alt="Product Image">
            </div>
        </section>
        EOT;

        return $html;
    }

    public function renderProfile()
    {
        $producer = $this->data;

        $html = <<<EOT
        <h1>{$producer->user->name}</h1>
        <section>
            <div>
                <h6>Phone</h6>
                <h1>{$producer->user->phone}</h1>   
            </div>
            <div>
                <h6>mail</h6>
                <h1>{$producer->user->mail}</h1>   
            </div>
            <div>
                <h6>Location</h6>
                <h1>{$producer->location}</h1>   
            </div>
            <div>
                <h6>siret</h6>
                <h1>{$producer->siret}</h1>   
            </div>
        </section>
        EOT;

        return $html;
    }

    public function renderMyProducts()
    {
        $router = new Router();

        $productsHtml = "";
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
