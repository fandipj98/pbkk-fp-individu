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
		<table>
			<tbody>
				{% for keranjang in keranjangs %}
					<tr>
						<td>{{ keranjang.menu.nama_menu }}</td>
						<td>{{ keranjang.jumlah_item }}</td>
						<td>Rp. {{ keranjang.harga_sementara }}</td>
					</tr>
				{% endfor %}
			</tbody>
		</table>

        <!-- pembayaran form -->
        <section class="reservation-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7 col-md-6">
                        <form method="POST" class="booking-form" id="myForm" action="{{ url("pesanan/create") }}">
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
                                    <label for="total">Bukti Pembayaran</label>
                                </div>
                                <div class="col-lg-6 d-flex flex-column mb-20">
                                    <input name="bukti_bayar" placeholder="Bukti Pembayaran" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Bukti Pembayaran'"
                                    class="form-control" required="" type="file">
                                </div>

                                <div class="col-lg-12 d-flex justify-content-end">
                                    <button type="submit" class="primary-btn dark mt-30 text-uppercase">Place Order</button>
                                </div>
                                <div class="alert-msg"></div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
	{% endif %}

{% endblock %}
