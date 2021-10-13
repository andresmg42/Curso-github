/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.sql.SQLException;
import java.util.List;
import modelo.Ruta;
import modelo.RutaDAO;
import modelo.RutaVista;
import modelo.UsuarioDAO;
import modelo.Vuelo;

/**
 *
 * @author user
 */
public class main {
    public static void main(String[] args) throws SQLException {
        RutaDAO rut=new RutaDAO();
        UsuarioDAO us=new UsuarioDAO();
        /*
        List<Vuelo> vuelos=rut.buscarRutas(1, 2);
        for (Vuelo v : vuelos) {
            System.out.println(v.getOrigen());
            System.out.println(v.getDestino());
            System.out.println(v.getAerolinea());
            System.out.println(v.getHora_salida());
            System.out.println(v.getFecha_salida());
            System.out.println(v.getPrecio());
            
            
            
        */
        
       List<Vuelo> lista=rut.buscarRutas(4, 5);
        System.out.println(lista);
        if (lista==null){
            System.out.println("dd");
        }
        
        
        
    }
    

    
}
