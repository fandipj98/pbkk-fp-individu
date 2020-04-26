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
    <section class="post-content-area single-post-area">
        <div class="container">
			<div class="row">
				<div class="col-lg-12 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-9 ">
							<div>
								<img src="{{ url(menu.foto_menu) }}" width="50%" height="400">
							</div>
                            <h3 class="posts-title" >{{ menu.nama_menu }}</h3>
                            <p class="excert fz-18"> {{ menu.deskripsi_menu }}</p>
                            <div>
                                <h4 class="excert">Tipe Hidangan: </h4>
                                <p class="excert fz-18">{{ menu.jenis_menu }}</p>
                            </div>
                            <h4 class="excert">Tersedia: {{ menu.tersedia }}</h4>
							<h4 class="excert"><span>Rp. </span>{{ menu.harga_menu }}</h4>
                            {# Member #}
                            {% if session.has("auth") %}
                                {% if menu.tersedia > 0 %}
                                    <div>
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
			</div>
		</div>
    </section>

{% endblock %}