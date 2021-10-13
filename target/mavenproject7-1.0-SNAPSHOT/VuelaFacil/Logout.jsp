<%-- 
    Document   : Logout
    Created on : 8/10/2021, 11:43:17 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();
            sesion.invalidate();
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
