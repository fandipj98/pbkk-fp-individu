{% extends "layouts/base.volt" %}

{% block content %}
	<!--================ Start banner Area =================-->
	<section class="home-banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="home-banner-content col-lg-5">
					<h1>RestoKu</h1>
					<hr>
					<p>A Fine Dinning Restaurant</p>
				</div>
			</div>
		</div>
	</section>
	<!--================ End banner Area =================-->

	<!--================ Left Right And Banner Icon =================-->
	{% if session.has("auth") %}
		<div class="go-down">
			<a href="#menu_area">
				<img class="go-down-img" src="img/go-down.png" alt="">
			</a>
		</div>
		<div class="fixed-view-menu">
			<p>
				<a href="{{ url("menu") }}">view menu</a>
			</p>
		</div>
		<div class="fixed-book-table">
			<p>
				<a href="{{ url("pesanan") }}">view pesanan</a>
			</p>
		</div>
	{% endif %}	
	<!--================ Left Right And Banner Icon =================-->

	<!--================ Start Call To Action Area =================-->
	<section class="container section-gap-top">
		<div class="callto-action-area relative">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12 p-0">
					<div class="cta-owl owl-carousel">
						<div class="item">
							<div class="cta-img">
								<img src="{{ url("img/menu/salad.jpg") }}" alt="" width="900" height="500">
							</div>
							<div class="text-box text-center">
								<h3 class="mb-10">Appetizer</h3>
								<p>
									Fresh Salad with Vegetables & Fruits
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cta-img">
								<img src="{{ url("img/menu/nasi-goreng.jpg") }}" alt="" width="900" height="500">
							</div>
							<div class="text-box text-center">
								<h3 class="mb-10">Main Course</h3>
								<p>
									Fried Rice with Chicken & Egg
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cta-img">
								<img src="{{ url("img/menu/pisang-goreng.jpg") }}" alt="" width="900" height="500">
							</div>
							<div class="text-box text-center">
								<h3 class="mb-10">Dessert</h3>
								<p>
									Fried Banana with Rice Flour
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End Call To Action Area =================-->

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