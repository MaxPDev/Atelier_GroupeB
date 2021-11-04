<?php

namespace app\control;

use app\model\Producer;
use app\model\Product;
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
        $producer_id = 1; //

        $producer = Producer::find($producer_id);

        $view = new ProducerView($producer);

        $view->render('renderProfile');
    }
}
