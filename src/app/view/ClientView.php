<?php

namespace app\view;

use mf\router\Router;
use app\auth\AppAuthentification;


use mf\utils\HttpRequest as HttpRequest;

class ClientView extends \mf\view\AbstractView
{

    /* Constructeur 
    *
    * Appelle le constructeur de la classe parent
    */
    public function __construct($data)
    {
        parent::__construct($data);
    }

    /**
     * Render header
     */
    private function renderHeader($title)
    {
        $nav = $this->renderHeaderNav();
        $header_html = <<<HEADER
        <header>
            <section>
                <img src="../../html/elements/header-bg-trimed.png" alt="">
                <h1>$title</h1>
            </section>
            <nav>
                <img src="../../html/img/logo.png" alt="logo">
                <div>
                    $nav
                </div>
            </nav>
        </header>
        HEADER;
        return $header_html;
    }


    /**
     * Render Home
     */
    private function renderHome()
    {
        $html = <<<EOT
        <main id="home">
            <div>
                <img src="../../html/elements/icon-1.png" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quo perferendis hic pariatur, error, illum
                    porro ullam obcaecati corrupti similique maiores fugiat optio a, culpa repellat laborum repellendus
                    dicta quia ducimus!</p>
            </div>

            <div>
                <img src="../../html/elements/icon-2.png" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quo perferendis hic pariatur, error, illum
                    porro ullam
                    obcaecati corrupti similique maiores fugiat optio a, culpa repellat laborum repellendus dicta quia
                    ducimus!</p>
            </div>

            <div>
                <img src="../../html/elements/icon-3.png" alt="">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quo perferendis hic pariatur, error, illum
                    porro ullam
                    obcaecati corrupti similique maiores fugiat optio a, culpa repellat laborum repellendus dicta quia
                    ducimus!</p>
            </div>
        </main>
        EOT;

        return $html;
    }

    /**
     * Render header Nav
     */
    private function renderHeaderNav()
    {
        $route = new Router();

        $home_link = $route->urlFor('home');
        $products_link = $route->urlFor('clientProducts');
        $producers_link = $route->urlFor('clientProducers');
        $order_link = $route->urlFor('clientOrder');
        $checkout_link = $route->urlFor('clientcheckout');
        $login_link = $route->urlFor('login');

        $header_nav_html = <<<NAV
            <a href='$home_link'>Home</a>
            <a href='$products_link'>Products</a>
            <a href='$producers_link'>Producers</a>
            <a href='$order_link'>Order</a>
            <a href='$checkout_link'><img src="../../html/elements/checkout-icon.png"></a>
            <a href='$login_link'><img src="../../html/elements/avatar.png"></a>
        NAV;

        return $header_nav_html;
    }

    /**
     * Render Categories menu
     */
    private function renderTopCategoriesMain($categories)
    {
        $route = new Router();

        $all_categories_link = $route->urlFor('clientProducts', [['category', null]]);

        $nav_categories = "<section id='menu'><ul><li><a href='$all_categories_link'> All </a></li>";

        foreach ($categories as $category) {
            $category_link = $route->urlFor('clientProducts', [['category', $category->id]]);
            $nav_categories .= "<li><a href='$category_link'> $category->name </a></li>";
        }

        $nav_categories .= "</ul></section>";

        return $nav_categories;
    }

    /**
     * Render all products
     */
    private function renderAllProducts()
    {
        $route = new Router();

        $add_to_order = $route->urlFor('clientAddOrder');

        $categories = $this->data[0];
        $products = $this->data[1];

        $categories_list = $this->renderTopCategoriesMain($categories);
        $products_list = '';

        foreach ($products as $product) {
            $product_link = $route->urlFor('clientProduct', [['id', $product->id]]);

            if (isset($_SESSION['orders'][$product->id])) {
                $value = $_SESSION['orders'][$product->id];
            } else {
                $value = 0;
            }

            $products_list .= <<<EOT
                            <div>
                                <img src="$product->img_url" alt="">
                                <ul>
                                    <li><b><a href="$product_link">$product->name </a></b></li>
                                    <li>$product->unit_price €</li>
                                    <li>
                                        <form method="post" action="$add_to_order">
                                            <input type="number" step="1" min="1" value="$value" name="quantity" required>
                                            <button type="submit" name="product_id" value="$product->id" ><img src="../../html/elements/checkout-btn.png" alt=""></button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        EOT;
        }

        $products_html = <<<EOT
            <main id="store">
                <nav>
                $categories_list
                </nav>
                <section id="products">
                $products_list
                </section>
            </main>
        EOT;
        return $products_html;
    }

    /**
     * Render one product (by id)
     */
    private function renderProduct()
    {
        $route = new Router();

        $product = $this->data[0];
        $producer = $this->data[1]; //passer producer en param ou select seulent id + name
        $producer_user = $producer->user;

        $add_to_order = $route->urlFor('clientAddOrder');

        if (isset($_SESSION['orders'][$product->id])) {
            $value = $_SESSION['orders'][$product->id];
        } else {
            $value = 0;
        }

        $link_producer = $route->urlFor('clientProducer', [['id', $producer->id]]);

        $product_article = <<<IMG
            <div><img src="$product->img_url"></div>
            <div>
                <ul>
                    <li>
                        <h2>$product->name</h2>
                    </li>
                    <li>
                        <a href="$link_producer"><h3>$producer_user->name</h3></a>
                    </li>
                    <li>
                        <h2>$product->unit_price €</h2>
                    </li>
                    <li>
                        <form method="post" action="$add_to_order">
                            <input type="number" step="1" min="1" value="$value" name="quantity" required>
                            <button type="submit" name="product_id" value="$product->id" > Add to order </button>
                        </form>
                    </li>
                </ul>

                <p> $product->description </p>
            </div>
        IMG;

        $product_html = <<<EOT
            <main id="productsDetails">
                $product_article
            </main>
        EOT;
        return $product_html;
    }

    /**
     * Render one producer (by ID)
     */
    private function renderProducer()
    {
        $route = new Router();

        $producer = $this->data;
        $producer_user = $producer->user;
        $producer_products = $producer->products()->get();

        // html for producer top view
        $producer_html = <<<PROD
            <div id="producerProducts">
                <ul>
                    <li><h4>$producer_user->name</h4></li>
                    <li><img src="../../html/elements/producer-avatar.png" alt=""></li>
                    <li>$producer_user->mail</li>
                    <li>Products : {$producer->products->count()} </li>
                    <li>$producer_user->phone | $producer->location</li>
                    <li>Siret : $producer->siret</li>
                </ul>
            </div>
        PROD;

        // html for producer's products
        $producer_product_html = '<main id="store"><section id="products">';

        $add_to_order = $route->urlFor('clientAddOrder');

        foreach ($producer_products as $product) {

            if (isset($_SESSION['orders'][$product->id])) {
                $value = $_SESSION['orders'][$product->id];
            } else {
                $value = 0;
            }

            $product_link = $route->urlFor('clientProduct', [['id', $product->id]]);

            $producer_product_html .= <<<PRODUCT
            <div>
                <img src="$product->img_url" alt="">
                <ul>
                    <li><b><a href="$product_link">$product->name</a></b></li>
                    <li>$product->unit_price €</li>
                    <li>
                        <form method="post" action="$add_to_order">
                            <input type="number" step="1" min="1" value="$value" name="quantity" required>
                            <button type="submit" name="product_id" value="$product->id" ><img src="../../html/elements/checkout-btn.png" alt=""></button>
                        </form>
                    </li>
                </ul>
            </div>
            PRODUCT;
        }

        $producer_product_html .= "</section></main>";

        $producer_all_html = <<<EOL
        $producer_html
        $producer_product_html
        EOL;
        return $producer_all_html;
    }



    /**
     * Render all producers
     */
    private function renderProducers()
    {
        $route = new Router();
        $producers = $this->data;
        $producers_article = '<main id="producer">';

        foreach ($producers as $producer) {

            $producer_user = $producer->user;
            $link_producer = $route->urlFor('clientProducer', [['id', $producer->id]]);

            $producers_article .= <<<EOT
            <div>
                <ul>
                    <li>$producer_user->name</li>
                    <li><img src="../../html/elements/producer-avatar.png" alt=""></li>
                    <li>$producer->location</li>
                    <li>Orders : 15 orders</li>
                    <li>Products : {$producer->products->count()}</li>
                    <li><a href='$link_producer'>See more</a></li>
                </ul>
            </div>
            EOT;
        }

        $producers_article .= "</main>";
        $producers_html = <<<PRODS
            $producers_article
        PRODS;
        return $producers_html;
    }

    /**
     * Render order checkout
     */
    private function renderOrder()
    {
        $route = new Router();

        $message = "";
        if (isset($this->data)) {
            $message = "<h1>Your order is $this->data</h1>";
        }


        $order_html = <<<ORDER
        <main id="checkOrder">
            $message
            <div>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam
                    nonummy nibh euismod tincidunt ut laoreet dolore mag</p>
            </div>
            <form action="{$route->urlFor("checkClientOrder")}" method="post">
                <input type="text" name="orderId" placeholder="Order confirm number">
                <input value="Check" type="submit">
            </form>
        </main>
        ORDER;


        return $order_html;
    }

    /**
     * Render checkout
     */
    private function renderCheckout()
    {
        $route = new Router();

        $orderTotal = 0;
        $html = "";
        if (isset($_SESSION['orderID'])) {
            $id = $_SESSION['orderID'];
            $html .= <<<CHECKOUT
                <main id="checkout">
                    <h1 class="alert-success"> Order confirmed: $id </h1>
                </main>
            CHECKOUT;
            unset($_SESSION['orderID']);
        } else if (isset($_SESSION['orders'])) {
            $html .= <<<CHECKOUT
                <main id="checkout">
                    <table>
                        <tbody>
                            <tr>
                                <th>Product</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                CHECKOUT;

            foreach ($this->data as $product) {
                $product_link = $route->urlFor('clientProduct', [['id', $product->id]]);
                $qte = $_SESSION['orders'][$product->id];
                $total = $qte * $product->unit_price;
                $orderTotal += $total;
                $delete_link = $route->urlFor('removeProduct', [['id', $product->id]]);
                $remQte = $route->urlFor('updateQuantity', [['id', $product->id], ['action', "remove"]]);
                $addQte = $route->urlFor('updateQuantity', [['id', $product->id], ['action', "add"]]);

                $html .= <<<PRODUCT
                    <tr>
                    <td><a href="$product_link">$product->name</a></td>
                    <td>$product->unit_price €</td>
                    <td><a href='$remQte'>-</a> $qte <a href='$addQte'>+</a></td>
                    <td>$total €</td>
                    <td><a href='$delete_link'>Del</a></td>
                    </tr>
                    PRODUCT;
            }

            $html .= <<<PRODUCT
                </tbody>
            </table>
            <hr>
            <h2>Total: $orderTotal</h2>

            <div id="open-modal" class="modal-window">
                <div>
                    <h1>Confirm Order</h1>
                    <form action="{$route->urlFor("confirmOrder")}" method="post">
                        <input type="text" name="fullname" placeholder="Lorem ipsum" />
                        <input type="email" name="email" placeholder="lorem@ipsum.com" />
                        <input type="text" name="mobile" placeholder="00 00 00 00 " />
                        <input value="Submit order" type="submit">
                    </form> 
                </div>
                </div>
            </main>
            PRODUCT;
        } else {
            $html .= <<<CHECKOUT
                <main id="checkout">
                    <h1 class="alert-danger"> Your Cart is empty </h1>
                </main>
            CHECKOUT;
        }
        return $html;
    }

    /**
     * Render footer
     */
    private function renderFooter()
    {
        return "<footer>App Project</footer>";
    }


    /**
     * Render Body
     */
    public function renderBody($selector)
    {
        $title = "Le Hangar Local";
        switch ($selector) {
            case 'renderProducer':
                $title = "Producer";
                break;
            case 'renderAllProducts':
                $title = "Products";
                break;
            case 'renderProducers':
                $title = "Producers";
                break;
            case 'renderOrder':
                $title = "Order";
                break;
            case 'renderCheckout':
                $title = "Checkout";
                break;
            case 'renderProduct':
                $title = "Product";
                break;
        }

        $auth = new AppAuthentification;
        $header = $this->renderHeader($title);
        $footer = $this->renderFooter();
        $center = $this->$selector();

        $body = <<<EOT
        <section id="clientbody">
        ${header}
        ${center}
        </section>
        EOT;
        return $body;
    }
}
