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
        // $category_choosen = $this->request->get['category'];
        
        if( !isset($this->request->get['category']) ||  !$this->request->get['category']) {
            $products = Product::orderBy('name','asc')->get();
        } else {
            $products = Product::where('id_category','=',$this->request->get['category'])->orderBy('name','asc')->get();
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
        //unset($_SESSION['order']);
        $id_product = $this->request->post['product_id'];
        $quantity = $this->request->post['quantity'];
        
        if(isset($_SESSION['orders'][$id_product])){
             $_SESSION['orders'][$id_product]+= (int)$quantity;                
        }else{
            $_SESSION['orders'][$id_product]= (int)$quantity;    
        }

        var_dump($_SESSION['orders']);
        
        $route = new Router();
        $_GET['id'] = $id_product; // TO DO ajouter un param optionnel à execute Route
        header('Location: ' . $_SERVER['HTTP_REFERER']);
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
