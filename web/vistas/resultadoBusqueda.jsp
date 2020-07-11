<%-- 
    Document   : resultadoBusqueda
    Created on : 07/07/2020, 11:52:11 AM
    Author     : luisg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <jsp:include page="cabecera.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% 
    String respuesta=(String)request.getAttribute("resBusqueda");
    
    
            String mostrar="",mostrarCategorias="",segundaParte=""; 
            String[] categoria = respuesta.split("'");
            int continuar=0;
            
            if(respuesta.equals("-1")){
                mostrar+= "<br><p>No se encontraron resultados</p>";
            }else{ 
            if(categoria[0].split("//")[0].equals("categoria")){  //me fijo si vienen categorias
                
                for(int i=0;i<categoria.length-1;i++){
                    String id= categoria[i].split("//")[1];
                    String nombre= categoria[i].split("//")[2];
                    mostrarCategorias+="Estas buscando <button class='btn btn-primary' onclick='location.href='?caso="+nombre+"';'>"+nombre+"</button>?<br>";
                }
                mostrar+=mostrarCategorias;
                segundaParte=categoria[categoria.length-1];
                
            }else{
                segundaParte=respuesta;
            }
            
            String[] alimento = segundaParte.split("//");
            if(alimento[0].equals("no")&&alimento[1].equals("no")){           
                    mostrar += "<br><p>No se encontraron resultados</p>";
                    continuar=2;
                }else{
                    if(alimento[0].equals("no")&&!(alimento[1].equals("no"))){  
                       mostrar += "<p>No se encontraron resultados, busquedas relacionadas:</p>"; 
                       continuar=1;
                    }
                }
            for (int i = 0+continuar; i < alimento.length-1; i++) {
                //se realizo busqueda con la primer palabra y se no encontraron resultados
                        String[] partes = alimento[i].split("-");
                        String id = partes[0];
                        String nombre = partes[1];
                        String ingredientes = partes[2];
                        String precio = partes[3];
                        String tiempo = partes[4];
                        int u = i+100;                   
            }
            }        
            
    %>
    <%=  mostrar  %>
    </body>
    
<jsp:include page="pie.jsp"/>
</html>
