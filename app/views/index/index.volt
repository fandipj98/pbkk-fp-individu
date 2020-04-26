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
								<img src="img/callaction-bg.jpg" class="img-fluid" alt="">
							</div>
							<div class="text-box text-center">
								<h3 class="mb-10">Main Course</h3>
								<p>
									Chicken Steak with gerlic bread & Fries
								</p>
							</div>
						</div>
						<div class="item">
							<div class="cta-img">
								<img src="img/callaction-bg.jpg" class="img-fluid" alt="">
							</div>
							<div class="text-box text-center">
								<h3 class="mb-10">Main Course</h3>
								<p>
									Chicken Steak with gerlic bread & Fries
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End Call To Action Area =================-->

	<!--================ Menu Area =================-->
	<section class="menu-area" id="menu_area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-5 col-md-5">
					<div class="section-title relative">
						<h1>
							Daily Food <br>
							Courses <br>
							with Drinks
						</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
							magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat.</p>
						<a href="#" class="primary-btn text-uppercase">See Full Menu</a>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="menu-list">
						<div class="single-menu">
							<h3>Appetizer</h3>
							<ul class="list">
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
							</ul>
						</div>

						<div class="single-menu">
							<h3>Main Courses</h3>
							<ul class="list">
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
							</ul>
						</div>

						<div class="single-menu">
							<h3>Drinks & Juices</h3>
							<ul class="list">
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
								<li>
									<p class="menu-item">Ham & Potato Sandwiches ........... <span>$25.00</span></p>
									<p>(French bread baguette, cooked ham, potato salad)</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Menu Area =================-->
{% endblock %}