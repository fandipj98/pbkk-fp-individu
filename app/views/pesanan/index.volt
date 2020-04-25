{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Pesanan</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("pesanan") }}">Pesanan</a>
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
                        <td>
                            <form method="POST" action="{{ url("keranjang/update") }}">
                                <input name="buttonFlag" value="0" hidden>
                                <input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
                                <button type="submit" class="genric-btn primary">-</button>
                            </form>
                        </td>
                        <td>{{ keranjang.jumlah_item }}</td>
                        <td>
                            <form method="POST" action="{{ url("keranjang/update") }}">
                                <input name="buttonFlag" value="1" hidden>
                                <input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
                                <button type="submit" class="genric-btn primary">+</button>
                            </form>
                        </td>
                        <td>Rp. {{ keranjang.harga_sementara }}</td>
                        <td>
                            <form method="POST" action="{{ url("keranjang/delete") }}">
                                <input name="id_keranjang" value="{{ keranjang.id_keranjang }}" hidden>
                                <button type="submit" class="genric-btn danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                {% endfor %}
            </tbody>
        </table>
	{% endif %}

{% endblock %}