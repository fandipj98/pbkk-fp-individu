<?php

Namespace App\Models;

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\StringLength;


class Users extends Model
{
    // variables
    public $id_user;
    public $email;
    public $firstName;
    public $lastName;
    public $pass;
    public $no_telp;
    public $status;

    // inisialisai relasi dengan model lain
    public function initialize()
    {
        $this->hasMany(
            'id_user',
            Keranjang::class,
            'id_user',
            [
                'reusable' => true,
                'alias' => 'keranjang'
            ]
        );

        $this->hasMany(
            'id_user',
            Pesanan::class,
            'id_user',
            [
                'reusable' => true,
                'alias' => 'pesanan'
            ]
        );

    }


    // validate email
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new Email(
                [
                    'model'   => $this,
                    'message' => 'Email is not valid',
                    // 'cancelOnFail' => true,

                ]
            )
        );

        $validator->add(
            'no_telp',
            new StringLength(
                [
                    'messageMinimum' => 'The Telp Number is too short, Minimum length is 10',
                    'min'            => 10,
                ]
            )
        );

        $validator->setFilters('email', 'trim');
        $validator->setFilters('no_telp', 'trim');

        return $this->validate($validator);
    }
}
