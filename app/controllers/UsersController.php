<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Models\Users;
use Phalcon\Security;

class UsersController extends ControllerBase
{

    public function indexAction()
    {
        
    }

    public function beforeExecuteRoute(){
        if($this->session->has('auth')){
            $this->response->redirect('/');
        }
    }

    public function registerAction()
    {
        $user = new Users();

        // get value
        $email = $this->request->getPost('email', 'string');
        $firstName = $this->request->getPost('firstName', 'string');
        $lastName = $this->request->getPost('lastName', 'string');
        $no_telp = $this->request->getPost('no_telp', 'string');
        $pass = $this->request->getPost('pass', 'string');
        $cpass = $this->request->getPost('cpass', 'string');
        $status = 0;

        //set value
        if($pass === $cpass && $pass != ''){
            $checkUser = Users::findFirst("email = '$email'");
            if($checkUser){
                $this->flash->error("Error: Email has already been registered");
            }
            else{
                $user->email = $email;
                $user->firstName = $firstName;
                $user->lastName = $lastName;
                $user->no_telp = $no_telp;
                $user->pass = $pass;
                $user->status = $status;

                $success = $user->save();

                if($success){
                    // Set a session
                    $this->session->set(
                        'auth',
                        [
                            'id_user' => $user->id_user,
                            'email' => $user->email,
                            'firstName' => $user->firstName,
                            'lastName' => $user->lastName,
                            'no_telp' => $user->no_telp,
                            'status' => $user->status,
                        ]
                    );

                    // Go to user
                    if($this->session->get('auth')['status'] == 0){
                        $this->response->redirect('/');
                    }

                }
                else{
                    $this->flash->error("Error: " . implode(", ",$user->getMessages()));
                }
            }
        }
        elseif($pass != ''){
            $this->flash->error("Error: Password and Confirm Password not match");
        }
    }

    public function loginAction()
    {
        if($this->request->isPost()){
            $email = $this->request->getPost('email', 'string');
            $pass = $this->request->getPost('pass', 'string');
            $user = Users::findFirst(
                [
                    'conditions' => 'email = :email:',
                    'bind'       => [
                        'email' => $email,
                    ],
                ]
            );

            // Check if user exist
            if($user){
                // Check user's password
                $check = $this
                    ->security
                    ->checkHash($pass, $user->pass);
                
                if($check === true){
                    
                    // Set a session
                    $this->session->set(
                        'auth',
                        [
                            'id_user' => $user->id_user,
                            'email' => $user->email,
                            'firstName' => $user->firstName,
                            'lastName' => $user->lastName,
                            'no_telp' => $user->no_telp,
                            'status' => $user->status,
                        ]
                    );

                    // Go to user
                    if($this->session->get('auth')['status'] == 0){
                        $this->response->redirect('/');
                    }
                }
                else{
                    $this->flash->error("Error: Password yang anda masukkan salah");
                }
            }
            else{
                $this->flash->error("Error: Email anda belum terdaftarkan");
            }
        }
    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect('/');
    }

}
