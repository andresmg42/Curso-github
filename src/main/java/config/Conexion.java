/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class Conexion {
    Connection con=null;
    public Connection geConnection(){
      try{
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con=DriverManager.getConnection("jdbc:mysql://localhost:3307/vuelosBaratos.com2?user=root&password=1234");
        if (!con.isClosed()){
            System.out.println("conexion exitosa");
        } 
        return con;
      
      }catch(ClassNotFoundException | InstantiationException | IllegalAccessException ex){
          System.err.println("error-->"+ex.getMessage());
      }catch (SQLException ex){
          System.out.println("error-->"+ex.getMessage());
      }return null;
    }
    public Connection closeConnection(){
      try{
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con=DriverManager.getConnection("jdbc:mysql://localhost:3307/vuelosBaratos.com2?user=root&password=1234");
        con.close();
        return con;
        }
      catch(ClassNotFoundException | InstantiationException | IllegalAccessException ex){
          System.err.println("error-->"+ex.getMessage());
      }catch (SQLException ex){
          System.out.println("error-->"+ex.getMessage());
      }return null;
    }
    
    
}
