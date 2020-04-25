<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Keranjang;
use App\Models\Menu;

class KeranjangController extends ControllerBase
{

    public function indexAction()
    {
        $userId = $this->session->get('auth')['id_user'];
        $conditions = ['id' => $userId];
        $keranjangs = Keranjang::find([
            'conditions' => 'id_user = :id:',
            'bind' => $conditions,
        ]);

        $this->view->keranjangs = $keranjangs;
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
                $conditions = ['id' => $id_menu];
                $checkKeranjang = Keranjang::findFirst([
                    'conditions' => 'id_menu = :id:',
                    'bind' => $conditions,
                ]);

                if($checkKeranjang){
                    // lakukan update keranjang pada item yang sama
                    $checkKeranjang->jumlah_item = $checkKeranjang->jumlah_item + 1;
                    $checkKeranjang->harga_sementara = $checkKeranjang->harga_sementara + $menu->harga_menu;
                    
                    $success = $checkKeranjang->save();
                    
                    if($success){
                        $menu->tersedia = $menu->tersedia - 1;
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            echo "Error: Jumlah stok menu tersedia gagal diupdate";
                        }
                    }
                    else{
                        echo "Error: Jumlah item keranjang gagal diupdate";
                    }
                    
                }
                else{
                    // buat item baru
                    $keranjang = new Keranjang();
                    $keranjang->id_user = $id_user;
                    $keranjang->id_menu = $id_menu;
                    $keranjang->jumlah_item = 1;
                    $keranjang->harga_sementara = $menu->harga_menu;
                    
                    $success = $keranjang->save();

                    if($success){
                        $menu->tersedia = $menu->tersedia - 1;
                        $berhasil = $menu->save();
                        if($berhasil){
                            $this->response->redirect('keranjang');
                        }
                        else{
                            echo "Error: Jumlah stok menu tersedia gagal diupdate";
                        }
                    }
                    else{
                        echo "Error: Item keranjang gagal dibuat";
                    }

                }

            }
            else{
                echo "Error: Jumlah stok menu tersedia sudah habis";
            }

        }
        else{
            echo "Error: Bukan method post keranjang";
            $this->response->redirect('/');
        }
    }

}
