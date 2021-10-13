/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class UsuarioDAO {

    Connection conect;

    public UsuarioDAO() {
        Conexion con = new Conexion();
        conect = con.geConnection();
    }

    public List<String> consultarUsuario(String numDocumento, String contrasena) throws SQLException {
        System.out.println("Preparando para Consultar Usuario...");
        PreparedStatement ps;
        ResultSet rs;

        try {
            ps = conect.prepareStatement("SELECT ID_USUARIO, NUMERO_DOCUMENTO, CONTRASENA FROM tb_usuario WHERE NUMERO_DOCUMENTO=? AND CONTRASENA=?");
            ps.setString(1, numDocumento);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            while (rs.next()) {
                List<String> val = new ArrayList<>();
                val.add(rs.getString("ID_USUARIO"));
                val.add(rs.getString("NUMERO_DOCUMENTO"));
                val.add(rs.getString("CONTRASENA"));

                return val;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RutaDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    public Boolean registrarUsuario(int  tipoDocumento, String numDocumento, String nombres, String apellidos, String correo, String contrasena) throws SQLException {//
        System.out.println("Preparando para Registar Usuario...");
        PreparedStatement ps;

        try {
            ps = conect.prepareStatement("INSERT INTO tb_usuario (ID_TIPO_DOCUMENTO, NUMERO_DOCUMENTO, NOMBRES, APELLIDOS, CORREO, CONTRASENA) VALUES(?, ?, ?, ?, ?, ?)");
            ps.setInt(1, tipoDocumento);//
            ps.setString(2, numDocumento);
            ps.setString(3, nombres);
            ps.setString(4, apellidos);
            ps.setString(5, correo);
            ps.setString(6, contrasena);
            ps.execute();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(RutaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null; //
        }
    }
}
