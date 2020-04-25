<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Menu;

class MenuController extends ControllerBase
{

    public function indexAction()
    {
        $menus = Menu::find();
        $this->view->menus = $menus;
    }

    public function showAction($menuId)
    {
        $conditions = ['id' => $menuId];
        $menu = Menu::findFirst([
            'conditions' => 'id_menu = :id:',
            'bind' => $conditions,
        ]);

        $this->view->menu = $menu;
    }

}
