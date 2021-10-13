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
public class ciudades {
    private int id_ciudad;
    private String ciudad;
    private String aeropuerto;
    private String iata;
    private String havilitada;

    public ciudades(int id_ciudad, String ciudad, String aeropuerto, String iata, String havilitada) {
        this.id_ciudad = id_ciudad;
        this.ciudad = ciudad;
        this.aeropuerto = aeropuerto;
        this.iata = iata;
        this.havilitada = havilitada;
    }

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getAeropuerto() {
        return aeropuerto;
    }

    public void setAeropuerto(String aeropuerto) {
        this.aeropuerto = aeropuerto;
    }

    public String getIata() {
        return iata;
    }

    public void setIata(String iata) {
        this.iata = iata;
    }

    public String getHavilitada() {
        return havilitada;
    }

    public void setHavilitada(String havilitada) {
        this.havilitada = havilitada;
    }
    
    
    
}
