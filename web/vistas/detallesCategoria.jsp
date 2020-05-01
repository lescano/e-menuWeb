<%-- 
    Document   : detallesCategoria
    Created on : 28/04/2020, 09:27:04 AM
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/miEstilo.css" rel="stylesheet" type="text/css"/>
    <script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script type="text/javascript">
         function mostrar(value){
             var caja = document.getElementsByClassName("caja")[value];
             if(caja.style.display=="none"){
                 caja.style.display="block";
             }else{
                 caja.style.display="none";
             }
         }
    </script>
    <!--<%@ include file="cabecera.jsp" %>-->
    <jsp:include page="cabecera.jsp" />
<img class="p-2 imagenPrincipioPlatos" src="assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
<div class="card m-3">
  <div class="card-body">
    <h5 class="card-title">Canadiense al plato</h5>
    <p class="card-text">Jamon, lechuga ,tomate,panceta, huevofrito,mozzarella,mayonesa y fritas</p>
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
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">cosas de aniadir</div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">cosas de detalles</div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">las resenias</div>
    </div>
  </div>
  </div>
  <div class=" bg-transparent border ">
      <buttom class="botonDesplegar " type="submit"  value="" onclick="mostrar('0')">
          <img  class="botonDesplegar" src="assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
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
  <div class="bg-transparent border">
      <buttom class="botonDesplegar " type="submit"  value="" onclick="mostrar('1')">
          <img  class="botonDesplegar" src="assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
      </buttom>  
  </div>
</div>
</body>
<jsp:include page="pie.jsp"/> 
</html>