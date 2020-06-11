$("#buscar").click(function(){
  $("#wrapper").toggleClass("toggled");
  
  var containerCat=document.getElementById("container-categorias");
  var containerBus=document.getElementById("container-busqueda");
  containerCat.style.display = "none";
  containerBus.style.display = "block";
  
  var texto=document.getElementById("texto-Buscar").value;

  $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "textobuscar="+texto,
        success:function(respuesta){
            var mostrar="";
            var alimento = respuesta.split('//');
            
            
            for (i = 0; i < alimento.length; i++) {
                var nombre=alimento[i].split('-')[1];
                var id=alimento[i].split('-')[0];
                mostrar += 
                `
               <div class="card-body p-1 m-1 shadow-sm">
    <h4 class="card-title m-0 p-0" id="alimento<%= i %>">`+ nombre +`</h4>
    <input id="idAlimento<%= i %>" value="`+ id +`" style="display:none;">
    <p class="card-text p-0 m-1">"<%= alimento.getIngredientes() %>"</p>
    <div class="caja" style="display: none;">
        <ul class="nav nav-tabs " id="myTab`+ i +`" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab`+ i +`" data-toggle="tab" href="#home`+ i +`" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab`+ i +`" data-toggle="tab" href="#profile`+ i +`" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab`+ i +`" data-toggle="tab" href="#contact`+ i +`" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home`+ i +`" role="tabpanel" aria-labelledby="home-tab">

                <div class="container pl-1">
                    <div class="row my-2">
                        <div class="col-6">
                            <h5 class="float-left mb-1"> Cantidad: </h5><h5 class="float-left mb-1" id="cantidadAlimentos`+ i +`">1</h5>
                        </div>
                        <div class="col-1 ml-2">
                            <button id="botonMenos" type="button" class=" btn btn-dark float-left " onclick="disminuircantidad(`+ i +`)">-</button>
                        </div>
                        <div class="col-1 ml-1">
                            <button id="botonMas" type="button" class=" btn btn-dark" onclick="aumentarcantidad(`+ i +`)">+</button>
                        </div>
                    </div>
                    <div class="w-100 m-0 p-0">
                        <h5 class="float-left mb-1" type='text' >Total: $</h5><h5 type='text' id="precioAlimentos`+ i +`"> <%= alimento.getPrecio() %></h5>
                    </div>

            </div>
            <p class="m-0 ml-1 p-0">Alguna aclaracion?</p>   
            <div class="container altura mb-1">
                <div class="row">
                    <div class="col-7 pb-1 ml-0 pl-0">
                        <textarea class="form-control float-left" rows="2" style="resize: none;" id="aclaracion<%= i %>"></textarea>
                    </div>
                    <div class="col-5 p-0 ">
                        <button type="button" id="agregarAlPedido`+ i +`"  class="btn btn-success w-20 py-1 px-0" onclick="agregar(<%= i %>)">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="profile`+ i +`" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: <%= alimento.getTiempoPreparacion() %> min</p>
            <p>Calorias: 500</p>
        </div>
        <div class="tab-pane fade" id="contact`+ i +`" role="tabpanel" aria-labelledby="contact-tab">
            <div id="carouselExampleControls`+ i +`" class="carousel slide" data-ride="carousel">
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
                      <div class=" bg-transparent border d-flex justify-content-center divFlecha m-0 p-0">
                          <buttom  class="botonDesplegar p-1 m-0" type="submit"  value="" onclick="mostrar(`+ i +`)" >
                              <img  class="botonDesplegar botonGira p-0 m-0 h-100" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
                          </buttom>  
                      </div>           
    </div>
                `;
                
            }
            
            var textoResultado=document.getElementById("textoResultado");
            textoResultado.innerHTML = mostrar;

        },
        error: function() {
            alert("Ocurrio un error");
        }
    });
  
});

$("#cancelarBusqueda").click(function(){
  var containerCat=document.getElementById("container-categorias");
  var containerBus=document.getElementById("container-busqueda");
  containerCat.style.display = "block";
  containerBus.style.display = "none";
});
