/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexao {
    private static final String url = "jdbc:mysql://localhost:3306/projeto_web1?useSSL=false";
    private static final String user = "root";
    private static final String senha = "";
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    
    public static Connection conectar() {
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, senha);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
