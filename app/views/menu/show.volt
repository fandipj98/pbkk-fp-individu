{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Menu Details</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
                            <a href="{{ url("menu") }}">Menu</a>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>{{ menu.nama_menu }}</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    
	<!-- Menu Details Section Begin -->
    <section class="menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="menu-area">
                        {{ image(menu.foto_menu) }}
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3>{{ menu.nama_menu }}</h3>
                            </div>

                            {# Description #}
                            <p> {{ menu.deskripsi_menu }}</p>

                            {# Details #}
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Tipe Hidangan:</td>
                                        <td>{{ menu.jenis_menu }}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Tersedia:</td>
                                        <td>{{ menu.tersedia }}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Harga:</td>
                                        <td>Rp. {{ menu.harga_menu }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    {# Member #}
                    {% if session.has("auth") %}
                        {% if menu.tersedia > 0 %}
                            <div class="col-lg-4">
                                <form method="POST" action="{{ url("keranjang/create") }}">
                                    <input name="id_menu" value="{{ menu.id_menu }}" hidden>
                                    <button type="submit" class="primary-btn">Tambah Ke Keranjang</button>
                                </form>
                            </div>
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
    <!-- Menu Details Section End -->

{% endblock %}