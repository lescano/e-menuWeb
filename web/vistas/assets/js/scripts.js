
//Variables que voy a usar en la ventana popup del pedido
var btnAbrirPopup = document.getElementById('resumen'),
          overlay = document.getElementById('overlay'),
            popup = document.getElementById('popup');

$(document).ready(function(){
//muestro el carrito
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var gusto = JSON.parse(sessionStorage.getItem("gusto"));
    if(data !== null){
        if(data.length > 0){
            $('#resumen').show();
        }
    }
      
//muestra y esconde el menu que se despliega
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    
});

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

//para obligar a la pagina que se recarge cuando navegas con la flecha para atras del navegador
//window.addEventListener( "pageshow", function ( event ) {
//  var historyTraversal = event.persisted || 
//                         ( typeof window.performance != "undefined" && 
//                              window.performance.navigation.type === 2 );
//  if ( historyTraversal ) {
//    // Handle page restore.
//    window.location.reload();
//  }
//});

//Va agregando pedidos al carrito
function agregar(value){
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var nuevoAlimento = $("#alimento"+value).text();
    var nuevoPrecio = $("#precioAlimentos"+value).text();
    var nuevoCantidad = $("#cantidadAlimentos"+value).text();
    var idAlimento = $("#idAlimento"+value).val();
    var aclaracion = $("#aclaracion"+value).val();
    
    var agregar = [nuevoAlimento,nuevoPrecio,nuevoCantidad,idAlimento,aclaracion];
    
    if(data === null){
        data = [];
    }else{
        data = JSON.parse(sessionStorage.getItem("pedido"));
    }
    data.push(agregar);
    sessionStorage.setItem('pedido',JSON.stringify(data));
    
    var cantidad = parseInt(nuevoCantidad);
    var precioAl = parseInt(nuevoPrecio);
    var precioInicial = precioAl/cantidad;
    $('#cantidadAlimentos'+value).text(1);
    $('#precioAlimentos'+value).text(precioInicial);
    
    $('#resumen').show();
}

//Cuando le dan click al carrito muestro el pedido
btnAbrirPopup.addEventListener('click', function(){
    $('#resumen').hide();
    $("#aceptar").hide();
    $("#siguiente").show();
    $("#tituloPedido").text("TU PEDIDO");
    overlay.classList.add('active');
    popup.classList.add('active');
    
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    cargarPedido(data);
});

//Cuando el usuario hace click afuera de la pantalla se cierra y borra toda la lista que habia mostrado
window.onclick = function(event) {
  if (event.target === overlay) {
    $('#resumen').show();
    overlay.classList.remove('active');
    popup.classList.remove('active');
    $( "#pedido *" ).remove();
    $("#total h4").remove();
  }
};

//Cuando acepta el pedido se manda la info a la base de datos a traves del servlet Alimentos
$("#aceptar").click(function (e){
    e.preventDefault();
    if($("#passwd").val()){
        var passwd = $("#passwd").val();
        var clave = sessionStorage.getItem("clave");
        if( clave === null){
            guardarPedido(passwd);
        }else{
            if( clave === passwd){
                guardarPedido(passwd);
            }else{
                $("#passwd").val("");
                $("#passwd").attr("placeholder", "Hay una clave activa, repitala.");
            }
        }
    }else{
        $("#passwd").css('background-color', 'lightcoral');
    }
});

$("#siguiente").click(function (e){
    e.preventDefault();
    $("#tituloPedido").text("Clave de seguridad");
    $( "#pedido *" ).remove();
    $("#total h4").remove();
    $("#pedido").append('<input type="text" id="passwd" placeholder="Sugerimos nombre y apellido.">');
    $("#pedido").append('<input type="text" id="rut" placeholder="Si quiere factura con rut, escribalo.">');
    $("#siguiente").hide();
    $("#aceptar").show();
});

//Cuando el usuario cancela se cierra y borra toda la lista que habia mostrado
$("#cancelar").click(function (e){
    e.preventDefault();
    $('#resumen').show();
    overlay.classList.remove('active');
    popup.classList.remove('active');
    $( "#pedido *" ).remove();
    $("#total h4").remove();
});

function aumentarcantidad(item){
    var cant = $('#cantidadAlimentos'+item).text();
    var prAl = $('#precioAlimentos'+item).text();
    
    var cantidad = parseInt(cant);
    var precioAl = parseInt(prAl);
    var precioInicial = precioAl/cantidad;
    $('#cantidadAlimentos'+item).text(cantidad+1);
    $('#precioAlimentos'+item).text(precioInicial*(cantidad+1));
    
}

function disminuircantidad(item){
    var cant = $('#cantidadAlimentos'+item).text();
    var prAl = $('#precioAlimentos'+item).text();
    
    var cantidad = parseInt(cant);
    var precioAl = parseInt(prAl);
    var precioInicial = precioAl/cantidad;
    
    if(cantidad > 1){
        $('#cantidadAlimentos'+item).text(cantidad-1);
        $('#precioAlimentos'+item).text(precioInicial*(cantidad-1));        
    }
}
   
//Para eliminar los productos que el usuario quiera de la lista
function eliminar (eliminar){
    var data = JSON.parse(sessionStorage.getItem("pedido"));
 //borro todo
    $( "#pedido *" ).remove();
    $("#total h4").remove();
    
    data.splice(eliminar, 1); 
    sessionStorage.setItem('pedido',JSON.stringify(data));

    cargarPedido(data);
    
    if(data.length < 1){
        $("#total h4").remove();
        $('#resumen').hide();
        overlay.classList.remove('active');
        popup.classList.remove('active');
    }
}

$(".containerText").each(function(){            //esto es para que las imagenes queden bien sean del tamano que sean
    var refRatio = 240/300;
    var imgH = $(this).children("img").height();
    var imgW = $(this).children("img").width();

    if ( (imgW/imgH) < refRatio ) { 
        $(this).addClass("landscape");
    } else {
        $(this).addClass("portrait");
    }
});

$("#pagar").click(function (e){
    e.preventDefault();
    window.location.reload();
//    var mozo = sessionStorage.getItem("mozo");
//    pagar(mozo);
});

function cargarPedido(data){
    var total = 0;
    var i =0;
     //Vuelvo a crear la tabla 
    for (let entry of data) {
        $("#pedido").append('<tr id="opcion'+i+'">\n\
                                <td><i class="fas fa-times" id="fas'+i+'" onclick="eliminar('+i+')"></i></td>\n\
                                <td>'+entry[2]+'</td>\n\
                                <td>'+entry[0]+'</td>\n\
                                <td>$'+entry[1]+'</td>\n\
                                <td>'+entry[4]+'</td>\n\
                            </tr>');
        i++;
        total = parseInt(total) + parseInt(entry[1]);
    }
    $("#total").append("<h4>Total: $"+total+"</h4>");
}

function pagarTodo(mozo){
    if(clickeo){
      pagarTodoMetodo(mozo, "tarjeta");
      clearTimeout(retardo);
      clickeo = false;
    }else{
        clickeo = true;
        retardo = setTimeout(function() { 
           pagarTodoMetodo(mozo, "efectivo");
           clickeo = false;
        }, 300);
    }
}
function pagarTodoMetodo(mozo,tipoPago){
    $.ajax({
    url: "/e-menuWeb/alimentos",
    type: "POST",
    data: "tipoPago="+tipoPago,
    success:function(){
            sessionStorage.removeItem('clave');
            sessionStorage.removeItem('mozo');
            $("#pagar").removeClass("pedido");
            alert("En un instante sera atendido por "+mozo);
            $("#overlayPedido").removeClass("active");
            $("#popupPedido").removeClass("active");
    },
    error: function() {
        alert("Ocurrio un error, informelo.");
    }
});
}

var clickeo = false;
var retardo;
function pagar(mozo, idPedido, n){
    if(clickeo){
      pagarParticular(mozo, idPedido, n, "tarjeta");
      clearTimeout(retardo);
      clickeo = false;
    }else{
        clickeo = true;
        retardo = setTimeout(function() { 
           pagarParticular(mozo, idPedido, n, "efectivo");
           clickeo = false;
        }, 300);
    }
}
function pagarParticular(mozo, idPedido, n, tipoPago){
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "idPedido="+idPedido+"&tipoPago="+tipoPago,
        success:function(){
                var inicial = $("#totalPedidos h3").text().split("$ ");
                var actual = $("#numPedido"+n+" td:nth-child(3)").text().split("$ ");
                var total = inicial[1]-actual[1];
                sessionStorage.removeItem('clave');
                sessionStorage.removeItem('mozo');
                $("#numPedido"+n).css("text-decoration", "line-through");
                $("#numPedido"+n).css("text-decoration-thickness", ".2em");
                $("#btnPagar"+n).css("background-color", "red");
                $("#btnPagar"+n).attr("disabled", true);
                $("#totalPedidos h3").remove();
                $("#totalPedidos").append("<h3>Total: $ "+total+"</h3>");
                
                if(total <= 0 || total === "NaN"){
                    sessionStorage.removeItem('clave');
                    sessionStorage.removeItem('mozo');
                    $("#pagar").removeClass("pedido");
                    $("#overlayPedido").removeClass("active");
                    $("#popupPedido").removeClass("active");
                }
                alert("En un instante sera atendido por "+mozo);
        },
        error: function() {
            alert("Ocurrio un error, informelo.");
        }
    });
}

function comprobarClave(claveActual,mozo){
    sessionStorage.setItem('clave',claveActual);
    sessionStorage.setItem('mozo',mozo);
    $("#overlayPedido").removeClass("active");
    $("#popupPedido").removeClass("active");
    $("#pagar").removeClass("pedido");
}

function guardarPedido(passwd){
    var rut = $("#rut").val();
    let valido = validate_isRUT(rut);
    if( valido !== true && rut !== ""){
        $("#rut").val("");
        $("#rut").attr("placeholder", "Aparentemente el RUT no es valido, verifiquelo.");
        $("#rut").css('background-color', 'lightcoral');
    }else{
        var data = JSON.parse(sessionStorage.getItem("pedido"));
        var acompaniamiento = [];
        var c;
        var al;
        for (let entry of data) {
            al = entry[0].split(' ').join('_');
            c = JSON.parse(sessionStorage.getItem(al));
            if(c !== null){
                if (c.length > 0) {
                    acompaniamiento.push(entry[3]);
                    acompaniamiento.push(c);
                }
            }
        }
        $.ajax({
            url: "/e-menuWeb/alimentos",
            type: "POST",
            data: "pedido="+data+"&password="+passwd+"&rut="+rut+"&extra="+acompaniamiento,
            success: function(respuesta) {
                sessionStorage.setItem('clave',respuesta);
                alert("En el menu lateral tiene la opción de pagar.");
            },
            error: function() {
                alert("Ocurrio un error, informelo.");
            }
        });
        sessionStorage.removeItem('pedido');
        overlay.classList.remove('active');
        popup.classList.remove('active');
        $( "#pedido *" ).remove();
        $("#total h4").remove();
        $("#pagar").removeClass("pedido");
    }
}

function validate_isRUT(rut)
{
	if (rut.length != 12){
		return false;
	}
	if (!/^([0-9])*$/.test(rut)){
               return false;
  	}
	var dc = rut.substr(11, 1);
	var rut = rut.substr(0, 11);
	var total = 0;
	var factor = 2;
 
	for (i = 10; i >= 0; i--) {
		total += (factor * rut.substr(i, 1));
		factor = (factor == 9)?2:++factor;
	}
 
	var dv = 11 - (total % 11);
 
	if (dv == 11){
		dv = 0;
	}else if(dv == 10){
		dv = 1;
	}
	if(dv == dc){
		return true;
	}
	return false;
}

function agregarGusto(alimento, agregarGusto, cantidad){
    var gusto = JSON.parse(sessionStorage.getItem(alimento));
    if(gusto === null){
        gusto = [];
        gusto.push(agregarGusto);
    }else{
        var pos = gusto.indexOf(agregarGusto);
        if(pos >= 0){
            gusto.splice(pos, 1);
            $(".max_extra h6").css("fontSize", "initial");
            $(".max_extra h6").css("color", "cornflowerblue");
        }else{
            if(gusto.length >= cantidad){
                $("#"+alimento+"-"+agregarGusto).prop('checked', false);
                $(".max_extra h6").css("fontSize", "large");
                $(".max_extra h6").css("color", "crimson");
            }else{
                gusto.push(agregarGusto);
                $(".max_extra h6").css("fontSize", "initial");
                $(".max_extra h6").css("color", "cornflowerblue");
            }
        }
    }
    sessionStorage.setItem(alimento,JSON.stringify(gusto));
}

///////////////////////////////////////////////////////comentar************************************************************************************
function comentar(id){
  var nombre=document.getElementById("nombre"+id).value;
  var descripcion=document.getElementById("descripcion"+id).value;
  document.getElementById("nombre"+id).value="";
  document.getElementById("descripcion"+id).value="";
  //alert(id);
  //containerCat.style.display = "none";
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "comentar="+id+"/"+nombre+"/"+descripcion,
        success:function(respuesta){
            actualizarComentarios(id)
            //alert(respuesta);
            //var textoResultado=document.getElementById("textoResultado");
            //textoResultado.innerHTML = mostrar;

        },
        error: function() {
            alert("Ocurrio un error");
        }
    });
}
///////////////////////////////////////////////////////comentar-FIN************************************************************************************
function actualizarComentarios(id){
  //var nombre=document.getElementById("nombre"+id).value;
  //var descripcion=document.getElementById("descripcion"+id).value;
  //alert(id);
  //containerCat.style.display = "none";
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "actualizar="+id,
        success:function(respuesta){
            //alert(respuesta);
            var componente=document.getElementById("comentarios"+id);
            if(!(respuesta==="error")){                
                var partes = respuesta.split('//');
                var activo="";
                var final="";
                for (i = 0; i < partes.length-1; i++) {
                    if(i===partes.length-2){
                        activo="active";
                    }else{
                        activo="";
                    }
                    final+=`
                        <div class="carousel-item `+activo+`">
                            <div class="card m-1 mx-5">
                                <div class="card-header">
                                    `+partes[i].split('-')[0]+`
                                </div>
                                <div class="card-body">
                                    <p class="card-text">
                                        `+partes[i].split('-')[1]+`
                                    </p>
                                </div>
                            </div>
                        </div>`;

                } 
            }else{
                final+=`
                        <div class="carousel-item active">
                            <div class="card m-1 mx-5">
                                <div class="card-body">
                                    <p class="card-text">
                                        no hay comentarios
                                    </p>
                                </div>
                            </div>
                        </div>`;
            }
            componente.innerHTML=final;
        },
        error: function() {
            alert("Ocurrio un error");
        }
    });
}
$("#boton-ayuda").click(function(){
  $("#wrapper").toggleClass("toggled");
 
 })
