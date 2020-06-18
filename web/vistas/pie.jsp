<%-- 
    Document   : pie
    Created on : 27/04/2020, 10:27:52 PM
    Author     : Danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="overlay" id="overlay">
    <div class="popup" id="popup">
        <h3 id="tituloPedido"></h3>
        <form>
            <table class="contenedor-inputs" id="pedido">
        <%-- Con javascript le meto el contenido --%>
            </table>
            
            <div id="total">
        <%-- Con javascript le meto el contenido --%>
            </div>
            <input type="submit" id="cancelar" class="btn-submit" value="CANCELAR">
            <input type="submit" id="siguiente" class="btn-submit" value="SIGUIENTE">
            <input type="submit" id="aceptar" class="btn-submit" value="ACEPTAR">
        </form>
    </div>
</div>

<div>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="#"> Tecnologo en Informatica</a>
  </div>
</footer>
</div>

<!-- jQuery -->
<script src="vistas/assets/js/jquery.js"></script>
<!-- Bootstrap -->
<script src="vistas/assets/js/bootstrap.min.js"></script>

<script src="vistas/assets/js/scripts.js" type="text/javascript"></script>
<script src="vistas/assets/js/busqueda.js" type="text/javascript"></script>


    </body>
</html>
