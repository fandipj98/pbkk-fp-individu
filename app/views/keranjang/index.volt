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

	<!-- Jika terjadi error  -->
	<div class="text-center fz-18 alert-danger">{{flashSession.output()}}</div>
    <div class="text-center fz-18">{{flash.output()}}</div>
	
	<!--================ End banner Area =================-->
	{% if flag == 1 %}

	<div class="section-top-border">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial"></div>
					<div class="visit">Nama Item</div>
					<div class="visit">Jumlah Item</div>
					<div class="visit">Harga</div>
					<div class="visit"></div>
				</div>
				{% for keranjang in keranjangs %}
				<div class="table-row">
					<div class="serial"> <img src="{{ keranjang.menu.foto_menu }}" alt="flag"></div>
					<div class="visit">{{ keranjang.menu.nama_menu }}</div>
					<div class="visit">
						<form method="POST" action="{{ url("keranjang/update") }}">
							<input name="buttonFlag" value="1" hidden>
							<input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
							<button type="submit" class="genric-btn primary">+</button>
						</form>
						<div class="visit">{{ keranjang.jumlah_item }}</div>
						<form method="POST" action="{{ url("keranjang/update") }}">
							<input name="buttonFlag" value="0" hidden>
							<input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
							<button type="submit" class="genric-btn primary">-</button>
						</form>
					</div>
					<div class="visit">Rp. {{ keranjang.harga_sementara }}</div>
					<div class="visit">
						<form method="POST" action="{{ url("keranjang/delete") }}">
							<input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
							<button type="submit" class="genric-btn danger">Delete</button>
						</form>
					</div>
				</div>
				{% endfor %}
			</div>
		</div>
		<div class="mb-50 mr-50">
			<div class="float-right">
				<form method="POST" action="{{ url("pembayaran") }}">
					<button type="submit" class="primary-btn">Order</button>
				</form>
			</div>
		</div>
	</div>
	{% else %}

	<!-- Start keranjang kosong -->
	<section class="sample-text-area">
		<div class="container text-center">
			<h1 class="text-heading">Wah, keranjang makananmu kosong</h1>
			<p class="sample-text fz-18">
				<b>
					Daripada dikosongi, mending isi dengan makanan-makanan kesukaanmu!
				</b>
			</p>
		</div>
	</section>
	<!-- End keranjang kosong -->

	{% endif %}

{% endblock %}