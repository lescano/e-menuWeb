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
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>eMenu</title>
            <link rel="icon" href="vistas/assets/images/favicon.ico" type="image/x-icon" />
            <script src="vistas/assets/js/jquery.js" type="text/javascript"></script>
            <link href="vistas/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
            <link href="vistas/assets/css/miEstilo.css" rel="stylesheet" type="text/css"/>
            <script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="vistas/assets/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/87277c0c3b.js" crossorigin="anonymous"></script>
            
        </head>
        <body>
            <div class="carrito bg-primary shadow rounded p-1" onclick="verPedido()" id="resumen">
                <img class="carrito_icono float-left m-0 " src="vistas/assets/images/iconos/ic_shopping_cart_black_48dp.png" alt="">  
                <h6 class="float-left p-2" >Resumen<br>del Pedido</h6>           
            </div>
            
       <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Preguntas frecuentes</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!--<span aria-hidden="true">&times;</span>-->
        </button>
      </div>
      <div class="modal-body">
          <div class="mb-4">
            <h5>Como Añadir platos a tu pedido?</h5>
            <p>Seleccione la categoria o realize una busqueda en el menu lateral, luego haga click en la cantidad que desea pedir, 
            y haga click en añadir a pedido</p>
          </div>
          <div class="my-4">
            <h5>Como ver el costo total del pedido?</h5>
            <p>Haga click en el boton "Resumen del pedido"</p>
          </div>
          <div class="my-4">
            <h5>Donde estan las bebidas?</h5>
            <p>Puede buscarlas o seleccionar la categorias bebida</p>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>       
      </div>
    </div>
  </div>
</div>   
        <div class="d-flex " id="wrapper">

            <!-- Sidebar -->
            <div class="bg-dark border-right " id="sidebar-wrapper">
                <div class="list-group list-group-flush bg-light">
                    <h2 class="mx-3 my-3">E-Menu</h2>
                    <div class="input-group md-form form-sm form-2 py-1 px-1">
                        <input class="form-control my-0 py-1" type="text" placeholder="Buscar plato..." aria-label="Search" id="texto-Buscar">
                        <div class="input-group-append">
                            <button class="btn input-group-text lighten-2" id="buscar">Buscar</button>
                        </div>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action bg-light">Ver menu</a>    
                    <a href="#" class="list-group-item list-group-item-action bg-light">Añadir reseña</a>
                    <a href="#" class="list-group-item list-group-item-action bg-light pedido" id="pagar">Pagar</a> 

                    <div class="container list-group-item list-group-item-action bg-light ">
                        
                        <div class="row">
                            <div class="col my-0 py-0">
                                <p>Redes:</p>
                            </div>
                            <div class="col m-0 p-0">
                                <a href="https://www.instagram.com/" class="btn m-0 p-0" target="_blank"><img  class="m-0 p-0" width="30" height="auto" src="vistas/assets/images/iconos/instagram.png" alt=""/></a>
                            </div>
                            <div class="col m-0 p-0">
                                <a class="btn m-0 p-0"  href="https://www.facebook.com/" target="_blank"><img class="m-0 p-0" width="30" height="auto" src="vistas/assets/images/iconos/fb.png" alt=""/></a>
                            </div>
                        </div>
                    </div>
                        <button id="boton-ayuda" type="button" class="list-group-item list-group-item-action bg-light" data-toggle="modal" data-target="#exampleModal">
                            Ayuda
                        </button>
                        <a href="mailto:someone@yoursite.com" class="list-group-item list-group-item-action bg-light">Contactenos</a>
                    </div>
            </div>

            <div id="page-content-wrapper">
                <nav class="menosAlto navbar navbar-expand navbar-dark bg-dark">
            <button class="btn m-0 p-0" id="menu-toggle"><img class="imgNavbar p-0 m-0" src="vistas/assets/images/e_menu.png" alt=""></button>

            <div class="navbar-collapse ml-auto" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"> 
                </ul>
            </div>
        </nav>