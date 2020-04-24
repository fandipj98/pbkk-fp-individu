<?php
declare(strict_types=1);
namespace App\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use Phalcon\Mvc\Dispatcher;

class ControllerBase extends Controller
{
    // Implement common logic

    public function onConstruct(){

        // Remote CSS
        $this->assets->addCss("https://fonts.googleapis.com/css?family=Playfair+Display:400,400i|Roboto:400,500", false);

        // Local CSS
        $this->assets->addCss("css/linearicons.css");
        $this->assets->addCss("css/font-awesome.min.css");
        $this->assets->addCss("css/availability-calendar.css");
        $this->assets->addCss("css/magnific-popup.css");
        $this->assets->addCss("css/nice-select.css");
        $this->assets->addCss("css/owl.carousel.css");
        $this->assets->addCss("css/bootstrap.css");
        $this->assets->addCss("css/bootstrap-datepicker.css");
        $this->assets->addCss("css/main.css");
        $this->assets->addCss("css/form.css");
        $this->assets->addCss("css/util.css");

        // Remote Js
        $this->assets->addJs("https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js", false);
        $this->assets->addJs("https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA", false);
        
        // Local Js
        $this->assets->addJs("js/vendor/jquery-2.2.4.min.js");
        $this->assets->addJs("js/vendor/bootstrap.min.js");
        $this->assets->addJs("js/owl.carousel.min.js");
        $this->assets->addJs("js/jquery.sticky.js");
        $this->assets->addJs("js/parallax.min.js");
        $this->assets->addJs("js/jquery.nice-select.min.js");
        $this->assets->addJs("js/jquery.ajaxchimp.min.js");
        $this->assets->addJs("js/jquery.magnific-popup.min.js");
        $this->assets->addJs("js/bootstrap-datepicker.js");
        $this->assets->addJs("js/main.js");
        $this->assets->addJs("js/form.js");

    }
}
