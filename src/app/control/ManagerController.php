<?php

namespace app\control;


use mf\utils\HttpRequest;
use mf\router\Router;
use app\view\ManagerView;
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

        $view_orders = new ManagerView($stats);
        $view_orders->render("renderDashboard");
    }

    /**
     * Return all orders
     */
    public function viewOrders()
    {
        $orders=Order::all();
        $view_orders = new ManagerView($orders);
        $view_orders->render("renderManagerOrders");
    }

    /**
     * Return order by id
     */
    public function viewOrder()
    {
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if($order){
                $view_orders = new ManagerView($order);
                $view_orders->render("renderManageOrder");
            }else{
                echo "ops! order not found"; //Replace echo by return
            }
        }else{
            echo "Bad request"; //Replace echo by return
        }
    }

    /**
     * Change order status to paid
     */
    public function changeStatusPaid(){
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if($order){
                $order->status="Paid";
                $order->save();
                $view_orders = new ManagerView($order);
                $view_orders->render("renderManageOrder");
            }else{
                echo "ops! order not found"; //Replace echo by return
            }
        }else{
            echo "Bad request"; //Replace echo by return
        }
    }

    /**
     * Change order status to delivered
     */
    public function changeStatusDelivered(){
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if($order){
                $order->status="Delivered";
                $order->save();
                $view_orders = new ManagerView($order);
                $view_orders->render("renderManageOrder");
            }else{
                echo "ops! order not found"; //Replace echo by return
            }
        }else{
            echo "Bad request"; //Replace echo by return
        }
    }

}
