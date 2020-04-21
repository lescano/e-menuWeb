<%-- 
    Document   : menu
    Created on : 21/04/2020, 02:02:03 PM
    Author     : vanessa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-menu</title>
    </head>
    <body>
        <jsp:include page="cabecera.jsp"/>
        <ul><!--despues cada li se va a crear en un for cuando se listen las categorias -->
            <li>
                <a href="?arg=pzz">
                <img src="https://www.mediahacker.org/wp-content/uploads/2018/05/Pizza-Restaurant.jpg" alt="Imagen ilustrativa de una pizza" width="500px"/>
                <p>pizza</p>
                </a>
            </li>
            <li>
                <a href="?arg=ham">
                <img src="https://media-cdn.tripadvisor.com/media/photo-s/06/f9/e3/27/homemade-hamburger.jpg" alt="Imagen ilustrativa de una hamburguesa" width="500px"/>
                <p>hamburguesa</p>
                </a>
            </li>
            <li>
                <a href="?arg=sndw">
                <img src="https://lh3.googleusercontent.com/proxy/n5htP6fTBqn7wbK_sB8HQt4ZhmzmWqQcMnRMAM-RlIEkkVWl5p8ZLgoH4rRivJCNjuJyt3WI0Vii0TkXslHRpgZ7P23gOYSZXu4JLJcjWPDvxfEVYq4A8Hc" alt="Imagen ilustrativa de un sandwich." width="500px"/>
                <p>sandwiches</p>
                </a>
            </li>
            <li>
                <a href="?arg=beb">
                <img src="https://p1.pxfuel.com/preview/286/783/704/bar-caribbean-maritime-drinks-restaurant-beach-bar.jpg" alt="Imagen ilustrativa de bebidas" width="500px"/>
                <p>bebidas</p>
                </a>
            </li>
            <li>
                <a href="?arg=post">
                <img src="https://www.planetajoy.com/upload/image/673x6731366916268_WETGESG.jpg" alt="Imagen ilustrativa de un postre"width="500px"/>
                <p>postres</p>
                </a>
            </li>
        </ul>
    </body>
</html>
