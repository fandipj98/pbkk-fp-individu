<?php

Namespace App\Models;

use Phalcon\Mvc\Model;

class Keranjang extends Model
{
    // variables
    public $id_keranjang;
    public $id_user;
    public $id_menu;
    public $jumlah_item;
    public $harga_sementara;
    public $status_keranjang;

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

        $this->belongsTo(
            'id_menu',
            Menu::class,
            'id_menu',
            [
                'reusable' => true,
                'alias' => 'menu'
            ]
        );

    }

}
