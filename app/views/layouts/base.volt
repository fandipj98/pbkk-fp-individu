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

	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i|Roboto:400,500" rel="stylesheet">
	<!-- CSS ============================================= -->
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/availability-calendar.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/main.css">
</head>

<body>
	<!--================ Start Header Area =================-->
	<header class="header-area">
		<div class="container">
			<div class="header-wrap">
				<div class="header-top d-flex justify-content-between align-items-center navbar-expand-md">
					<div class="col menu-left">
						<a class="active" href="{{ url("/") }}">Home</a>
						<a href="{{ url("/") }}">Menu</a>
						<a href="{{ url("/") }}">About</a>
					</div>
					<div class="col-3 logo">
						<a href="{{ url("/") }}"><img class="mx-auto" src="img/RestoKu.png" alt=""></a>
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
											<a class="dropdown-item" href="{{ url("/") }}">Keranjang</a>
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

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/main.js"></script>
</body>

</html>