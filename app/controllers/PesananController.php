<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Pesanan;
use App\Models\Keranjang;
use App\Models\Users;

class PesananController extends ControllerBase
{

    public function indexAction()
    {
        // read pesanan
        $id_user = $this->session->get('auth')['id_user'];

        $conditions = ['id' => $id_user];
        $pesanans = Pesanan::find([
            'conditions' => 'id_pesanan = :id:',
            'bind' => $conditions,
        ]);

        if($pesanans->count() > 0){
            $this->view->pesanans = $pesanans;
            $this->view->flag = 1;
        }
        else{
            $this->view->flag = 0;
        }
        
    }

    public function pembayaranAction()
    {
        // form pembayaran
        if($this->request->isPost()){
            $id_user = $this->session->get('auth')['id_user'];
            $query = $this->modelsManager->createQuery("SELECT * FROM App\Models\Keranjang x WHERE x.id_user = $id_user AND x.status_keranjang = 0");
            $keranjangs = $query->execute();

            if($keranjangs->count() > 0){
                $harga_subtotal = 0;
                foreach($keranjangs as $keranjang){
                    $harga_subtotal = $harga_subtotal + $keranjang->harga_sementara;
                }
                $ongkos_kirim = 15000;
                $harga_total = $harga_subtotal + $ongkos_kirim;
                $this->view->flag = 1;
                $this->view->keranjangs = $keranjangs;
                $this->view->harga_subtotal = $harga_subtotal;
                $this->view->ongkos_kirim = $ongkos_kirim;
                $this->view->harga_total = $harga_total;
            }
            else{
                $this->view->flag = 0;
            }
        }
    }

    public function createAction()
    {
        // create pesanan
        if($this->request->isPost()){
            $id_user = $this->session->get('auth')['id_user'];
            $harga_subtotal = $this->request->getPost('harga_subtotal', 'int');
            $ongkos_kirim = $this->request->getPost('ongkos_kirim', 'int');
            $harga_total = $this->request->getPost('harga_total', 'int');
            $alamat_kirim = $this->request->getPost('alamat_kirim', 'string');
            $keterangan = $this->request->getPost('keterangan', 'string');
            $sudah_dibayar = 1;
            $status_pengiriman = 0;

            // Cek file bukti bayar berupa foto atau tidak

            // $path ='img/pesanan/'.$isbn.'.jpg';
            // if ($this->request->hasFiles()) {
            //     $gambar = $this->request->getUploadedFiles()[0];
            //     $gambar->moveTo($path);
            // }
            
            $query = $this->modelsManager->createQuery("SELECT * FROM App\Models\Keranjang x WHERE x.id_user = $id_user AND x.status_keranjang = 0");
            $keranjangs = $query->execute();

            if($keranjangs->count() > 0){
                foreach($keranjangs as $keranjang){
                    $keranjang->status_keranjang = 1;
                }
                $success = $keranjangs->save();
                if($success){

                }
                else{

                }
            }
            else{

            }


        }
    }

}
