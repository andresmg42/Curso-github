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
public class Ruta {
    private int id_ruta;
    private int id_ciudad_origen;
    private int id_ciudad_destino;
    private String aerolinea;
    private Time hora_salida;
    private Date fecha_salida;
    private double tiempo;
    private String activada;
    private double precio;

    public Ruta(int id_ruta, int id_ciudad_origen, int id_ciudad_destino, String aerolinea, Time hora_salida, Date fecha_salida, double tiempo, String activada,double precio) {
        this.id_ruta = id_ruta;
        this.id_ciudad_origen = id_ciudad_origen;
        this.id_ciudad_destino = id_ciudad_destino;
        this.aerolinea = aerolinea;
        this.hora_salida = hora_salida;
        this.fecha_salida = fecha_salida;
        this.tiempo = tiempo;
        this.precio=precio;
        
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(int id_ruta) {
        this.id_ruta = id_ruta;
    }

    public int getId_ciudad_origen() {
        return id_ciudad_origen;
    }

    public void setId_ciudad_origen(int id_ciudad_origen) {
        this.id_ciudad_origen = id_ciudad_origen;
    }

    public int getId_ciudad_destino() {
        return id_ciudad_destino;
    }

    public void setId_ciudad_destino(int id_ciudad_destino) {
        this.id_ciudad_destino = id_ciudad_destino;
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

    public double getTiempo() {
        return tiempo;
    }

    public void setTiempo(double tiempo) {
        this.tiempo = tiempo;
    }

    public String getActivada() {
        return activada;
    }

    public void setActivada(String activada) {
        this.activada = activada;
    }
    
    
    
}
