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

%>
    
<img class="p-2 imagenPrincipioPlatos" src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="Imigen de categoria"/>
<div class="card m-1">
    
<%  int i = 0;
    for(Plato alimento : lista){
    
%>
    
  <div class="card-body">
      <h4 class="card-title" id="chivito0">"<%= alimento.getNombre() %>"</h4>
    <p class="card-text">"<%= alimento.getIngredientes() %>"</p>
    <div class="caja" style="display: none;">
    <ul class="nav nav-tabs " id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="my-2">
                <h5 class="float-left my-1">Cantidad: 1</h5>
                <button type="button" class="ml-5 mx-1 btn btn-dark float-left ">-</button>
                <button type="button" class="mx-1 btn btn-dark">+</button>
                <h5>Total: 350$</h5>
            </div>
            <p>Alguna aclaracion?</p>   
            <div class="container">
                <div class="row">
                    <div class="col-7">
                        <textarea class="form-control w-20 float-left" id="" rows="3" style="resize: none;"></textarea>
                    </div>
                    <div class="col-5">
                        <button type="button" id="agregarAlPedido'<%= +i %>'"  class="btn btn-success w-20" onclick="agregar('<%= i %>')">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: "<%= alimento.getTiempoPreparacion() %>" min</p>
            <p>Calorias: 500</p>
            <%--            <div class="container">
                <div class="row my-1 ">
                    <div class="col ">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
            </div> --%>
        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <!--<div class="card m-1">
                <div class="card-header">
                    Usuario1
                </div>
                <div class="card-body">
                    <p class="card-text">Muy bueno el chivito, lo recomiendo!</p>
                </div>
            </div>
            -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                    <button class="btn btn-success input-group-text" id="basic-addon2">Comentar</button>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom  class="botonDesplegar " type="submit"  value="" onclick="mostrar('<%= i %>')" >
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
    
    
<%
    i++;
    }
%>

<%--
      <div class="card-body">
    <h4 class="card-title" id="chivito1">Canadiense de lomo $ 430</h4>
    <p class="card-text">Ingredientes: Jamon, lechuga , tomate, panceta, huevofrito, mozzarella,mayonesa y fritas</p>
    <div class="caja" style="display: none;">
    <ul class="nav nav-tabs " id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="my-2">
                <h5 class="float-left my-1">Cantidad: 1</h5>
                <button type="button" class="ml-5 mx-1 btn btn-dark float-left ">-</button>
                <button type="button" class="mx-1 btn btn-dark">+</button>
                <h5>Total: 350$</h5>
            </div>
            <p>Alguna aclaracion?</p>   
            <div class="container">
                <div class="row">
                    <div class="col-7">
                        <textarea class="form-control w-20 float-left" id="" rows="3" style="resize: none;"></textarea>
                    </div>
                    <div class="col-5">
                        <button type="button" id="agregarAlPedido1" class="btn btn-success w-20" onclick="agregar('1')">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: 20 min</p>
            <p>Calorias: 500</p>
            <div class="container">
                <div class="row my-1 ">
                    <div class="col ">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <!--<div class="card m-1">
                <div class="card-header">
                    Usuario1
                </div>
                <div class="card-body">
                    <p class="card-text">Muy bueno el chivito, lo recomiendo!</p>
                </div>
            </div>
            -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                    <button class="btn btn-success input-group-text" id="basic-addon2">Comentar</button>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom  class="botonDesplegar " type="submit"  value="" onclick="mostrar('1')" >
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
      <div class="card-body">
    <h4 class="card-title" id="chivito2">Chivito light de lomo $ 430</h4>
    <p class="card-text">Ingredientes: Jamon, lechuga , tomate, panceta, huevofrito, mozzarella,mayonesa y fritas</p>
    <div class="caja" style="display: none;">
    <ul class="nav nav-tabs " id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="my-2">
                <h5 class="float-left my-1">Cantidad: 1</h5>
                <button type="button" class="ml-5 mx-1 btn btn-dark float-left ">-</button>
                <button type="button" class="mx-1 btn btn-dark">+</button>
                <h5>Total: 350$</h5>
            </div>
            <p>Alguna aclaracion?</p>   
            <div class="container">
                <div class="row">
                    <div class="col-7">
                        <textarea class="form-control w-20 float-left" id="" rows="3" style="resize: none;"></textarea>
                    </div>
                    <div class="col-5">
                        <button type="button" id="agregarAlPedido2" class="btn btn-success w-20" onclick="agregar('2')">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: 20 min</p>
            <p>Calorias: 500</p>
            <div class="container">
                <div class="row my-1 ">
                    <div class="col ">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <!--<div class="card m-1">
                <div class="card-header">
                    Usuario1
                </div>
                <div class="card-body">
                    <p class="card-text">Muy bueno el chivito, lo recomiendo!</p>
                </div>
            </div>
            -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                    <button class="btn btn-success input-group-text" id="basic-addon2">Comentar</button>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom  class="botonDesplegar " type="submit"  value="" onclick="mostrar('2')" >
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
</div>

--%>

<jsp:include page="pie.jsp"/> 

