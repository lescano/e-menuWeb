<%-- 
    Document   : detallesCategoria
    Created on : 28/04/2020, 09:27:04 AM
    Author     : Danilo
--%>

<%@page import="Logica.Plato"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="cabecera.jsp" />

<% 
    List<Plato> lista = (List<Plato>) request.getAttribute("alimentos");
    Blob imagen = (Blob) request.getAttribute("foto");
    String imagenBase64 = new String(imagen.getBytes(1l, (int) imagen.length()));
    int preciototal = 0;

%>

<img class="p-2 imagenPrincipioPlatos" src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="Imigen de categoria"/>
<div class="card m-1">
    
<%  int i = 0;
    for(Plato alimento : lista){
    
%>

 <div class="card-body">
    <h4 class="card-title" id="alimento<%= +i %>"><%= alimento.getNombre() %></h4>
    <p class="card-text">"<%= alimento.getIngredientes() %>"</p>
    <div class="caja" style="display: none;">
        <ul class="nav nav-tabs " id="myTab<%= +i %>" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab<%= +i %>" data-toggle="tab" href="#home<%= +i %>" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab<%= +i %>" data-toggle="tab" href="#profile<%= +i %>" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab<%= +i %>" data-toggle="tab" href="#contact<%= +i %>" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home<%= +i %>" role="tabpanel" aria-labelledby="home-tab">
            <div class="my-2">
                <h5 class="float-left my-1" id="cantidad<%= +i %>">Cantidad: <input type='text' id="cantidadAlimentos" value="1" readonly></h5>
                <button id="botonMenos" type="button" class="ml-5 mx-1 btn btn-dark float-left " onclick="disminuircantidad()">-</button>
                <button id="botonMas" type="button" class="mx-1 btn btn-dark" onclick="aumentarcantidad()">+</button>
                <h5 id="precio<%= +i %>">Total: $<input type='text' id="precioAlimentos" value="<% out.println(preciototal); %>" readonly></h5>
            </div>
            <p>Alguna aclaracion?</p>   
            <div class="container">
                <div class="row">
                    <div class="col-7">
                        <textarea class="form-control w-20 float-left" rows="3" style="resize: none;"></textarea>
                    </div>
                    <div class="col-5">
                        <button type="button" id="agregarAlPedido<%= +i %>"  class="btn btn-success w-20" onclick="agregar(<%= i %>)">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="profile<%= +i %>" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: <%= alimento.getTiempoPreparacion() %> min</p>
            <p>Calorias: 500</p>
        </div>
        <div class="tab-pane fade" id="contact<%= +i %>" role="tabpanel" aria-labelledby="contact-tab">
            <div id="carouselExampleControls<%= +i %>" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card m-1 mx-5">
                            <div class="card-header">
                                Usuario1
                            </div>
                            <div class="card-body">
                                <p class="card-text">Muy bueno el chivito, lo recomiendo!</p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card m-1 mx-5">
                            <div class="card-header">
                                Usuario2
                            </div>
                            <div class="card-body">
                                <p class="card-text">buenardo ese chivito.</p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card m-1 mx-5 ">
                            <div class="card-header">
                                Usuario3
                            </div>
                            <div class="card-body">
                                <p class="card-text">no me gusto</p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev " href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" style="filter: brightness(0);" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next " href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" style="filter: brightness(0);" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="input-group my-1">
                <input type="text" class="form-control" placeholder="Recipient's username" aria-label="comente aqui..." aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-success input-group-text" id="basic-addon2<%= +i %>">Comentar</button>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom  class="botonDesplegar " type="submit"  value="" onclick="mostrar(<%= i %>)" >
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
    
    
<%
    i++;
    }
%>

<jsp:include page="pie.jsp"/> 

