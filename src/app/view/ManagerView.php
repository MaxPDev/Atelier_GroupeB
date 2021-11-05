<?php

namespace app\view;

use mf\router\Router;
use app\auth\AppAuthentification;
use app\model\Manager;
use app\model\User;

use mf\utils\HttpRequest as HttpRequest;

class ManagerView extends \mf\view\AbstractView {
  
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
        $router = new Router();
        $user=User::find($_SESSION['user_login']);
        return <<<EOT
            <header id="headerManager">
            <img id="header_logo" src="/IUT/Prog_Serveur/Dev/html/img/logo.png" alt="Le Hangar Local">
            <h3>$user->name</h3>
            <nav>
                <ul>
                    <li><a href="{$router->urlFor("dashboard")}">Dashboard</a></li>
                    <li><a href="{$router->urlFor("managerOrders")}">Orders</a></li>
                    <li><a href="{$router->urlFor("logout")}">Logout</a></li>
                </ul>
            </nav>
        </header>
        EOT;
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
    
    private function renderDashboard()
    {
        $router = new Router();
        $nb_products=$this->data['nb_products'];
        $nb_producers=$this->data['nb_producers'];
        $nb_orders=$this->data['nb_orders'];
        $nb_clients=$this->data['nb_clients'];
        $totalEarning=$this->data['totalEarning'];

        $html = <<<EOT
            <h1 id="myDashboard">My Dashboard</h1>
            <section id="dashboardInfos">
                <article id="nbrProducers"><p><span>$nb_products</span> Producers</p></article>
                <article id="nbrProducts"><p><span>$nb_producers</span> Products</p></article>
                <article id="earning"><p><span>$totalEarning €</span> Earning</p></article>
                <article id="nbrOrders"><a href="{$router->urlFor("managerOrders")}"><p><span>$nb_orders</span> Orders</p></a></article>
                <article id="nbrClients"><p><span>$nb_clients</span> Clients</p></article>
            </section>
        EOT;

        return $html;
    }


    /**
     * Render all orders
     */
    public function renderManagerOrders() 
    {
        $router = new Router();
        $html = <<<EOT
        <h1>All Orders</h1>
        <table class="tableList">
            <thead>
                <tr>
                    <th>Client</th>
                    <th>Ref</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
        EOT;
        
        foreach($this->data as $order){
            $orderTotal=0;
            foreach($order->products as $p){
                $orderTotal+= $p->pivot->quantity*$p->unit_price;
            }
                 $html .= <<<EOT
                <tr>
                    <td>$order->name ($order->mail)</td>
                    <td>$order->id</td>
                    <td>$orderTotal €</td>
                    <td>$order->created_at</td>
                    <td>
                        <a href="{$router->urlFor("checkOrder", [["id",$order->id]])}">
                        View
                        </a>
                    </td>
                </tr>
                EOT;
        }
        $html.="</tbody></table>";
        return $html;
    }

    /**
     * Render one order
     */
    public function renderManageOrder() 
    {
        /**IMPORTANT CHANGE URLFOR WHEN CLIENT SIDE IS READY */
        $router = new Router();
        $order= $this->data;
        $orderTotal=0;

        foreach($order->products as $p){
            $orderTotal+= $p->pivot->quantity*$p->unit_price;
        }

        $html='';
        $html .= <<<EOT
        <h1 id="orderNumber">Order $order->id</h1>
        <div id="orderActions">
            <p>Order $order->status</p>
        EOT;

        switch ($order->status) {
            case 'Orderd':
                $html .= <<<EOT
                <a href="{$router->urlFor("markPaid", [["id",$order->id]])}">Mark as paid</a>
                <br>
                <a href="{$router->urlFor("markDelivered", [["id",$order->id]])}">Mark as paid & delivered</a>
                EOT;
                break;
            case 'Paid':
                $html .= <<<EOT
                <a href="{$router->urlFor("markDelivered", [["id",$order->id]])}">Mark as paid & delivered</a>
                EOT;
                break;
        }

        $html .= <<<EOT
        </div>
        <section id="orderInformations">
            <article>
                <p>Client</p>
                <p>$order->name ($order->mail)</p>
            </article>
            <article>
                <p>Total</p>
                <p>$orderTotal €</p>
            </article>
            <article>
                <p>Date</p>
                <p>$order->created_at</p>
            </article>
        </section>
        EOT;
        
        

        $html .= <<<EOT
        <table class="tableList">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Producers</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Unit price</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
        EOT;
        foreach($order->products as $p){
                $total=0;
                $qte=$p->pivot->quantity;
                $total+= $qte*$p->unit_price;
                $producer = $p->producer->user->name;
                $category = $p->category->name;
                 $html .= <<<EOT
                <tr>
                    <td>$p->name</td>
                    <td>$producer</td>
                    <td>$category</td>
                    <td>$qte</td>
                    <td>$p->unit_price €</td>
                    <td>$total €</td>
                    <td>
                        <a href="{$router->urlFor("home")}"> 
                        View in store
                        </a>
                    </td>
                </tr>
                EOT;
        }
        $html.="</tbody></table>";
        return $html;
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
        $center= $this->$selector();
        $footer = $this->renderFooter();
        
        $body = <<<EOT
        <body>
        ${header}
            <main>
                ${center}
            </main>
        </body>
        EOT;
        return $body;
        
    }

}