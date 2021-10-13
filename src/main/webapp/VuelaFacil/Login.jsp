<%-- 
    Document   : Login
    Created on : 8/10/2021, 08:40:47 PM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.UsuarioDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login Vuela Facil</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
    </head>
    <body>
        <div style="width: 300px; height: 300px" class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="Login.jsp" >
                        <p >INICIAR SESION</p>
                        <div class="form-group">
                            <label >Numero de Documento</label><br>
                            <input type="text" class="form-control" name="user" placeholder="Humano pon tu usuario">
                        </div>
                        <div class="form-group">
                            <label >Contraseña</label><br>
                            <input type="password" class="form-control" name="password" placeholder="Humano pon tu contraseña">
                        </div>
                        <hr>
                        <button type="submit" class="btn btn-primary" name="login"  >Ingresa</button>
                    </form>
                    
                    <%
                        UsuarioDAO userDAO = new UsuarioDAO();
                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            List<String> flagUser = userDAO.consultarUsuario(user, password);

                            HttpSession sesion = request.getSession();
                            if (flagUser != null) {
                                sesion.setAttribute("logueado", 1);
                                sesion.setAttribute("user", user);
                                sesion.setAttribute("id", flagUser.get(0));
                                response.sendRedirect("index.jsp");
                            } else {
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                            }
                        }
                    %>
                    <form method="post" action="Register.jsp" >
                        <button type="submit" class="btn btn-primary" name="register" >Registrate</button>
                    </form>
                    <%
                        if (request.getParameter("register") != null) {
                            response.sendRedirect("Register.jsp");
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>