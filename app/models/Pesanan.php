<?php

Namespace App\Models;

use Phalcon\Mvc\Model;

class Pesanan extends Model
{
    // variables
    public $id_pesanan;
    public $id_user;
    public $harga_subtotal;
    public $ongkos_kirim;
    public $harga_total;
    public $alamat_kirim;
    public $keterangan;
    public $bukti_bayar;
    public $sudah_dibayar;
    public $status_pengiriman;

    // inisialisai relasi dengan model lain
    public function initialize()
    {
        $this->belongsTo(
            'id_user',
            Users::class,
            'id_user',
            [
                'reusable' => true,
                'alias' => 'users'
            ]
        );

    }

}
