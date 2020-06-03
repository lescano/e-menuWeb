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
            int indice=0;
            for(Categoria aux : categorias){
                String imagenBase64 = new String(aux.getImagen().getBytes(1l, (int) aux.getImagen().length()));
                if(indice%2==0&&indice!=0){
                    %><div class="w-100"></div><% 
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
        <script>
            $(".containerText").each(function(){            //esto es para que las imagenes queden bien sean del tamano que sean
            var refRatio = 240/300;

            var imgH = $(this).children("img").height();
            var imgW = $(this).children("img").width();

            if ( (imgW/imgH) < refRatio ) { 
                $(this).addClass("portrait");
            } else {
                $(this).addClass("landscape");
            }
        })
        </script>
            
        </div>
    </div>
