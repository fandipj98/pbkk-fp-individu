{% extends "layouts/base.volt" %}

{% block content %}

<div>
    Daftar Akun Baru
</div>
<div>
    <form method="POST" action="{{ url("register") }}">
        <div>
            <label for="email">Email</label>
            <input type="text" name="email" placeholder="Ex: example@gmail.com" required>
        </div>
        <div>
            <label for="firstName">Nama Depan</label>
            <input type="text" name="firstName" placeholder="Ex: Joko" required>
        </div>
        <div>
            <label for="lastName">Nama Belakang</label>
            <input type="text" name="lastName" placeholder="Ex: Widodo" required>
        </div>
        <div>
            <label for="no_telp">Nomor Telepon</label>
            <input type="text" name="no_telp" placeholder="Ex: 08123456789" required>
        </div>
        <div>
            <label for="pass">Password</label>
            <input type="password" name="pass" required>
        </div>
        <div>
            <label for="cpass">Confirm Password</label>
            <input type="password" name="cpass" required>
        </div>
        <input type="submit" value="Register">
    </form>
</div>
{% endblock %}