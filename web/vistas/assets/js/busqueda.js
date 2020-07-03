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
            var mostrar="",mostrarCategorias="",segundaParte="";
            var categoria = respuesta.split("'");
            var continuar=0;
            
            if(respuesta.localeCompare("-1")===0){
                mostrar+= "<br><p>No se encontraron resultados</p>";
            }else{
            if(categoria[0].split('//')[0].localeCompare("categoria")===0){  //me fijo si vienen categorias
                
                for(i=0;i<categoria.length-1;i++){
                    var id= categoria[i].split('//')[1];
                    var nombre= categoria[i].split('//')[2];
                    mostrarCategorias+=`Estas buscando <button class="btn btn-primary" onclick= "location.href='?caso=`+nombre+`'; ">`+nombre+`</button>?<br>`;
                }
                mostrar+=mostrarCategorias;
                segundaParte=categoria[categoria.length-1];
                
            }else{
                segundaParte=respuesta;
            }
            
            var alimento = segundaParte.split('//');
            if(alimento[0].localeCompare("no")===0&&alimento[1].localeCompare("no")===0){           
                    mostrar += "<br><p>No se encontraron resultados</p>";
                    continuar=2;
                }else{
                    if(alimento[0].localeCompare("no")===0&&alimento[1].localeCompare("no")!=0){  
                       mostrar += "<p>No se encontraron resultados, busquedas relacionadas:</p>"; 
                       continuar=1;
                    }
                }
            for (i = 0+continuar; i < alimento.length-1; i++) {
                //se realizo busqueda con la primer palabra y se no encontraron resultados
                        var partes = alimento[i].split('-');
                        var id = partes[0];
                        var nombre = partes[1];
                        var ingredientes = partes[2];
                        var precio = partes[3];
                        var tiempo = partes[4];
                        var u = i+100;
                        mostrar += 
                `
               <div class="card-body p-1 m-1 shadow-sm">
    <h4 class="card-title m-0 p-0" id="alimento`+ u +`">`+ nombre +`</h4>
    <input id="idAlimento`+ u +`" value="`+ id +`" style="display:none;">
    <p class="card-text p-0 m-1">`+ ingredientes +`</p>
    <div class="cajaAux" style="display: none;">
        <ul class="nav nav-tabs " id="myTab`+ u +`" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab`+ u +`" data-toggle="tab" href="#home`+ u +`" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab`+ u +`" data-toggle="tab" href="#profile`+ u +`" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab`+ u +`" data-toggle="tab" href="#contact`+ u +`" role="tab" aria-controls="contact" aria-selected="false">Reseñas</a>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home`+ u +`" role="tabpanel" aria-labelledby="home-tab">

                <div class="container pl-1">
                    <div class="row my-2">
                        <div class="col-6">
                            <h5 class="float-left mb-1"> Cantidad: </h5><h5 class="float-left mb-1" id="cantidadAlimentos`+ u +`">1</h5>
                        </div>
                        <div class="col-1 ml-2">
                            <button id="botonMenos" type="button" class=" btn btn-dark float-left " onclick="disminuircantidad(`+ u +`)">-</button>
                        </div>
                        <div class="col-1 ml-1">
                            <button id="botonMas" type="button" class=" btn btn-dark" onclick="aumentarcantidad(`+ u +`)">+</button>
                        </div>
                    </div>
                    <div class="w-100 m-0 p-0">
                        <h5 class="float-left mb-1" type='text' >Total: $</h5><h5 type='text' id="precioAlimentos`+ u +`"> `+ precio +`</h5>
                    </div>

            </div>
            <p class="m-0 ml-1 p-0">Alguna aclaracion?</p>   
            <div class="container altura mb-1">
                <div class="row">
                    <div class="col-7 pb-1 ml-0 pl-0">
                        <textarea class="form-control float-left" rows="2" style="resize: none;" id="aclaracion`+ u +`"></textarea>
                    </div>
                    <div class="col-5 p-0 ">
                        <button type="button" id="agregarAlPedido`+ u +`"class="btn btn-success w-20 py-1 px-0" onclick="agregar(`+ u +`)">Añadir al Pedido</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="profile`+ u +`" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: `+ tiempo +` min</p>
            <p>Calorias: 500</p>
        </div>
        <div class="tab-pane fade" id="contact`+ u +`" role="tabpanel" aria-labelledby="contact-tab">
            <div id="carouselExampleControls`+ u +`" class="carousel slide" data-ride="carousel">
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
                    <button class="btn btn-success input-group-text" id="basic-addon2`+ u +`">Comentar</button>
                </div>
            </div>
        </div>
    </div>
    </div>
                      <div class=" bg-transparent border d-flex justify-content-center divFlecha m-0 p-0">
                          <buttom  class="botonDesplegar p-1 m-0" type="submit"  value="" onclick="mostrar(`+ u +`)" >
                              <img  class="botonDesplegar botonGiraAux p-0 m-0 h-100" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
                          </buttom>  
                      </div>           
    </div>
                `;
                
            
            }
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
