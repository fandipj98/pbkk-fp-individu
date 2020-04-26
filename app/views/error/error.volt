{% extends "layouts/base.volt" %}

{% block content %}
    <!-- Start page not found -->
    <section class="sample-text-area">
        <div class="container text-center">
            <h1 class="text-heading">Error</h1>
            <p class="sample-text fz-18">
                <b>
                    Maaf, terjadi kesalahan sistem!
                </b>
            </p>
            <div class="fz-18 alert-danger">{{flashSession.output()}}</div>
        </div>
    </section>
    <!-- End page not found -->
{% endblock %}