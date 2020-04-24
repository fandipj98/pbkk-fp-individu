<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Menu;

class MenuController extends ControllerBase
{

    public function indexAction()
    {
        $menu = Menu::find();
        $this->view->menu = $menu;
    }


}
