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
                    String nombre= categoria[i].split("//")[2];//location.href='?caso=Promos';
                    //String dir="location.href='?caso="+nombre+"'";
                    //mostrarCategorias+="Estas buscando <button class='btn btn-primary' onclick='"+dir+"'>"+nombre+"</button>?<br>";
                    %>   
                        Estas buscando
                        <button class='btn btn-primary' onclick="location.href='?caso=<%=nombre%>';"><%=  nombre  %></button>?<br>
                    <%
                }
                //mostrar+=mostrarCategorias;
                segundaParte=categoria[categoria.length-1];
                
            }else{
                segundaParte=respuesta;
            }
            
            String[] alimento = segundaParte.split("//");
            if(alimento[0].equals("no")&&alimento[1].equals("no")){           
                    mostrar += "<br><p>No se encontraron resultados con ese nombre</p>";
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
                        String calorias = partes[5];
                        int u = i+100; 
                        
                        
                        if(!precio.equals("0")&&!precio.equals("0.0")){
                        %>
                        <div class="card-body p-1 m-1 shadow-sm">
    <h4 class="card-title m-0 p-0" id="alimento<%= i %>"><%= nombre %></h4>
    <input id="idAlimento<%= i %>" value="<%= id %>" style="display:none;">
    <p class="card-text p-0 m-1"><%= ingredientes %></p>
    <div class="caja" style="display: none;">
        <ul class="nav nav-tabs " id="myTab<%= i %>" role="tablist">
            <li class="nav-item">
                <a class="nav-link text-dark" id="home-tab<%= i %>" data-toggle="tab" href="#home<%= i %>" role="tab" aria-controls="home" aria-selected="true">Añadir</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-dark" id="profile-tab<%= i %>" data-toggle="tab" href="#profile<%= i %>" role="tab" aria-controls="profile" aria-selected="false">Detalles</a>
            </li>
            <li class="nav-item">
                    <button class="nav-link bg-white border-bottom text-dark" onclick="actualizarComentarios(<%= id %>)" id="contact-tab<%= i %>" data-toggle="tab" href="#contact<%= i %>" role="tab" aria-controls="contact" aria-selected="false">Reseñas</button>
            </li>
        </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home<%= i %>" role="tabpanel" aria-labelledby="home-tab">
               <div class="gustos gustosSup">
                    <div class="gustos">
                        <div class="">
                            <button id="botonMenos" type="button" class=" btn btn-dark" onclick="disminuircantidad(<%= i %>)">-</button>
                        </div>
                        <div class="">
                            <h5 class="" id="cantidadAlimentos<%= i %>" style="padding-left: 1em;padding-right: 1em;">1</h5>
                        </div>
                        <div class="">
                            <button id="botonMas" type="button" class=" btn btn-dark" onclick="aumentarcantidad(<%= i %>)">+</button>
                        </div>
                    </div>
                    <div class="gustos">
                        <h5 class="mb-1" type='text' >Total: $</h5><h5 type='text' id="precioAlimentos<%= i %>"> <%= precio %></h5>
                    </div>
                    <div class="">
                        <button type="button" id="agregarAlPedido<%= i %>"  class="btn btn-success w-20 py-1 px-0" onclick="agregar(<%= i %>)">Añadir al Pedido</button>
                    </div>
            </div>
            <div class="container altura mb-1">
                <div class="row">
                    <textarea class="form-control float-left" rows="2" style="resize: none;" id="aclaracion<%= i %>" placeholder="Alguna aclaracion?"></textarea>
                </div>
            </div>

        </div>
        <div class="tab-pane fade" id="profile<%= i %>" role="tabpanel" aria-labelledby="profile-tab">
            <p class="mt-2">Tiempo de Preparacion: <%= tiempo %> min</p>
            <p>Calorias: <%=calorias%></p>
        </div>
        <div class="tab-pane fade" id="contact<%= i %>" role="tabpanel" aria-labelledby="contact-tab">
            <div id="carouselExampleControls<%= id%>" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" id="comentarios<%= id %>">
            
                </div>
                <a class="carousel-control-prev " href="#carouselExampleControls<%= id %>" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" style="filter: brightness(0);" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next " href="#carouselExampleControls<%= id %>" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" style="filter: brightness(0);" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>        
                                                                                
            <div class="input-group my-1">
                <textarea class="w-100" rows="2"  placeholder="Comentario" id="nombre<%= id %>" style="resize: none;"></textarea>
                <div class="w-100"></div>
                <input type="text"  placeholder="Nombre" id="descripcion<%= id %>">
                <div class="input-group-append">
                    <button class="btn btn-success input-group-text " onclick="comentar(<%= id %>)" >Comentar</button>
                </div>               
            </div>
        </div>
    </div>
  </div>
    <div class=" bg-transparent d-flex justify-content-center divFlecha m-0 p-0">
        <buttom  class="botonDesplegar p-1 m-0" type="submit"  value="" onclick="mostrar(<%= i%>)" >
            <img  class="botonDesplegar botonGira p-0 m-0 h-100" src="vistas/assets/images/iconos/ic_keyboard_arrow_down_black_48dp.png">
        </buttom>  
    </div>           
  </div>
                        <%
            }
            }
            }        
            
    %>
    <%=  mostrar  %>
    </body>
    
<jsp:include page="pie.jsp"/>
</html>
