<%-- 
    Document   : alimentos
    Created on : 21/04/2020, 04:00:02 PM
    Author     : vanessa
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Alimento"%>
<%@page import="Logica.enum_Estado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Pedidos"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<div class="container" id="container-categorias">
    <div class="row py-1">
      <% 
        List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
        List<Pedidos> pedidos = (List<Pedidos>)request.getAttribute("pedidos");
        int indice=0;
        int cant=0;
        int total=0;
        String mozo="";
        String clave = "";
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        
        for(Categoria aux : categorias){
            if(!aux.isMostrar()){
                String imagenBase64 = new String(aux.getImagen().getBytes(1l, (int) aux.getImagen().length()));
                if(indice%2==0&&indice!=0){
                    %> <div class="w-100"></div> <% 
                }
                indice++;
            %>
            <div class="col-6 m-0 p-0">
                <button class="m-0 p-0 overflow-hidden " type="button" onclick="location.href='?caso=<%= aux.getNombre()%>';" style="border:none;">
                    <div class="containerText bg-primary">
                        <img class="aImagen m-0 p-0" src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="<%= aux.getNombre() %>"/>  
                        <div class="centeredText"><%=aux.getNombre().toUpperCase()%></div>
                    </div>
                </button>
            </div>
    <% }
            } %>  
    </div>
</div>
<div class="container" id="container-busqueda" style="display:none">
    <h5 class="m-1">Resultado de la busqueda<button id="cancelarBusqueda" class="btn bg-danger ml-2">X</button></h5>
    <p id="textoResultado"></p>
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
        
