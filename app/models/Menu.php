<?php

Namespace App\Models;

use Phalcon\Mvc\Model;

class Menu extends Model
{
    // variables
    public $id_menu;
    public $nama_menu;
    public $jenis_menu;
    public $harga_menu;
    public $tersedia;
    public $deskripsi_menu;
    public $foto_menu;

    // inisialisai relasi dengan model lain
    public function initialize()
    {
        $this->hasMany(
            'id_menu',
            Keranjang::class,
            'id_menu',
            [
                'reusable' => true,
                'alias' => 'keranjang'
            ]
        );

    }

}
