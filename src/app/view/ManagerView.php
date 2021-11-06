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

    /**
     * Render header
     */
    private function renderHeader()
    {
        $router = new Router();
        $user=User::find($_SESSION['user_login']);

        $currentPath=$_SERVER["REQUEST_URI"];
        $currentPath=substr($currentPath,0,-1);
        $pathAliase=substr($currentPath,strrpos($currentPath,"/")+1);
        $route1="";
        $route2="";
        
        switch ($pathAliase) {
            case 'dashboard':
                $route1='class="active"';
                break;
            case 'managerOrders':
                $route2='class="active"';
                break;
            default:
                $route2='class="active"';
                break;
        }
        return <<<EOT
            <header id="headerManager">
            <img id="header_logo" src="../../html/img/logo.png" alt="Le Hangar Local">
            <h3>$user->name</h3>
            <nav>
                <ul>
                    <li $route1><a href="{$router->urlFor("dashboard")}">Dashboard</a></li>
                    <li $route2><a href="{$router->urlFor("managerOrders")}">Orders</a></li>
                    <li><a href="{$router->urlFor("logout")}">Logout</a></li>
                </ul>
            </nav>
        </header>
        EOT;
    }
    
    /**
     * Render footer
     */
    private function renderFooter()
    {
        return "<footer>App Project</footer>";
    }

    
    /**
     * Render dashboard
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
                <article id="nbrProducers"><a href="{$router->urlFor("clientProducers")}"><p><span>$nb_products</span> Producers</p></a></article>
                <article id="nbrProducts"><a href="{$router->urlFor("clientProducts")}"><p><span>$nb_producers</span> Products</p></a></article>
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
        $router = new Router();
        $order= $this->data;
        $orderTotal=0;
        $html='';

        //Get order total (only if order exist)
        if(!isset($_SESSION['errorMsg'])){
            foreach($order->products as $p){
                $orderTotal+= $p->pivot->quantity*$p->unit_price;
            }
        

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
        }

        //If there's error=> show error | if not show order details
        if(isset($_SESSION['errorMsg'])){
            $html.='<h3 class="alert-danger">'.$_SESSION['errorMsg'].'</h3>';
            unset($_SESSION['errorMsg']);
        }else{
            if(isset($_SESSION['successMsg'])){
                $html.='<h3 class="alert-success">'.$_SESSION['successMsg'].'</h3>';
                unset($_SESSION['successMsg']);
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
                            <a href="{$router->urlFor("clientProduct", [["id",$p->id]])}"> 
                            View in store
                            </a>
                        </td>
                    </tr>
                    EOT;
            }
            $html.="</tbody></table>";
        }

        return $html;
    }


    /**
     * Render body
     */
    public function renderBody($selector)
    {
        $auth = new AppAuthentification;
        $header = $this->renderHeader();
        $center= $this->$selector();
        $footer = $this->renderFooter();
        
        $body = <<<EOT
        <section id="managerBody">
        ${header}
            <main>
                ${center}
            </main>
        </section>
        EOT;
        return $body;
        
    }

}