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
    
    public function __construct(){
        parent::__construct();
    }


    /**
     * Return manager dashboard interface with statistics
     */
    public function viewDashboard(){
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
    public function viewOrder(){
        $order=null;
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if(!$order){
                $_SESSION['errorMsg']="ops! order not found";
            }
        }else{
            $_SESSION['errorMsg']="Bad request";
        }
        $view_orders = new ManagerView($order);
        $view_orders->render("renderManageOrder");
    }

    /**
     * Change order status to paid
     */
    public function changeStatusPaid(){
        $order=null;
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if($order){
                $order->status="Paid";
                $order->save();
                $_SESSION['successMsg']="Order marked as paid";
            }else{
                $_SESSION['errorMsg']="ops! order not found";
            }
        }else{
            $_SESSION['errorMsg']="Bad request";
        }
        $view_orders = new ManagerView($order);
        $view_orders->render("renderManageOrder");
    }

    /**
     * Change order status to delivered
     */
    public function changeStatusDelivered(){
        $order=null;
        if(isset($_GET['id'])){
            $order=Order::find($_GET['id']);
            if($order){
                $order->status="Delivered";
                $order->save();
                $_SESSION['successMsg']="Order marked as delivered";
            }else{
                $_SESSION['errorMsg']="ops! order not found";
            }
        }else{
            $_SESSION['errorMsg']="Bad request";
        }
        $view_orders = new ManagerView($order);
        $view_orders->render("renderManageOrder");
    }

}
