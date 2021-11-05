<?php

namespace app\control;


use mf\utils\HttpRequest;
use mf\router\Router;
use app\view\ClientView;
use app\model\Product;
use app\model\Category;
use app\model\Producer;
use app\model\User;
use app\model\Order;


class ClientController extends \mf\control\AbstractController {


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


    /* Méthode viewHome : 
     */
    
    public function viewHome()
    {
        $view = new ClientView(null);
        $view->render('renderHome');
    }

    public function viewAllProducts() 
    {
        $categories = Category::get();
        $category_choosen = $this->request->get['category'];
        $products;
        
        if($category_choosen = 'all') {
            $products = Product::orderBy('name','asc')->get();
        } else {
            $products = $products->category()->where('name','=',$category_choosen)->get();
        }

        $view_all_products = new ClientView([$categories, $products]);
        $view_all_products->render('renderAllProducts');
    }

    public function viewProduct() 
    {
        $id_product = $this->request->get['id'];

        $product = Product::find($id_product);
        $producer = Producer::select()->where('id','=',$product->id_producer)->first();
        
        $view_product = new ClientView([$product, $producer]);
        $view_product->render('renderProduct');

    }

    public function viewProducer()
    {
        $id_producer = $this->request->get['id'];
        $producer = Producer::find($id_producer);

        $view_producer = new ClientView($producer);
        $view_producer->render('renderProducer');
    }
    
    public function viewProducers()
    {
        $producers = Producer::get();

        $view_producers = new ClientView($producers);
        $view_producers->render('renderProducers');

    }

    public function viewOrder()
    {
        $view_order = new ClientView('');
        $view_order->render('renderOrder');
    }

    public function viewCheckout()
    {
        $view_order = new ClientView('');
        $view_order->render('renderCheckout');
    }

    public function addToOrder()
    {
        $id_product = $this->request->post['product_id'];
        // session_destroy();

        if(isset($_SESSION['order'])){
            array_push($_SESSION['order'], $id_product);
        } else {
            $_SESSION['order']['product'] = $id_product;
            $_SESSION['order']['quantity'] = 1; // Remplace 1 by quantity
        }
        
        var_dump($_SESSION['order']);
        
        $route = new Router();
        $_GET['id'] = $id_product; // TO DO ajouter un param optionnel à execute Route
        $route->executeRoute('clientProduct');

        // $view_back_to_product = new ClientView('');
        // $view_back_to_product->render('renderProduct');
    }

    // public function viewCategories($categories)
    // {
    //     $categories = null; // categories

    //     $view_categories = new ClientView($categorie);
    //     $view_categories->render('renderCategories'); // ?
    // }

    // public function viewProductsByCategory()
    // {
    //     $products_by_category = null; // products by cat

    //     $view_product_by_category = new ClientView($products_by_category);
    //     $view_product_by_category->render('renderProductsByCategory');

    // }

}
