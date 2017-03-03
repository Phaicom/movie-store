/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Reawpai
 */
public class ConnectionBuilder {
    
    public static Connection getConnection() {

        Connection connect = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/moviestore_test?useEncoding=true&characterEncoding=UTF-8","root","");

        } catch (Exception ex) {
            System.out.println("Connection error: "+ex);
        }
        return connect;
    }
    
    
}
