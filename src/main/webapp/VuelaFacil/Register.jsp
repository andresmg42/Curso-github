<%-- 
    Document   : Register
    Created on : 10/10/2021, 08:38:53 AM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.usuario"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.UsuarioDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
    </head>
    <body>
        <div align="center">
            <h1>Registro de Usuario</h1>
            <form action="Register.jsp" method="post">
                <table style="with: 80%">
                    <tr>
                        <td>Nombres</td>
                        <td><input type="text" name="nombres" required/></td>
                    </tr>
                    <tr>
                        <td>Apellidos</td>
                        <td><input type="text" name="apellidos" required/></td>
                    </tr>
                    <tr>
                        <td>Tipo de Documento</td>
                        <td>
                            <select name="tipoDoc">
                                <option selected value="1">Cedula de Ciudadania</option> 
                                <option value="2">Cedula de Extranjeria</option> 
                                <option value="3">Pasaporte</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Numero de Documento</td>
                        <td><input type="text" name="numDoc" required/></td>
                    </tr>
                    <tr>
                        <td>Correo</td>
                        <td><input type="text" name="correo" required/></td>
                    </tr>
                    <tr>
                        <td>Contraseña</td>
                        <td><input type="password" name="passwordReg" required/></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary" name="registerReg">Registrate</button>
            </form>
            <%
                UsuarioDAO userDAO = new UsuarioDAO();
                if (request.getParameter("registerReg") != null) {
                    Boolean regUser = userDAO.registrarUsuario(Integer.parseInt(request.getParameter("tipoDoc")), request.getParameter("numDoc"), request.getParameter("nombres"), request.getParameter("apellidos"), request.getParameter("correo"), request.getParameter("passwordReg"));
                    String doc=request.getParameter("numDoc");
                    List<String> user= userDAO.consultarUsuario(request.getParameter("numDoc"), request.getParameter("passwordReg"));
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("logueado", 1);
                    sesion.setAttribute("id", user.get(0));
                    sesion.setAttribute("user",doc);
                    response.sendRedirect("index.jsp");
                    
                    
                    
                }
            %>
        </div>
    </body>
</html>
