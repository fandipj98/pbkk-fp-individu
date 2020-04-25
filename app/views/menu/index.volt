{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Food Menu</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("menu") }}">Menu</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    
	{% for menu in menus %}
	<div class="col-lg-4 col-md-6">
		<div class="menu-area">
		{{ image(menu.foto_menu) }}
			<div>
				<h3>{{ menu.nama_menu }}</h3>
				<h4>{{ menu.jenis_menu }}</h4>
				<h4><span>Rp. </span>{{ menu.harga_menu }}</h4>
				<a href="menu/show/{{ menu.id_menu }}" class="primary-btn">Details</a>
			</div>
		</div>
	</div>
	{% endfor %}

{% endblock %}