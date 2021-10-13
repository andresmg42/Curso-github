<%-- 
    Document   : reserva
    Created on : 9/10/2021, 4:03:45 p. m.
    Author     : user
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.RutaDAO"%>
<%@page import="modelo.RutaVista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>reservas</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <%
        HttpSession sesion = request.getSession();
        RutaDAO rut = new RutaDAO();
        if (request.getParameter("id_ruta") != null) {
            int id_ruta = Integer.parseInt(request.getParameter("id_ruta"));
            String estado = request.getParameter("estado");
            String id = sesion.getAttribute("id").toString();
            RutaVista vista = rut.hacerRecerva(id_ruta, estado, id);
            sesion.setAttribute("vista", vista);
            sesion.setAttribute("id", id);
            sesion.setAttribute("id_ruta", id_ruta);
            response.sendRedirect("reserva.jsp");
        }
        RutaVista vista = (RutaVista) sesion.getAttribute("vista");
        if (request.getParameter("reservar") != null) {
            vista.setEstado("reservado");
            String id_usuario = sesion.getAttribute("id").toString();
            int id_ruta = Integer.parseInt(sesion.getAttribute("id_ruta").toString());
            String estado = vista.getEstado();
            Date fecha = new Date(Calendar.getInstance().getTime().getTime());
            rut.insertarReserva(id_usuario, id_ruta, estado, fecha);
            Thread.sleep(3 * 1000);
            response.sendRedirect("index.jsp");
        }
    %>
    <body>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header">

                    <form class="form-inline" action="Logout.jsp">
                        <a href="datosUsuario.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i> </a>
                        <button class="btn btn-primary" type="submit">Salir</button>
                    </form>
                </div>

                <div class="container">
                <h1>Reservas</h1>
                <form action="reserva.jsp?reserva=true"method="POST" >
                    
                        <table class="table table-hover">

                            <tr>
                                <td>ORIGEN:</td> 
                                <td><h3><%=vista.getOrigen()%></h3></td>


                            </tr>
                            <br>
                            <tr>
                                <td>DESTINO:</td> 
                                <td><h3><%=vista.getDestino()%></h3></td>

                            </tr><br>
                            <tr>
                                <td>AEROLINEA:</td>
                                <td><h3><%=vista.getAerolinea()%></h3></td>

                            </tr><br>
                            <tr>
                                <td>HORA DE SALIDA:</td>
                                <td><h3><%=vista.getHora_salida()%></h3></td>

                            </tr><br>
                            <tr>
                                <td>FECHA DE SALIDA:</td><h3> 
                                <td><%=vista.getFecha_salida()%></h3></td>

                            <tr><br>
                            <tr>
                                <td>PRECIO:</td>
                                <td><h3><%=vista.getPrecio()%></h3></td>
                            </tr><br>
                            <tr>
                                <td>ESTADO:</td> 
                                <td><h3><%=vista.getEstado()%></h3></td>
                            </tr><br>

                        </table>
                        <button class="btn btn-danger"type="submit" name="reservar" onclick="mostrar()">Pagar</button>
                        <script type="text/javascript">
                            function mostrar() {
                                swal('Reserva exitosa', 'se ha realizado el pago correctamente', 'success');
                            }
                        </script>
                    
                </form>
              </div>
            </div>
        </div>
    </body>
</html>
