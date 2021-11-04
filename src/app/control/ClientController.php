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
        $products = Product::orderBy('name','asc')->get();

        $view_all_products = new ClientView([$categories, $products]);
        $view_all_products->render('renderAllProducts');
    }

    public function viewProduct() 
    {
        $id_product = $this->request->get['id'];
        $product = Product::find($id_product);

        $producer = Producer::select()->where('id','=',$product->id_producer)->first();
        var_dump($producer->user->name);

        $view_product = new ClientView([$product, $producer]);
        $view_product->render('renderProduct');

    }

    public function viewCategories($categories)
    {
        $categories = null; // categories

        $view_categories = new ClientView($categorie);
        $view_categories->render('renderCategories'); // ?
    }

    public function viewProductsByCategory()
    {
        $products_by_category = null; // products by cat

        $view_product_by_category = new ClientView($products_by_category);
        $view_product_by_category->render('renderProductsByCategory');


    }

}
