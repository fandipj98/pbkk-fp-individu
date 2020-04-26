<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Pesanan;
use App\Models\Keranjang;
use App\Models\Users;

class PesananController extends ControllerBase
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
        // read pesanan
        $id_user = $this->session->get('auth')['id_user'];

        $conditions = ['id' => $id_user];
        $pesanans = Pesanan::find([
            'conditions' => 'id_user = :id:',
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
            $keterangan = $keterangan . "\n";
            $sudah_dibayar = 1;
            $status_pengiriman = 0;

            // Cek file bukti bayar berupa foto atau tidak
            $path ='img/pesanan/';
            if ($this->request->hasFiles()) {
                $gambar = $this->request->getUploadedFiles()[0];
                $allowed = array('jpeg', 'png', 'jpg');
                $filename = $gambar->getName();
                $ext = pathinfo($filename, PATHINFO_EXTENSION);
                // cek ekstensi file
                if (in_array($ext, $allowed)) {
                    $path = $path . $id_user . "_" . time() . "_" . $filename;
                    $gambar->moveTo($path);

                    // create new pesanan
                    $pesanan = new Pesanan();
                    $pesanan->id_user = $id_user;
                    $pesanan->harga_subtotal = $harga_subtotal;
                    $pesanan->ongkos_kirim = $ongkos_kirim;
                    $pesanan->harga_total = $harga_total;
                    $pesanan->alamat_kirim = $alamat_kirim;
                    $pesanan->keterangan = $keterangan;
                    $pesanan->bukti_bayar = $path;
                    $pesanan->sudah_dibayar = 1;
                    $pesanan->status_pengiriman = 0;

                    $berhasil = $pesanan->save();

                    if($berhasil){
                        $query = $this->modelsManager->createQuery("SELECT * FROM App\Models\Keranjang x WHERE x.id_user = $id_user AND x.status_keranjang = 0");
                        $keranjangs = $query->execute();
                        
                        if($keranjangs->count() > 0){
                            foreach($keranjangs as $keranjang){
                                $keranjang->status_keranjang = 1;
                                $success = $keranjang->update();
                            }
                            if($success){
                                $this->response->redirect('pesanan');
                            }
                            else{
                                $this->flashSession->error("Error: Keranjang gagal diupdate");
                                $this->response->redirect('error');
                            }
                        }
                        else{
                            $this->flashSession->error("Error: Keranjang belanja tidak ditemukan");
                            $this->response->redirect('error');
                        }
                    }
                    else{
                        $this->flashSession->error("Error: Pesanan tidak berhasil dibuat");
                        $this->response->redirect('error');
                    }

                }
                else{
                    $this->flashSession->error("Error: Ekstensi file salah, mohon ikuti instruksi yang ada.");
                    $this->response->redirect('error');
                }
                
            }
            else{
                $this->flashSession->error("Error: Upload file gagal.");
                $this->response->redirect('error');
            }
        }
        else{
            $this->flashSession->error("Error: Bukan method post pesanan.");
            $this->response->redirect('error');
        }
    }

}
