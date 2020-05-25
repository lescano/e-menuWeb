
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




$(document).ready(function(){
//muestro y oculto el carrito
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    if(data !== null){
        $('#resumen').show();
    }else{
        $('#resumen').hide();
    }
      
//muestra y esconde el menu que se despliega
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    
});

//para obligar a la pagina que se recarge
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
    var nuevoPrecio = document.querySelector("#precio"+value).textContent;
    var nuevoCantidad= document.querySelector("#cantidad"+value).textContent;
    var agregar = [nuevoAlimento,nuevoPrecio,nuevoCantidad];
    
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
    overlay.classList.add('active');
    popup.classList.add('active');
    
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    var total = 0;
    var i =0;

    for (let entry of data) {
//        for (let item of entry) {
            $("#pedido").append('<i class="fas fa-times" id="fas'+i+'" onclick="eliminar('+i+')"></i><li id="opcion'+i+'">'+entry+'</li>');
            i++;
//        }
    }
    $("#total").append("<h4>Total: $"+total+"</h4>");
});

//Cuando el usuario hace click afuera de la pantalla se cierra y borra toda la lista que habia mostrado
window.onclick = function(event) {
  if (event.target === overlay) {
    overlay.classList.remove('active');
    popup.classList.remove('active');
    $( "li" ).remove();
    $("#total h4").remove();
  }
};

$("#aceptar").click(function (e){
    alert("Aceptaste");
});

$("#cancelar").click(function (){
    overlay.classList.remove('active');
    popup.classList.remove('active');
    $( "li" ).remove();
    $("#total h4").remove();
});

function eliminar (eliminar){
    $("#fas"+eliminar).remove();
    $("#opcion"+eliminar).remove();
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    
    data.splice(eliminar, 1); 
    sessionStorage.setItem('pedido',JSON.stringify(data));
    
    if(data.length < 1){
        $('#resumen').hide();
        overlay.classList.remove('active');
        popup.classList.remove('active');
    }
}