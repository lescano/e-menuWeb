
//Variables que voy a usar en la ventana popup del pedido
var btnAbrirPopup = document.getElementById('resumen'),
          overlay = document.getElementById('overlay'),
            popup = document.getElementById('popup');

$(document).ready(function(){
//muestro el carrito
    var data = JSON.parse(sessionStorage.getItem("pedido"));
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
window.addEventListener( "pageshow", function ( event ) {
  var historyTraversal = event.persisted || 
                         ( typeof window.performance != "undefined" && 
                              window.performance.navigation.type === 2 );
  if ( historyTraversal ) {
    // Handle page restore.
    window.location.reload();
  }
});

//Va agregando pedidos al carrito
function agregar(value){
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var nuevoAlimento = document.querySelector("#alimento"+value).textContent;
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
    $("#pedido").append('<input type="text" id="passwd" placeholder="Para identificar su pedido.">');
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
    var mozo = sessionStorage.getItem("mozo");
    pagar(mozo);
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
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "pagar=si",
        success:function(){
                sessionStorage.setItem('clave',null);
                sessionStorage.setItem('mozo',null);
                $("#overlayPedido").removeClass("active");
                $("#popupPedido").removeClass("active");
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

function pagar(mozo, idPedido, n){
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "pagar=si&idPedido="+idPedido,
        success:function(){
                sessionStorage.setItem('clave',null);
                sessionStorage.setItem('mozo',null);
                $("#numPedido"+n).css("text-decoration", "line-through");
                $("#numPedido"+n).css("text-decoration-thickness", ".2em");
                $("#btnPagar"+n).css("background-color", "red");
                $("#btnPagar"+n).attr("disabled", true);
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
    if( valido !== true){
        $("#rut").val("");
        $("#rut").attr("placeholder", "Aparentemente el RUT no es valido, verifiquelo.");
        $("#rut").css('background-color', 'lightcoral');
    }else{
        var data = JSON.parse(sessionStorage.getItem("pedido"));
        $.ajax({
            url: "/e-menuWeb/alimentos",
            type: "POST",
            data: "pedido="+data+"&password="+passwd+"&rut="+rut,
            success: function(respuesta) {
                sessionStorage.setItem('clave',respuesta);
            },
            error: function() {
                alert("Ocurrio un error, informelo.");
            }
        });
        sessionStorage.setItem('pedido',null);
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

///                                              scripts busqueda

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
            
            var textoResultado=document.getElementById("textoResultado");
            textoResultado.innerHTML = respuesta;

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

///                                               fin scripts busqueda