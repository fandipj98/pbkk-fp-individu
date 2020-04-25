{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Keranjang</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("keranjang") }}">Keranjang</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    
    {% for keranjang in keranjangs %}
	<div class="col-lg-4 col-md-6">
		<div class="menu-area">
			<div>
				<h3>{{ keranjang.menu.nama_menu }}</h3>
				<h4>{{ keranjang.jumlah_item }}</h4>
				<h4><span>Rp. </span>{{ keranjang.harga_sementara }}</h4>
			</div>
		</div>
	</div>
	{% endfor %}

{% endblock %}