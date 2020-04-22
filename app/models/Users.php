<?php

Namespace App\Models;

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Uniqueness;
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
            'pass',
            new StringLength(
                [
                    'messageMinimum' => 'The Password is too short, Minimum length is 3',
                    'min'            => 3,
                ]
            )
        );
        $validator->setFilters('email', 'trim');
        $validator->setFilters('no_telp', 'trim');

        $messages = $validator->validate($_POST);
        if (count($messages)) {
            foreach ($messages as $message) {
                echo 'Error: ', $message, '<br>';
            }
        }

        return $this->validate($validator);
    }
}

