<?php

namespace app\control;


use mf\utils\HttpRequest;
use mf\router\Router;
use app\view\AppView;
use app\model\Product;
use app\model\Producer;
use app\model\Order;

class ManagerController extends \mf\control\AbstractController {


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
     * Return manager dashboard interface with statistics
     */
    public function viewDashboard()
    {
        $stats=[];
        $orders=Order::all();
        $totalEarning=0;

        //Calculate total earning
        foreach($orders as $order){
            foreach($order->products as $p){
                $totalEarning+= $p->pivot->quantity*$p->unit_price;
            }
        }

        $stats['nb_products']=Product::count();   
        $stats['nb_producers']=Producer::count();        
        $stats['nb_orders']=count($orders);     
        $stats['nb_clients']=Order::distinct('mail')->count();        
        $stats['totalEarning']=$totalEarning;     
       
        var_dump($stats);
    }

}
