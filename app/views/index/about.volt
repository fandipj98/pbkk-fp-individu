{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-6">
					<h1>About Us</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("about") }}">About</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End banner Area =================-->

	<!--================ About Area =================-->
	<section class="about-area section-gap-top">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="">
						<img class="img-fluid" src="img/about-img.jpg" alt="">
					</div>
				</div>
				<div class="offset-lg-1 col-lg-5 col-md-6">
					<div class="section-title relative">
						<h1>
							About <br>
							RestoKu
						</h1>
						<p>
							RestoKu adalah website atau aplikasi yang memiliki fungsi utama untuk melakukan reservasi tempat makan dan pesan antar makanan secara online di sebuah restoran. 
							 Dalam aplikasi ini, user dapat melihat jenis – jenis tempat makan yang tersedia dan juga bisa melihat fasilitasnya. 
							 Setelah user memilih tempat makan yang diinginkan, maka user dapat membuat reservasi tempat makan di restoran tersebut. 
							 Selain itu user juga dapat melihat detail reservasi, mengedit reservasi, dan menghapus reservasi. 
							 Kemudian user juga bisa melihat menu - menu makanan yang ada di restoran tersebut dan dapat memesan makanan secara online. 
							 Setelah user memilih makanan yang ingin dipesan, maka user dapat memasukkan makanan yang ingin dipesan ke keranjang makanan. 
							 Selain itu user juga dapat melihat keranjang makanan, mengedit keranjang makanan, dan menghapus keranjang makanan.
							 Kemudian user dapat membuat pesanan sesuai dengan menu – menu yang telah dimasukkan ke keranjang makanan.
						</p>
					</div>
				</div>
			</div>
		</div>
    </section>
    <br>
	<!--================ End About Area =================-->
{% endblock %}