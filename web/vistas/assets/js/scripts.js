
function mostrar(value){
    var caja = document.getElementsByClassName("caja")[value];
    var boton = document.getElementsByClassName("botonGira")[value];
    var h1Text = document.querySelector("#alimento"+value).textContent;
    if(caja.style.display=="none"){
        caja.style.display="block";
        boton.style.webkitTransform = "rotate(" + -180 + "deg)";
        boton.style.mozTransform = "rotate(" + -180 + "deg)";
        boton.style.transform = "rotate(" + -180 + "deg)";
        $("#agregarAlPedido"+value).val(h1Text);
    }else{
       caja.style.display="none";
       boton.style.webkitTransform = "rotate(" + 0 + "deg)";
       boton.style.mozTransform = "rotate(" + 0 + "deg)";
       boton.style.transform = "rotate(" + 0 + "deg)";
   }
}

//muestra y esconde el menu que se despliega
$("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

    var data = JSON.parse(sessionStorage.getItem("pedido"));
    if(data !== null){
        $('#resumen').css('display','block');
    }

//Va agregando pedidos 
function agregar(value){
    var data = JSON.parse(sessionStorage.getItem("pedido"));
    $('#resumen').css('display','block');
    if(data === null){
        var p = [$("#agregarAlPedido"+value).val()];
        sessionStorage.setItem('pedido', JSON.stringify(p));
    }else{
        data = JSON.parse(sessionStorage.getItem("pedido"));
        data.push($("#agregarAlPedido"+value).val());
        sessionStorage.setItem('pedido',JSON.stringify(data));
    }
}

function verPedido(){
    data = sessionStorage.getItem('pedido');
    alert(data);
}