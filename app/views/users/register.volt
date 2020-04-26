{% extends "layouts/base.volt" %}

{% block content %}
<section class="home-banner-area relative">
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-50 p-r-50 p-t-30 p-b-30">
            <form method="POST" action="{{ url("register") }}" class="login100-form validate-form flex-sb flex-w">
                <span class="login100-form-title p-b-5">
                    Register
                    <div class="fz-18">{{flash.output()}}</div>
                </span>
                
                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Email
                    </span>
                </div>
                <div class="wrap-input100" required>
                    <input class="input100" type="text" name="email" >
                    <span class="focus-input100"></span>
                </div>
                
                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Nama Depan
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Nama Depan is required">
                    <input class="input100" type="text" name="firstName" >
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Nama Belakang
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Nama Belakang is required">
                    <input class="input100" type="text" name="lastName" >
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Nomor Telepon
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Nomor Telepon is required">
                    <input class="input100" type="text" name="no_telp" >
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Password
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input class="input100" type="password" name="pass" >
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Confirm Password
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Confirm Password is required">
                    <input class="input100" type="password" name="cpass" >
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-30">
                    <button class="login100-form-btn">
                        Register
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</section>
{% endblock %}