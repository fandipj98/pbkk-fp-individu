{% extends "layouts/base.volt" %}

{% block content %}

    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Pembayaran</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("keranjang") }}">Keranjang</a>
                            <span class="lnr lnr-arrow-right"></span>   
                            <span>Pembayaran</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    
    {% if flag == 1 %}
        <div class="container">
            <div class="section-top-border">
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <div class="table-head">
                            <div class="serial"></div>
                            <div class="visit">Nama Item</div>
                            <div class="visit">Jumlah Item</div>
                            <div class="visit">Harga</div>
                        </div>
                        {% for keranjang in keranjangs %}
                        <div class="table-row">
                            <div class="serial"> <img src="{{ keranjang.menu.foto_menu }}" alt="flag" width="150" height="150"></div>
                            <div class="visit">{{ keranjang.menu.nama_menu }}</div>
                            <div class="visit">{{ keranjang.jumlah_item }}</div>
                            <div class="visit">Rp. {{ keranjang.harga_sementara }}</div>
                        </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
        <!-- pembayaran form -->
        <section class="reservation-area">
            <div class="container">
                <div class="row align-items-center ml-190">
                    <div class="col-lg-7 col-md-6">
                        <form method="POST" action="{{ url("pesanan/create") }}" enctype='multipart/form-data'>
                            <div class="row">
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <label for="subtotal">Subtotal</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <input name="harga_subtotal" value="{{ harga_subtotal }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subtotal'"
                                    class="form-control" required="" readonly type="text">
                                </div>

                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <label for="ongkos_kirim">Delivery Fee</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <input name="ongkos_kirim" value="{{ ongkos_kirim }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Delivery Fee'"
                                    class="form-control" required="" readonly type="text">
                                </div>

                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <label for="total">Total</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <input name="harga_total" value="{{ harga_total }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Total'"
                                    class="form-control" required="" readonly type="text">
                                </div>
                                
                                <div class="col-lg-12 d-flex flex-column mb-20">
                                    <textarea class="form-control" name="alamat_kirim" placeholder="Alamat Pengantaran" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Alamat Pengantaran'" required=""></textarea>
                                </div>
                                <div class="col-lg-12 d-flex flex-column mb-20">
                                    <textarea class="form-control" name="keterangan" placeholder="Keterangan Tambahan" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Keterangan Tambahan'" ></textarea>
                                </div>
                                
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <label for="rekening">Transfer ke Rekening Berikut (BCA):</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <p class="fz-18">1234567890</p>
                                </div>

                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <label for="total">Bukti Pembayaran (.jpg/.jpeg/.png)</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <input name="bukti_bayar" type="file" required="">
                                </div>

                                <div class="col-lg-12 d-flex justify-content-end mb-20">
                                    <button type="submit" class="primary-btn dark mt-30 text-uppercase">Place Order</button>
                                </div>
                                <!-- <div class="alert-msg"></div> -->
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
	{% endif %}

{% endblock %}
