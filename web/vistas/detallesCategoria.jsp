<%-- 
    Document   : detallesCategoria
    Created on : 28/04/2020, 09:27:04 AM
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
	<head>
	<meta charset="utf-8">
	<title>eMenu</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Playfair+Display:400,700,400italic|Roboto:400,300,700' rel='stylesheet' type='text/css'>
	<!-- Animate -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- Icomoon -->
	<link rel="stylesheet" href="assets/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="assets/css/bootstrap.css">

	<link rel="stylesheet" href="assets/css/style.css">
	<script src="assets/js/modernizr-2.6.2.min.js"></script>
        
        <link rel="stylesheet" href="assets/css/bootstrap4/bootstrap.min.css">
        <script src="assets/css/bootstrap4/bootstrap.min.js"></script>

	</head>
	<body>
	<div id="fh5co-offcanvas">
		<a href="#" class="fh5co-close-offcanvas js-fh5co-close-offcanvas"><span><i class="icon-cross3"></i> <span>Cerrar</span></span></a>
		<div class="fh5co-bio">
			<figure>
				<img src="assets/images/e_menu.jpg" alt="eMenu" class="img-responsive">
			</figure>
			<ul class="fh5co-social">
				<li><a href="https://twitter.com"><i class="icon-twitter"></i></a></li>
				<li><a href="https://web.facebook.com"><i class="icon-facebook"></i></a></li>
				<li><a href="https://www.instagram.com"><i class="icon-instagram"></i></a></li>
			</ul>
		</div>

		<div class="fh5co-menu">
			<div class="fh5co-box">
				<h3 class="heading">Categorias</h3>
				<ul>
					<li><a href="#">Ver reseñas</a></li>
					<li><a href="#">Algo mas ?</a></li>
				</ul>
			</div>
			<div class="fh5co-box">
				<h3 class="heading">Buscar</h3>
				<form action="#">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Que desea buscar?">
					</div>
				</form>
			</div>
		</div>
	</div>
            	<header id="fh5co-header">

		<div class="container-fluid">

			<div class="row">
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
				<ul class="fh5co-social">
					<li><a href="https://twitter.com"><i class="icon-twitter"></i></a></li>
					<li><a href="https://web.facebook.com"><i class="icon-facebook"></i></a></li>
					<li><a href="https://www.instagram.com"><i class="icon-instagram"></i></a></li>
				</ul>
				<div class="col-lg-12 col-md-12 text-center">
					<h1 id="fh5co-logo"><a href="index.html">Nuestra oferta</a></h1>
				</div>

			</div>

		</div>

	</header>
   
            <div class="container">
    
<button type="button" class="btn btn-success h1">Pedir</button>

    <div class="card text-center  mb-3 h3">
      <div class="card-header">
        <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
            <a class="nav-link" href="#alimento" role="tab" data-toggle="tab">Chivito</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#resenia" role="tab" data-toggle="tab">Reseñas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#detalles" role="tab" data-toggle="tab">Detalles</a>
          </li>
        </ul>
      </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="alimento">
                <strong> <h4 class="card-title h3">Canadiense de lomo $ 430</h4></strong>
                <div class="container-sm" >
                <input type="number">
                </div>
                <p class="card-text">Jamón, lechuga, tomate, panceta, huevo frito, mozzarella, mayonesa y fritas.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>    
            <div role="tabpanel" class="tab-pane" id="resenia">
                <h5 class="card-title">Reseña</h5>
                <p class="card-text">aca van las estrellas y los comentarios.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
            <div role="tabpanel" class="tab-pane" id="detalles">
                <h5 class="card-title">Detalles</h5>
                <p class="card-text">Aca van las calorias y otros detalles.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
         </div>
    </div>
    
        <div class="card text-center  mb-3 h3">
      <div class="card-header">
        <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
            <a class="nav-link" href="#alimento" role="tab" data-toggle="tab">Chivito</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#resenia" role="tab" data-toggle="tab">Reseñas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#detalles" role="tab" data-toggle="tab">Detalles</a>
          </li>
        </ul>
      </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="alimento">
                <h5 class="card-title h3">Chivito light de lomo</h5>
                <p class="card-text">Jamón, mozzarella, lechuga, tomate y zanahoria rallada.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>    
            <div role="tabpanel" class="tab-pane" id="resenia">
                <h5 class="card-title">Reseña</h5>
                <p class="card-text">aca van las estrellas y los comentarios.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
            <div role="tabpanel" class="tab-pane" id="detalles">
                <h5 class="card-title">Detalles</h5>
                <p class="card-text">Jamón, lechuga, , mayonesa y fritas.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
         </div>
    </div>
    
            <div class="card text-center  mb-3 h3">
      <div class="card-header">
        <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
            <a class="nav-link" href="#alimento" role="tab" data-toggle="tab">Chivito</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#resenia" role="tab" data-toggle="tab">Reseñas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#detalles" role="tab" data-toggle="tab">Detalles</a>
          </li>
        </ul>
      </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="alimento">
                <h5 class="card-title h3">Baurú de carne</h5>
                <p class="card-text">Arvejas, choclo, mayonesa, mozzarella, lechuga, tomate, panceta y huevo.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>    
            <div role="tabpanel" class="tab-pane" id="resenia">
                <h5 class="card-title">Reseña</h5>
                <p class="card-text">aca van las estrellas y los comentarios.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
            <div role="tabpanel" class="tab-pane" id="detalles">
                <h5 class="card-title">Detalles</h5>
                <p class="card-text">Jamón, lechuga, , mayonesa y fritas.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
         </div>
    </div>
    
                <div class="card text-center  mb-3 h3">
      <div class="card-header">
        <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
            <a class="nav-link" href="#alimento" role="tab" data-toggle="tab">Chivito</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#resenia" role="tab" data-toggle="tab">Reseñas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#detalles" role="tab" data-toggle="tab">Detalles</a>
          </li>
        </ul>
      </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="alimento">
                <h5 class="card-title h3">Baurú de pollo </h5>
                <p class="card-text">Arvejas, choclo, mayonesa, mozzarella, lechuga, tomate, panceta y huevo.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>    
            <div role="tabpanel" class="tab-pane" id="resenia">
                <h5 class="card-title">Reseña</h5>
                <p class="card-text">aca van las estrellas y los comentarios.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
            <div role="tabpanel" class="tab-pane" id="detalles">
                <h5 class="card-title">Detalles</h5>
                <p class="card-text">Jamón, lechuga, , mayonesa y fritas.</p>
                <a href="#" class="btn btn-primary">Agregar al pedido</a>
            </div>
         </div>
    </div>

    
</div>

	<!-- jQuery -->
	<script src="assets/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="assets/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="assets/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
        
        <script src="assets/bootstrap4/jquery-3.4.1.slim.min.js"></script>
<script src="assets/bootstrap4/popper.min.js"></script>

	</body>
</html>