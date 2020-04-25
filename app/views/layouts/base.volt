<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>RestoKu</title>

	<!-- Load CSS -->
	{{ assets.outputCss() }}

	{#<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i|Roboto:400,500" rel="stylesheet">
	<!-- CSS ============================================= -->
	<link rel="stylesheet" href="{{ url("css/linearicons.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/font-awesome.min.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/availability-calendar.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/magnific-popup.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/nice-select.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/owl.carousel.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/bootstrap.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/bootstrap-datepicker.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/main.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/form.css") }}" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="{{ url("css/util.css") }}" type="text/css" rel="stylesheet">#}
</head>

<body>
	<!--================ Start Header Area =================-->
	<header class="header-area">
		<div class="container">
			<div class="header-wrap">
				<div class="header-top d-flex justify-content-between align-items-center navbar-expand-md">
					<div class="col menu-left">
						<a class="active" href="{{ url("/") }}">Home</a>
						<a href="{{ url("menu") }}">Menu</a>
						<a href="{{ url("/") }}">About</a>
					</div>
					<div class="col-3 logo">
						<a href="{{ url("/") }}"><img class="mx-auto" src="{{ url("img/RestoKu.png") }}" alt=""></a>
					</div>
					<nav class="col navbar navbar-expand-md justify-content-end">

						<!-- Toggler/collapsibe Button -->
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
							<span class="lnr lnr-menu"></span>
						</button>

						<!-- Navbar Kanan -->
						<div class="collapse navbar-collapse menu-right" id="collapsibleNavbar">
							<ul class="navbar-nav justify-content-center w-100">
								<!-- Jika user sudah login -->
								{% if session.has('auth') %}
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
											{{ session.get('auth')['firstName'] }}
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="{{ url("keranjang") }}">Keranjang</a>
											<a class="dropdown-item" href="{{ url("/") }}">Pesanan</a>
											<a class="dropdown-item" href="{{ url("logout") }}">Logout</a>
										</div>
									</li>
								{% else %}
									<!-- Jika user blm login -->
									<li class="nav-item">
										<a class="nav-link" href="{{ url("login") }}">Login</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="{{ url("register") }}">Register</a>
									</li>
								{% endif %}
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!--================ End Header Area =================-->

	{% block content %} {% endblock %}

	<!-- Load JS -->
	{{ assets.outputJs() }}

	{# <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA" type="text/javascript"></script>
	<script src="{{ url("js/vendor/jquery-2.2.4.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/vendor/bootstrap.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/owl.carousel.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/jquery.sticky.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/parallax.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/jquery.nice-select.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/jquery.ajaxchimp.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/jquery.magnific-popup.min.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/bootstrap-datepicker.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/main.js") }}" type="text/javascript"></script>
	<script src="{{ url("js/form.js") }}" type="text/javascript"></script> #}
</body>

</html>