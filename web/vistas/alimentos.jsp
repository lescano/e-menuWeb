<%-- 
    Document   : alimentos
    Created on : 21/04/2020, 04:00:02 PM
    Author     : vanessa
--%>

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
    
<div class="container">
    <div class="row py-1">
      <% 
        List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
        List<Pedidos> pedidos = (List<Pedidos>)request.getAttribute("pedidos");
        int indice=0;
        int cant=0;
        int total=0;
        String mozo="";
        ArrayList<String> claves = new ArrayList<String>();
        for(Categoria aux : categorias){
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
    <% } %>  
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
        %>
            <tr>
                <td><%= cant %></td>
                <td><%= pedido.getFecha_hora() %></td>
                <td>$ <%= pedido.getPrecio_total() %></td>
                <% total+=pedido.getPrecio_total(); 
                   claves.add(pedido.getContrasenia()); 
                   mozo = pedido.getPersonal().getNombre(); %>
            </tr>
        <% } %>
            </table>
            <div id="totalPedidos">
                <h3>$ <%= total %></h3>
            </div>
            <input type="button" id="solicitarPagar" class="btn-submit" value="SOLICITAR PAGO" onclick="pagar( '<%= mozo %>' )">
            <input type="button" id="pedidoNuevo" class="btn-submit" value="PEDIDO NUEVO">
        </form>
    </div>
</div>
        
<% } %>
        
