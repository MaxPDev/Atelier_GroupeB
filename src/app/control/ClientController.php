<?php

namespace app\control;


use mf\utils\HttpRequest as HttpRequest;
use mf\router\Router as Router;
use app\view\ClientView as ClientView;
// use Categorie


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

        $categories = null; // all products

        $view_all_products = new ClientView($categories);
        $view_all_products->render('renderAllProducts');
    }

    public function viewCategories()
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
