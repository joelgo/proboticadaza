/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probotica.modelo.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author USUARIO
 */
public class ConexionOracle {
    public static Connection conectar()
    {
        Connection conn = null;
        try {
             Class.forName("oracle.jdbc.OracleDriver");
       conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","botica","botica");
        } catch (Exception e) {
            e.printStackTrace();
            
        }
       
        return conn;
    } 
}
