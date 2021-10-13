<%-- 
    Document   : index
    Created on : 8/10/2021, 4:32:54 p. m.
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VUELOSBARATOS.COM</title>
        <script src="validar.js"></script>
    </head>
    <%
        RutaDAO rutDAO = new RutaDAO();
        List<Vuelo> lista = new ArrayList();

        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
            response.sendRedirect("Login.jsp");
        } else if (request.getParameter("id_ruta") != null) {
            int id_ruta = Integer.parseInt(request.getParameter("id_ruta"));
            String estado = request.getParameter("estado");
            String id = sesion.getAttribute("id").toString();
            RutaVista vista = rutDAO.hacerRecerva(id_ruta, estado, id);
            sesion.setAttribute("vista", vista);
            sesion.setAttribute("id", id);
            sesion.setAttribute("id_ruta", id_ruta);
            response.sendRedirect("reserva.jsp");
        }


    %>
    <body>
        <div class="container">
            <nav class="navbar navbar-light bg-light">
                <form class="form-inline" action="Logout.jsp">
                    <a href="datosUsuario.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i> </a>
                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Salir</button>
                </form>
            </nav>

            <h1>por favor ingrese el origen y destino de la  ruta</h1>
            <div class="row mt-2">
                <div class="col-sm">
                    <form name="formBuscarRuta" method="POST" action="VueloController" onsubmit="return validar();">
                        ORIGEN:<input type="text" id="txtorigen" name="txtorigen" required>
                        DESTINO:<input type="text" id="txtdestino" name="txtdestino" required>
                        <input type="submit" name="btnbuscar" value="Buscar">
                    </form>
                    <hr>
                    <table border="1px">
                        <tr>
                            <td>ORIGEN</td><td>DESTINO</td><td>AEROLINEA</td><td>HORA_SALIDA</td><td>FECHA_SALIDA</td><td>PRECIO</td>

                        </tr>

                        <%                            if ((boolean) request.getAttribute("filtro") != true || request.getAttribute("filtro") != null) {
                                lista = (List<Vuelo>) request.getAttribute("filtro");

                                for (Vuelo v : lista) {
                        %>
                        <tr>
                            <td><%=v.getOrigen()%></td>
                            <td><%=v.getDestino()%></td>
                            <td><%=v.getAerolinea()%></td>
                            <td><%=v.getHora_salida()%></td>
                            <td><%=v.getFecha_salida()%></td>
                            <td><%=v.getPrecio()%></td>
                            <td><a href="reserva.jsp?estado=no reservado&id_ruta=<%= v.getId_ruta()%>">Reservar</a></td>
                        </tr>
                        <%
                                }
                            } else {

                                out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


