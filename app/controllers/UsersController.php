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
                echo "Error: Email has already been registered";
                $this->view->disable();
                // $this->response->redirect('register');
            }
            else{
                $user->email = $email;
                $user->firstName = $firstName;
                $user->lastName = $lastName;
                $user->no_telp = $no_telp;
                $user->pass = $this->security->hash($pass);
                $user->status = $status;

                $success = $user->save();

                if($success){
                    $this->response->redirect('index');              
                }
                else{
                    // echo "Error: " . implode('<br>',$user->getMessages());
                    $this->view->disable();
                }
            }
        }
        elseif($pass != ''){
            echo "Error: Password and Confirm Password not match";
            $this->view->disable();
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
                    if($this->session->get('auth')['status'] === '0'){
                        $this->response->redirect('/');
                        // echo "USER LOGGED IN: ";
                        // echo $this->session->get('auth')['firstName'] . $this->session->get('auth')['lastName'] . $this->session->get('auth')['status'];
                        // $this->view->disable();
                    }
                }
                else{
                    // $this->response->redirect('login');
                    $this->view->disable();
                }
            }
            else{
                // $this->response->redirect('login');
                $this->view->disable();
            }
        }
    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->response->redirect('/');
    }

}
