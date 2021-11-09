<?php

namespace app\control;

use app\model\Producer;
use app\model\Product;
use app\model\User;
use mf\utils\HttpRequest as HttpRequest;
use mf\router\Router as Router;
use app\view\AppView as AppView;
use app\view\ProducerView;

class ProducerController extends \mf\control\AbstractController
{


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

    public function viewProduct()
    {
        $product_id = $_GET["id"];

        $product = Product::find($product_id);

        $view = new ProducerView($product);

        $view->render('renderProduct');
    }

    public function viewMyProfile()
    {
        $producer = User::find($_SESSION['user_login'])->producer;

        $view = new ProducerView($producer);

        $view->render('renderProfile');
    }

    public function viewMyProducts()
    {
        $producer = User::find($_SESSION['user_login'])->producer;

        $products =  $producer->products()->get();

        $view = new ProducerView($products);

        $view->render('renderMyProducts');
    }

    public function viewMyOrderedProducts()
    {
        $producer = User::find($_SESSION['user_login'])->producer;

        $products =  $producer->products()->get();

        $productsOrdered = [];
        foreach ($products as $product) {
            if ($product->orders()->get()->count() > 0)
                array_push($productsOrdered, $product);
        }

        $view = new ProducerView($productsOrdered);

        $view->render('renderMyOrderedProducts');
    }
}
