<%-- 
    Document   : detallesCategoria
    Created on : 28/04/2020, 09:27:04 AM
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--
    <script type="text/javascript">
         function mostrar(value){
             var caja = document.getElementsByClassName("caja")[value];
             var boton = document.getElementsByClassName("botonGira")[value];
             if(caja.style.display=="none"){
                 caja.style.display="block";
                 
                boton.style.webkitTransform = "rotate(" + -180 + "deg)";
                boton.style.mozTransform = "rotate(" + -180 + "deg)";
                boton.style.transform = "rotate(" + -180 + "deg)";
             }else{
                caja.style.display="none";
                boton.style.webkitTransform = "rotate(" + 0 + "deg)";
                boton.style.mozTransform = "rotate(" + 0 + "deg)";
                boton.style.transform = "rotate(" + 0 + "deg)";
             }
         }
    </script>
--%>

    <jsp:include page="cabecera.jsp" />
    
<img class="p-2 imagenPrincipioPlatos" src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
<div class="card m-1">
  <div class="card-body">
    <h4 class="card-title">Canadiense al plato $350</h4>
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
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Reseña</a>
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
                        <button type="button" class="btn btn-success w-20">Añadir al Pedido</button>
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
            <div class="card m-1">
                <div class="card-header">
                    Usuario1
                </div>
                <div class="card-body">
                    <p class="card-text">Muy bueno el chivito, lo recomiendo!</p>
                </div>
            </div>
        </div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom  class="botonDesplegar " type="submit"  value="" onclick="mostrar('0')" >
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
</div>
    
    
    <!-- -------------------------------------------------------------------------------------------------------------------------- -->
    <div class="card m-3">
  <div class="card-body">
    <h5 class="card-title">Canadiense al plato</h5>
    <p class="card-text">Jamon, lechuga ,tomate,panceta, huevofrito,mozzarella,mayonesa y fritas</p>
    <div class="caja"  style="display: none;">
    <ul class="nav nav-tabs " id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Reseña</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">cosas de aniadir</div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">cosas de detalles</div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">las resenias</div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border d-flex justify-content-center">
      <buttom class="botonDesplegar " type="submit"  value="" onclick="mostrar('1')">
          <img  class="botonDesplegar botonGira" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
</div>
    
<jsp:include page="pie.jsp"/> 