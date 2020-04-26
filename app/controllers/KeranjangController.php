<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Keranjang;
use App\Models\Menu;

class KeranjangController extends ControllerBase
{

    public function beforeExecuteRoute(){
        if($this->session->has('auth') == 0){
            $this->flashSession->error('You must login first!');
            $this->response->redirect('login');
            return false;
        }
    }

    public function indexAction()
    {
        $id_user = $this->session->get('auth')['id_user'];
        $query = $this->modelsManager->createQuery("SELECT * FROM App\Models\Keranjang x WHERE x.id_user = $id_user AND x.status_keranjang = 0");
        $keranjangs = $query->execute();

        if($keranjangs->count() > 0){
            $this->view->keranjangs = $keranjangs;
            $this->view->flag = 1;
        }
        else{
            $this->view->flag = 0;
        }
    }
    
    public function createAction()
    {
        if($this->request->isPost()){
            $id_user = $this->session->get('auth')['id_user'];
            $id_menu = $this->request->getPost('id_menu', 'int');
            $conditions = ['id' => $id_menu];
            $menu = Menu::findFirst([
                'conditions' => 'id_menu = :id:',
                'bind' => $conditions,
            ]);
            if($menu->tersedia > 0){
                $query = $this->modelsManager->createQuery("SELECT * FROM App\Models\Keranjang x WHERE x.id_user = $id_user AND x.id_menu = $id_menu AND x.status_keranjang = 0");
                $checkKeranjang = $query->execute();

                if($checkKeranjang->count() > 0){
                    // lakukan update keranjang pada item yang sama

                    foreach($checkKeranjang as $cekKeranjang){
                        $cekKeranjang->jumlah_item = $cekKeranjang->jumlah_item + 1;
                        $cekKeranjang->harga_sementara = $cekKeranjang->harga_sementara + $menu->harga_menu;
                        $success = $cekKeranjang->update();
                    }
                    
                    if($success){
                        $menu->tersedia = $menu->tersedia - 1;
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                            $this->response->redirect('keranjang');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Jumlah item keranjang gagal diupdate");
                        $this->response->redirect('keranjang');
                    }
                    
                }
                else{
                    // buat item keranjang baru
                    $keranjang = new Keranjang();
                    $keranjang->id_user = $id_user;
                    $keranjang->id_menu = $id_menu;
                    $keranjang->jumlah_item = 1;
                    $keranjang->harga_sementara = $menu->harga_menu;
                    $keranjang->status_keranjang = 0;
                    
                    $success = $keranjang->save();

                    if($success){
                        $menu->tersedia = $menu->tersedia - 1;
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                            $this->response->redirect('keranjang');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Item keranjang gagal dibuat");
                        $this->response->redirect('keranjang');
                    }
                }

            }
            else{
                $this->flashSession->error("Error: Jumlah stok menu tersedia sudah habis");
                $this->response->redirect('keranjang');
            }

        }
        else{
            $this->flashSession->error("Error: Bukan method post keranjang");
            $this->response->redirect('error');
        }
    }

    public function updateAction()
    {
        if($this->request->isPost()){
            $id_keranjang = $this->request->getPost('id_keranjang', 'int');
            $buttonFlag = $this->request->getPost('buttonFlag', 'int');
            $conditions = ['id' => $id_keranjang];
            $keranjang = Keranjang::findFirst([
                'conditions' => 'id_keranjang = :id:',
                'bind' => $conditions,
            ]);
            $id_menu = $keranjang->id_menu;
            
            if($buttonFlag == 0){
                // Mengurangi item keranjang
                if($keranjang->jumlah_item > 1){
                    $hargaSatuan = $keranjang->harga_sementara / $keranjang->jumlah_item;
                    $keranjang->harga_sementara = $keranjang->harga_sementara - $hargaSatuan;
                    $keranjang->jumlah_item = $keranjang->jumlah_item - 1;

                    $success = $keranjang->save();
                    if($success){
                        $conditions = ['id' => $id_menu];
                        $menu = Menu::findFirst([
                            'conditions' => 'id_menu = :id:',
                            'bind' => $conditions,
                        ]);
                        $menu->tersedia = $menu->tersedia + 1;
                        
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                            $this->response->redirect('keranjang');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Item keranjang gagal diupdate");
                        $this->response->redirect('keranjang');
                    }

                }
                else {
                    // destroy item keranjang
                    $conditions = ['id' => $id_menu];
                    $menu = Menu::findFirst([
                        'conditions' => 'id_menu = :id:',
                        'bind' => $conditions,
                    ]);
                    $menu->tersedia = $menu->tersedia + 1;
                    
                    $berhasil = $menu->save();
                    if($berhasil){
                        $success = $keranjang->delete();
                        if($success){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            $this->flashSession->error("Error: Item keranjang gagal didelete");
                            $this->response->redirect('keranjang');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                        $this->response->redirect('keranjang');
                    }
                }
            }
            else{
                // Menambah item keranjang
                $conditions = ['id' => $id_menu];
                $menu = Menu::findFirst([
                    'conditions' => 'id_menu = :id:',
                    'bind' => $conditions,
                ]);

                if($menu->tersedia > 0){
                    // lakukan update keranjang pada item yang sama
                    $keranjang->jumlah_item = $keranjang->jumlah_item + 1;
                    $keranjang->harga_sementara = $keranjang->harga_sementara + $menu->harga_menu;
                    
                    $success = $keranjang->save();
                    
                    if($success){
                        $menu->tersedia = $menu->tersedia - 1;
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                            $this->response->redirect('keranjang');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Jumlah item keranjang gagal diupdate");
                        $this->response->redirect('keranjang');
                    }
                }
                else{
                    $this->flashSession->error("Error: Jumlah stok menu tersedia sudah habis");
                    $this->response->redirect('keranjang');
                }
            }
        }
        else{
            $this->flashSession->error("Error: Bukan method post keranjang");
            $this->response->redirect('error');
        }
    }

    public function deleteAction()
    {
        if($this->request->isPost()){
            $id_keranjang = $this->request->getPost('id_keranjang', 'int');
            $conditions = ['id' => $id_keranjang];
            $keranjang = Keranjang::findFirst([
                'conditions' => 'id_keranjang = :id:',
                'bind' => $conditions,
            ]);
            $id_menu = $keranjang->id_menu;

            // destroy item keranjang
            $conditions = ['id' => $id_menu];
            $menu = Menu::findFirst([
                'conditions' => 'id_menu = :id:',
                'bind' => $conditions,
            ]);
            $menu->tersedia = $menu->tersedia + $keranjang->jumlah_item;
            
            $berhasil = $menu->save();
            if($berhasil){
                $success = $keranjang->delete();
                if($success){
                    $this->response->redirect('keranjang');
                }
                else{
                    $this->flashSession->error("Error: Item keranjang gagal didelete");
                    $this->response->redirect('keranjang');
                }
            }
            else{
                $this->flashSession->error("Error: Jumlah stok menu tersedia gagal diupdate");
                $this->response->redirect('keranjang');
            }
        }
        else{
            $this->flashSession->error("Error: Bukan method post keranjang");
            $this->response->redirect('error');
        }
    }
}
