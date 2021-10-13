/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class RutaDAO {

    Connection conect;

    public RutaDAO() {
        Conexion con = new Conexion();
        conect = con.geConnection();

    }

    //buscar y listar vuelos
    public List<Vuelo> buscarRutas(int id_origen, int id_destino) throws SQLException {

        PreparedStatement ps;
        ResultSet rs;
        List<Vuelo> lista = new ArrayList<>();
        String sql = "SELECT tbr.ID_RUTA, tbr.AEROLINEA, tnc.CIUDAD as CIUDAD_ORIGEN, tnc2.CIUDAD as CIUDAD_DESTINO, tbr.HORA_SALIDA, tbr.FECHA_SALIDA, tbr.PRECIO \n"
                + "FROM tb_rutas tbr, tb_nombre_ciudades tnc, tb_nombre_ciudades tnc2 \n"
                + "WHERE tbr.ID_CIUDAD_ORIGEN = tnc.ID_CIUDAD AND tbr.ID_CIUDAD_DESTINO = tnc2.ID_CIUDAD AND tbr.ID_CIUDAD_ORIGEN = ? \n"
                + "AND tbr.ID_CIUDAD_DESTINO = ?";

        try {

            ps = conect.prepareStatement(sql);
            ps.setInt(1, id_origen);
            ps.setInt(2, id_destino);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id_ruta = rs.getInt("ID_RUTA");
                String aerolinea = rs.getString("AEROLINEA");
                String origen = rs.getString("CIUDAD_ORIGEN");
                String destino = rs.getString("CIUDAD_DESTINO");
                Time hora_salida = rs.getTime("HORA_SALIDA");
                Date fecha_salida = rs.getDate("FECHA_SALIDA");
                double precio = rs.getDouble("PRECIO");
                lista.add(new Vuelo(id_ruta, origen, destino, aerolinea, hora_salida, fecha_salida, precio));

            }
            return lista;
        } catch (SQLException e) {
            System.err.println(e.getMessage());

        }
        return null;
    }

    //buscar ciudad
    public Integer mostrarIdCiudad(String ciudad) throws SQLException {
        System.out.println("Consultando ciudad");
        PreparedStatement ps;
        ResultSet rs;

        try {
            ps = conect.prepareStatement("SELECT ID_CIUDAD FROM tb_nombre_ciudades WHERE CIUDAD=?");
            ps.setString(1, ciudad);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id_ciudad = rs.getInt("ID_CIUDAD");

                return id_ciudad;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RutaDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    public String mostrarCiudad(int id_ciudad) throws SQLException {
        System.out.println("Consultando por id ciudad");
        PreparedStatement ps;
        ResultSet rs;

        try {
            ps = conect.prepareStatement("SELECT CIUDAD FROM tb_nombre_ciudades WHERE ID_CIUDAD=?");
            ps.setInt(1, id_ciudad);
            rs = ps.executeQuery();

            if (rs.next()) {
                String ciudad = rs.getString("CIUDAD");

                return ciudad;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RutaDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    //hacer reserva
    public Ruta buscaRuta(int ID) {
        PreparedStatement ps;
        ResultSet rs;

        try {
            ps = conect.prepareStatement("SELECT * FROM tb_rutas WHERE id_ruta LIKE '%" + ID + "%'");
            rs = ps.executeQuery();
            if (rs.next()) {
                int id_ruta = rs.getInt("ID_RUTA");
                int id_ciudad_origen = rs.getInt("ID_CIUDAD_ORIGEN");
                int id_ciudad_destino = rs.getInt("ID_CIUDAD_DESTINO");
                String aerolinea = rs.getString("AEROLINEA");
                Time hora_salida = rs.getTime("HORA_SALIDA");
                Date fecha_salida = rs.getDate("FECHA_SALIDA");
                double tiempo = rs.getDouble("TIEMPO");
                String activada = rs.getString("ACTIVADA");
                double precio = rs.getDouble("PRECIO");
                Ruta rut = new Ruta(id_ruta, id_ciudad_origen, id_ciudad_destino, aerolinea, hora_salida, fecha_salida, tiempo, activada, precio);
                return rut;
            }

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return null;

    }

    public boolean insertarReserva(String id_usuario, int id_ruta, String estado, Date fecha) {

        PreparedStatement ps;

        try {
            ps = conect.prepareStatement("INSERT INTO tb_ordenes (ID_USUARIO,ESTADO,ID_RUTA,FECHA)VALUES (?,?,?,?)");
            ps.setString(1, id_usuario);
            ps.setString(2, estado);
            ps.setDouble(3, id_ruta);
            ps.setDate(4, fecha);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RutaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public RutaVista hacerRecerva(int id_ruta, String estado_front, String id_usuario) {
        try {
            Ruta rut = buscaRuta(id_ruta);
            String origen = mostrarCiudad(rut.getId_ciudad_origen());
            String destino = mostrarCiudad(rut.getId_ciudad_destino());
            String aerolinea = rut.getAerolinea();
            Time hora_salida = rut.getHora_salida();
            Date fecha_salida = rut.getFecha_salida();
            double precio = rut.getPrecio();
            String estado = estado_front;
            RutaVista reserva = new RutaVista(origen, destino, aerolinea, hora_salida, fecha_salida, precio, estado);

            return reserva;
        } catch (SQLException e) {
            System.out.println(e.getLocalizedMessage());
        }
        return null;
    }

}
