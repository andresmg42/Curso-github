/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author user
 */
public class usuario {
    private String id_usuario;
    private String id_tipo_documento;
    private String numero_documento;
    private String nombres;
    private String apellidos;
    private String correo;
    private String contrasena;

    public usuario(String id_usuario, String id_tipo_documento, String numero_documento, String nombres, String apellidos, String correo, String contrasena) {
        this.id_usuario = id_usuario;
        this.id_tipo_documento = id_tipo_documento;
        this.numero_documento = numero_documento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.contrasena = contrasena;
    }

    public usuario(String id_usuario, String numero_documento, String contrasena) {
        this.id_usuario = id_usuario;
        this.numero_documento = numero_documento;
        this.contrasena = contrasena;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_tipo_documento() {
        return id_tipo_documento;
    }

    public void setId_tipo_documento(String id_tipo_documento) {
        this.id_tipo_documento = id_tipo_documento;
    }

    public String getNumero_documento() {
        return numero_documento;
    }

    public void setNumero_documento(String numero_documento) {
        this.numero_documento = numero_documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
    
    
    

}