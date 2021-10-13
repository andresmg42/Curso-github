/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author user
 */
public class ordenes {
  private int id_orden;
  private String id_usuario;
  private String estado;
  private int id_ruta;
  private Date fecha;

    public ordenes(int id_orden, String id_usuario, String estado, int id_ruta, Date fecha) {
        this.id_orden = id_orden;
        this.id_usuario = id_usuario;
        this.estado = estado;
        this.id_ruta = id_ruta;
        this.fecha = fecha;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
  
  

}
