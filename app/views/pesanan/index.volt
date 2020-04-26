{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Pesanan</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("pesanan") }}">Pesanan</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    {% if flag == 1 %}
    <div class="section-top-border">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
                    <div class="visit">ID Pesanan</div>
                    <div class="visit">Email User</div>
                    <div class="visit">Harga Subtotal</div>
                    <div class="visit">Delivery Fee</div>
                    <div class="visit">Harga Total</div>
					<div class="visit">Alamat Pengantaran</div>
					<div class="visit">Keterangan Tambahan</div>
					<div class="visit">Bukti Bayar</div>
					<div class="visit">Status Pembayaran</div>
					<div class="visit">Status Pengiriman</div>
				</div>
				{% for pesanan in pesanans %}
				<div class="table-row">
                    <div class="visit">{{ pesanan.id_pesanan }}</div>
                    <div class="visit">{{ pesanan.users.email }}</div>
                    <div class="visit">Rp. {{ pesanan.harga_subtotal }}</div>
                    <div class="visit">Rp. {{ pesanan.ongkos_kirim }}</div>
                    <div class="visit">Rp. {{ pesanan.harga_total }}</div>
                    <div class="visit">{{ pesanan.alamat_kirim }}</div>
                    <div class="visit">{{ pesanan.keterangan }}</div>
					<div class="visit"><img src="{{ pesanan.bukti_bayar }}" alt="flag" width="auto" height="150"></div>
					<div class="visit">
                        {% if pesanan.sudah_dibayar == 1 %}
                            Lunas
                        {% else %}
                            Belum Lunas
                        {% endif %}
                    </div>
                    <div class="visit">
                        {% if pesanan.status_pengiriman == 1 %}
                            Sudah Sampai Tujuan
                        {% else %}
                            Sedang Diproses
                        {% endif %}
                    </div>
				</div>
				{% endfor %}
			</div>
		</div>
	</div>

	{% else %}

	<!-- Start pesanan kosong -->
	<section class="sample-text-area">
		<div class="container text-center">
			<h1 class="text-heading">Wah, kamu belum melakukan pesanan</h1>
			<p class="sample-text fz-18">
				<b>
					Daripada dilihatin aja, ayo buruan pesan makanan sekarang!
				</b>
			</p>
		</div>
	</section>
	<!-- End pesanan kosong -->

	{% endif %}

{% endblock %}