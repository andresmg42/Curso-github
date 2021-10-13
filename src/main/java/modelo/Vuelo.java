/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author user
 */
public class Vuelo {
    private int id_ruta;
    private String origen;
    private String destino;
    private String aerolinea;
    private Time hora_salida;
    private Date fecha_salida;
    private double precio;

    public Vuelo(int id_ruta,String origen, String destino, String aerolinea, Time hora_salida, Date fecha_salida, double precio) {
        this.origen = origen;
        this.destino = destino;
        this.aerolinea = aerolinea;
        this.hora_salida = hora_salida;
        this.fecha_salida = fecha_salida;
        this.precio = precio;
        this.id_ruta=id_ruta;
    }
    
    public Vuelo(){}

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }
    
    

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getAerolinea() {
        return aerolinea;
    }

    public void setAerolinea(String aerolinea) {
        this.aerolinea = aerolinea;
    }

    public Time getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }

    public Date getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(Date fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    

}