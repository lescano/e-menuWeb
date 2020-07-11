<%-- 
    Document   : pie
    Created on : 27/04/2020, 10:27:52 PM
    Author     : Danilo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Pedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    List<Pedidos> pedidos = (List<Pedidos>)request.getAttribute("pedidos");
    int cant=0;
    int total=0;
    String mozo="";
    String clave = "";
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
%>

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
    <% 
        if(pedidos != null){
    %>
<div class="overlay active" id="overlayPedido">
    <div class="popup active" id="popupPedido">
        <h3 id="tituloPedido">Pedidos realizados</h3>
        <form>
            <table class="contenedor-inputs" >
        <% 
            for(Pedidos pedido : pedidos){
                cant++;
                total+=pedido.getPrecio_total(); 
                clave = pedido.getContrasenia();
                if(pedido.getPersonal() != null){
                    mozo = pedido.getPersonal().getNombre();
                }
        %>
        <tr id="numPedido<%= cant %>" >
                <td><%= cant %></td>
                <td><%= sdf.format(pedido.getFecha_hora()) %></td>
                <td>$ <%= pedido.getPrecio_total() %></td>
                <td><input type="button" id="btnPagar<%= cant %>" class="btnPagar" value="PAGAR" onclick="pagar( '<%= mozo %>', '<%= pedido.getId() %>', <%= cant %>)"></td>
            </tr>
        <% } %>
            </table>
            <div id="totalPedidos">
                <h3>Total: $ <%= total %></h3>
            </div>
            <input type="button" id="solicitarPagar" class="btn-submit" value="PAGAR TODO" onclick="pagarTodo( '<%= mozo %>' )">
            <input type="button" id="pedidoNuevo" class="btn-submit" value="PEDIDO NUEVO" onclick="comprobarClave( '<%= clave %>','<%= mozo %>' )">
        </form>
    </div>
</div>
<% } %>

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


    </body>
</html>
