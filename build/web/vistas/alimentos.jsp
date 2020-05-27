<%-- 
    Document   : alimentos
    Created on : 21/04/2020, 04:00:02 PM
    Author     : vanessa
--%>

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
                        for(Categoria aux : categorias){
                            String imagenBase64 = new String(aux.getImagen().getBytes(1l, (int) aux.getImagen().length()));
            %>

            <div class="row w-100">
                <div class="col px-3 py-1">
                    <a href="?caso=<%= aux.getNombre() %>">
                        <img class="<%= aux.getNombre() %>" src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="<%= aux.getNombre() %>"/>
                    </a>
                </div>
            </div>
   <%--                  
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_hamburg.jpg" alt=""/>
            </div>
            <div class="col px-3 py-1">
                <a href="?caso=chivito">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_chivitos.jpg" alt=""/>
                </a>
            </div>
            <div class="w-100"></div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_sandw.jpg" alt=""/>
            </div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_milanesas.jpg" alt=""/>
            </div>
            <div class="w-100"></div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_minutas.jpg" alt=""/>
            </div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_ensaladas.jpg" alt=""/>
            </div>
            <div class="w-100"></div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/elbar_categ_bebidas.jpg" alt=""/>
            </div>
            <div class="col px-3 py-1">
                <img class="categoria " src="vistas/assets/images/categoriasComida/pizzas_especiales.jpg" alt=""/>
            </div>
            
--%>          <% } %>        
            
        </div>
    </div>
