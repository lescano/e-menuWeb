<%-- 
    Document   : alimentos
    Created on : 21/04/2020, 04:00:02 PM
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
        <%String v = (String) request.getSession().getAttribute("valor");%>
        <jsp:include page="cabecera.jsp"/>
        <div>
            <h1><%=v%></h1>
            <ul>
                <li>
                    <img src="" alt="Imagen ilustrativa de ..." width="350px"/>
                    <p>Nombre del alimento</p>
                    <p><em>$250</em></p>
                    <button><img alt="Imagen de carrito de compras" width="50px" src="data:image/png;base64,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"/></button>
                </li>
            </ul>
        </div>
    </body>
</html>
