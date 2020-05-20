<%-- 
    Document   : cabecera
    Created on : 21/04/2020, 02:30:48 PM
    Author     : vanessa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
	<head>
            <meta charset="utf-8">
            <title>eMenu</title>
            <link rel="shortcut icon" href="favicon.ico">
            <script src="vistas/assets/js/jquery.js" type="text/javascript"></script>
            <link href="vistas/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
            <link href="vistas/assets/css/miEstilo.css" rel="stylesheet" type="text/css"/>
            <script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="vistas/assets/js/bootstrap.min.js" type="text/javascript"></script>       
	</head>
        <body>
            <div class="carrito bg-primary shadow rounded ">
                    <img class="carrito_icono float-left p-2 " src="vistas/assets/images/iconos/ic_shopping_cart_black_48dp.png" alt="">  
                    <h5 class="float-left p-2 ">Resumen<br>del Pedido</h5>           
               </div>
            <nav class="menosAlto navbar navbar-expand navbar-dark bg-dark">
                <a href="?caso=inicio"> <img class="imgNavbar" src="vistas/assets/images/e_menu.png" alt=""></a>


                <div class="navbar-collapse ml-auto" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto"> 
                    </ul>

                    <a href="#">
                    <span  class="text-white small" href="#">Leer Codigo QR</span>
                    <img class="nav-item imgNavbar fotoIcono" src="vistas/assets/images/iconos/ic_linked_camera_black_48dp.png" alt="">
                    </a>
                </div>
            </nav>
