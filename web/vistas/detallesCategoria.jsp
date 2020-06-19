<%-- 
    Document   : detallesCategoria
    Created on : 28/04/2020, 09:27:04 AM
    Author     : Danilo
--%>

<%@page import="Logica.Categoria"%>
<%@page import="Logica.Plato"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="cabecera.jsp" />

<% 
    List<Plato> lista = (List<Plato>) request.getAttribute("alimentos");
    List<Plato> acompaniamiento = (List<Plato>) request.getAttribute("acompaniamiento");
    Categoria categoria = (Categoria) request.getAttribute("categoria");
    Blob imagen = categoria.getImagen() ;
    String imagenBase64 = new String(imagen.getBytes(1l, (int) imagen.length()));
%>
<div id="container-categorias">
<div class="m-0 p-0 overflow-hidden " type="button" style="border:none;">
                    <div class="containerTextCat bg-primary">
                        <img class="aImagen m-0 p-0" src="data:image/jpeg;base64,<%= imagenBase64 %>"/>  
                        <div class="centeredText"><%= categoria.getNombre() %></div>
                    </div>
</div>
<!--<div class="m-0 p-0 divPrincipioPlatos">
    <img class="imagenPrincipioPlatos mb-0 pb-0" src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="Imigen de categoria"/>
</div>-->
<div class="card mx-1 shadow">
    
<%  int i = 0;
    for(Plato alimento : lista){
%>

 <div class="card-body p-1 m-1 shadow-sm">
    <h4 class="card-title m-0 p-0" id="alimento<%= i %>"><%= alimento.getNombre() %></h4>
    <input id="idAlimento<%= i %>" value="<%= alimento.getId() %>" style="display:none;">
    <p class="card-text p-0 m-1">"<%= alimento.getIngredientes() %>"</p>
    <div class="caja" style="display: none;">
        <ul class="nav nav-tabs " id="myTab<%= i %>" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab<%= i %>" data-toggle="tab" href="#home<%= i %>" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab<%= i %>" data-toggle="tab" href="#profile<%= i %>" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab<%= i %>" data-toggle="tab" href="#contact<%= i %>" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home<%= i %>" role="tabpanel" aria-labelledby="home-tab">
               <div class="gustos gustosSup">
                    <div class="gustos">
                        <div class="">
                            <button id="botonMenos" type="button" class=" btn btn-dark" onclick="disminuircantidad(<%= i %>)">-</button>
                        </div>
                        <div class="">
                            <h5 class="" id="cantidadAlimentos<%= i %>" style="padding-left: 1em;padding-right: 1em;">1</h5>
                        </div>
                        <div class="">
                            <button id="botonMas" type="button" class=" btn btn-dark" onclick="aumentarcantidad(<%= i %>)">+</button>
                        </div>
                    </div>
                    <div class="gustos">
                        <h5 class="mb-1" type='text' >Total: $</h5><h5 type='text' id="precioAlimentos<%= i %>"> <%= (int)alimento.getPrecio() %></h5>
                    </div>
                    <div class="">
                        <button type="button" id="agregarAlPedido<%= i %>"  class="btn btn-success w-20 py-1 px-0" onclick="agregar(<%= i %>)">Añadir al Pedido</button>
                    </div>
            </div>
            <div class="container altura mb-1">
                <div class="row">
                    <textarea class="form-control float-left" rows="2" style="resize: none;" id="aclaracion<%= i %>" placeholder="Alguna aclaracion?"></textarea>
                </div>
            </div>
            <div class="gustos">
                <%if(acompaniamiento != null){
                    for(Plato acompa : acompaniamiento){ %>
                        <label><input type="checkbox" onclick='agregarGusto("<%= acompa.getNombre() %>")' value="first_checkbox"> <%= acompa.getNombre() %></label>
           <%         }
                    }   %>
            </div>
        </div>
        <div class="tab-pane fade" id="profile<%= i %>" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: <%= alimento.getTiempoPreparacion() %> min</p>
            <p>Calorias: 500</p>
        </div>
        <div class="tab-pane fade" id="contact<%= i %>" role="tabpanel" aria-labelledby="contact-tab">
            <div id="carouselExampleControls<%= i %>" class="carousel slide" data-ride="carousel">
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
                    <button class="btn btn-success input-group-text" id="basic-addon2<%= i %>">Comentar</button>
                </div>
            </div>
        </div>
    </div>
  </div>
                    <div class=" bg-transparent d-flex justify-content-center divFlecha m-0 p-0">
                        <buttom  class="botonDesplegar p-1 m-0" type="submit"  value="" onclick="mostrar(<%= i%>)" >
                            <img  class="botonDesplegar botonGira p-0 m-0 h-100" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
                        </buttom>  
                    </div>           
  </div>
  
    
    
<%
    i++;
    }
%>
</div>
</div>
<div class="container" id="container-busqueda" style="display:none;">
    <h5 class="m-1">Resultado de la busqueda<button id="cancelarBusqueda" class="btn bg-danger ml-2">X</button></h5>
    <p id="textoResultado"></p>
</div>
<jsp:include page="pie.jsp"/> 

