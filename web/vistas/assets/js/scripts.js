
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