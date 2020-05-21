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
            <div class="carrito bg-primary shadow rounded " onclick="verPedido()" id="resumen">
                <img class="carrito_icono float-left p-2 " src="vistas/assets/images/iconos/ic_shopping_cart_black_48dp.png" alt="">  
                <h5 class="float-left p-2" >Resumen<br>del Pedido</h5>           
            </div>

        <div class="d-flex toggled" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-dark border-right " id="sidebar-wrapper">
                <div class="list-group list-group-flush bg-light">
                    <h2 class="mx-3 my-3">E-Menu</h2>
                    <div class="input-group md-form form-sm form-2 py-1 px-1">
                        <input class="form-control my-0 py-1" type="text" placeholder="Buscar plato..." aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn input-group-text lighten-2" id="basic-text1">Buscar</button>
                        </div>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Ver menu</a>    
                    <a href="#" class="list-group-item list-group-item-action bg-light">Añadir reseña</a>    

                    <div class="container list-group-item list-group-item-action bg-light ">
                        
                        <div class="row">
                            <div class="col my-0 py-0">
                                <p>Redes:</p>
                            </div>
                            <div class="col m-0 p-0">
                                <button class="btn m-0 p-0"><img  class="m-0 p-0" width="30" height="auto" src="vistas/assets/images/iconos/instagram.png" alt=""/></button>
                            </div>
                            <div class="col m-0 p-0">
                                <button class="btn m-0 p-0"><img class="m-0 p-0" width="30" height="auto" src="vistas/assets/images/iconos/fb.png" alt=""/></button>
                            </div>
                        </div>
                    </div>
                        <a href="#" class="list-group-item list-group-item-action bg-light">Ayuda</a>
                    </div>

            </div>

            <div id="page-content-wrapper">
                <nav class="menosAlto navbar navbar-expand navbar-dark bg-dark">
            <button class="btn" id="menu-toggle"><img class="imgNavbar" src="vistas/assets/images/e_menu.png" alt=""></button>


            <div class="navbar-collapse ml-auto" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"> 
                </ul>
                
                <a href="#">
                <span  class="text-white small" href="#">Leer Codigo QR</span>
                <img class="nav-item imgNavbar fotoIcono" src="vistas/assets/images/iconos/ic_linked_camera_black_48dp.png" alt="">
                </a>
            </div>
        </nav>