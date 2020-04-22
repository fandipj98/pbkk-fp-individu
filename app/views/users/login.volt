{% extends "layouts/base.volt" %}

{% block content %}
<section class="home-banner-area relative">
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-l-50 p-r-50 p-t-50 p-b-33">
            <form method="POST" action="{{ url("login") }}" class="login100-form validate-form flex-sb flex-w">
                <span class="login100-form-title p-b-5">
                    Login
                </span>
                
                <div class="p-t-10 p-b-9">
                    <span class="txt1">
                        Email
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Email is required">
                    <input class="input100" type="email" name="email" >
                    <span class="focus-input100"></span>
                </div>
                
                <div class="p-t-10 p-b-9">
                    <span class="txt1">
                        Password
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input class="input100" type="password" name="pass" >
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>

                <div class="w-full text-center p-t-20">
                    <span class="txt2">
                        Not a member?
                    </span>

                    <a href="{{ url("register") }}" class="txt2 bo1">
                        Register now
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</section>
{% endblock %}