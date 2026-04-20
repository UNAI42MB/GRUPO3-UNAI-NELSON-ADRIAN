/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package u.n.a_fruteria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
/**
 *
 * @author adria
 */
public class dbConnection {
        static String url = "jdbc:mysql://192.168.56.1:3307/fruteria";
    static String user = "usuario";
    static String pass = "1234";    
    
    
    public static Connection conectar(){
        
        Connection con = null;
        try{
            con =DriverManager.getConnection(url,user,pass);
            System.out.println("Conexion exitosa");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return con;
    }
    
}
