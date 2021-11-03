<?php

namespace app\control;


use mf\utils\HttpRequest as HttpRequest;
use mf\router\Router as Router;
use app\view\AppView as AppView;
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
        $view = new AppView(null);
        $view->render('renderHome');
    }

    public function viewAllProducts() 
    {

        $categories = null; // all products

        $view_all_products = new AppView($categories);
        $view_all_products->render('renderProducts');
    }

    public function viewCategories()
    {
        $categories = null; // categories

        $view_categories = new AppView($categorie);
        $view_categories->render('renderCategories'); // ?
    }

    public function viewProductsByCategory()
    {
        $products_by_category = null; // products by cat

        $view_product_by_category = new AppView($products_by_category);
        $view_product_by_category->render('renderProductsByCategory')


    }

}
