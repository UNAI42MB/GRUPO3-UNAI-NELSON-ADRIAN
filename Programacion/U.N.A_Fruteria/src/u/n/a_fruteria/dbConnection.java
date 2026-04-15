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
            static String url = "jdbc:mysql://localhost:3306/instituto_avanzado";
    static String user = "root";
    static String pass = "Adrititan2007";
    
    
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
