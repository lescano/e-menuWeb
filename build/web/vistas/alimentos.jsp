<%-- 
    Document   : alimentos
    Created on : 21/04/2020, 04:00:02 PM
    Author     : vanessa
--%>

<%@page import="java.util.List"%>
<%@page import="Logica.Alimento"%>
<%@page import="Logica.enum_Estado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="Logica.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<div class="pl-3" id="container-categorias">
    <div class="row py-1">
      <% 
        List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
        int indice=0;
        for(Categoria aux : categorias){
            if(!aux.isMostrar()){
                String imagenBase64 = new String(aux.getImagen().getBytes(1l, (int) aux.getImagen().length()));
                
                indice++;
            %>
            <div class="col m-0 p-0" style="flex-grow: 0 !important;">
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
        
