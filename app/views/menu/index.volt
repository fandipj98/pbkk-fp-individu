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
	<br>
	<section class="post-content-area">
		{% for menu in menus %}
		<div class="container">
			<div class="row">
				<div class="col-lg-12 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-9 ">
							<div>
								<img src="{{ menu.foto_menu }}" width="50%" height="400">
							</div>
							<h3 class="posts-title" >{{ menu.nama_menu }}</h3>
							<h4 class="excert" >{{ menu.jenis_menu }}</h4>
							<h4 class="excert"><span>Rp. </span>{{ menu.harga_menu }}</h4>
							<a href="menu/show/{{ menu.id_menu }}" class="primary-btn">Details</a>					
						</div>
					</div>
				</div>
			</div>
		</div>
		{% endfor %}
	</section>
{% endblock %}