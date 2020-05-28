
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
    var nuevoPrecio = $("#precioAlimentos"+value).val();
    var nuevoCantidad = $("#cantidadAlimentos"+value).val();
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
    
    $('#resumen').show();
}
//Variables que voy a usar en la ventana popup del pedido
var btnAbrirPopup = document.getElementById('resumen'),
          overlay = document.getElementById('overlay'),
            popup = document.getElementById('popup');

//Cuando le dan click al carrito muestro el pedido
btnAbrirPopup.addEventListener('click', function(){
    $('#resumen').hide();
    overlay.classList.add('active');
    popup.classList.add('active');
    
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var total = 0;
    var i = 0;

//Armo la tabla de pedidos entry[0] es el nombre entry[1] es el precio entry[2] es la cantidad
    for (let entry of data) {
        $("#pedido").append('<tr id="opcion'+i+'">\n\
                                <td><i class="fas fa-times" id="fas'+i+'" onclick="eliminar('+i+')"></i></td>\n\
                                <td>'+entry[2]+'</td>\n\
                                <td>'+entry[0]+'</td>\n\
                                <td>'+entry[1]+'</td>\n\
                            </tr>');
        i++;
        total = parseInt(total) + parseInt(entry[1]);
    }
    $("#total").append("<h4>Total: $"+total+"</h4>");
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

$("#aceptar").click(function (e){
    e.preventDefault();
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    $.ajax({
        url: "/e-menuWeb/alimentos",
        type: "POST",
        data: "pedido="+data
    })
    alert("Aceptaste");
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

function aumentarcantidad(){
    //En este bloque se consulta una variable de session 
    //para saber si es la primera vez que entra a la funcion o no
    //en caso de ser la primera vez se va a guardar en la session el precio del alimento
    //para despues poder sumarlo cuando se aumente la cantidad
    var data = JSON.parse(sessionStorage.getItem("precio"));
    var cantidad = document.getElementById('cantidadAlimentos');
    var precioAl = document.getElementById('precioAlimentos');
    if(data === null){
        var p = [$("#precioAlimentos").val()];
        sessionStorage.setItem('precio', JSON.stringify(p));
    }else{
        //en este if controlo que si se setea una cantidad menor a uno, esa cantidad sea uno
        //el precio queda acorde a la cantidad
        if (cantidad.value < 1){
            cantidad.value = 1;
            precioAl.value = data;
        }
        //si la cantidad es 1 o mas la cantidad se aumenta y el precio tambien
        else {
            cantidad.value = ++cantidad.value;
            precioAl.value = parseInt(precioAl.value)+parseInt(data);
        }
    }
}

function disminuircantidad(){
    
    var data = JSON.parse(sessionStorage.getItem("precio"));
    var cantidad = document.getElementById('cantidadAlimentos');
    var precioAl = document.getElementById('precioAlimentos');
    if(data === null){
        var p = [$("#precioAlimentos").val()];
        sessionStorage.setItem('precio', JSON.stringify(p));
    }else{
        //en este primer if disminuto la cantidad si el valor es 2 o mas,
        //entonces al disminuir la menor cantidad que queda es 1
        //tambien se disminuye el precio
        if (cantidad.value > 1){
            cantidad.value = --cantidad.value;
            precioAl.value = parseInt(precioAl.value)-parseInt(data);
        }
        //si se setea un valor 1 o menor a la cantidad, el valor de la cantidad queda en 1
        //el precio queda como al principio
        else{
            cantidad.value = 1;
            precioAl.value = data;
        }
    }
   }
   
//Para eliminar los productos que el usuario quiera de la lista
function eliminar (eliminar){
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var total = 0;
    var i =0;
 //borro todo
    $( "#pedido *" ).remove();
    $("#total h4").remove();
    
    data.splice(eliminar, 1); 
    sessionStorage.setItem('pedido',JSON.stringify(data));
 //Vuelvo a crear la tabla 
    for (let entry of data) {
        $("#pedido").append('<tr id="opcion'+i+'">\n\
                                <td><i class="fas fa-times" id="fas'+i+'" onclick="eliminar('+i+')"></i></td>\n\
                                <td>'+entry[2]+'</td>\n\
                                <td>'+entry[0]+'</td>\n\
                                <td>'+entry[1]+'</td>\n\
                            </tr>');
        i++;
        total = parseInt(total) + parseInt(entry[1]);
    }
    $("#total").append("<h4>Total: $"+total+"</h4>");
    
    if(data.length < 1){
        $("#total h4").remove();
        $('#resumen').hide();
        overlay.classList.remove('active');
        popup.classList.remove('active');
    }
}
