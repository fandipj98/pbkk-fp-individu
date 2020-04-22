{% extends "layouts/base.volt" %}

{% block content %}

<div>
    Login
</div>
<div>
    <form method="POST" action="{{ url("login") }}">
        <div>
            <div>
                <div>
                    <input type="email" name="email" placeholder="example@mail.com">
                </div>
            </div>
            <div>
                <div>
                    <input type="password" name="pass" placeholder="password">
                </div>
            </div>
            <input type="submit" value="Login">
        </div>
    </form>
</div>
{% endblock %}