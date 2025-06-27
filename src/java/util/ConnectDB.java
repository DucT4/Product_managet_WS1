/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static final String DB_NAME = "ProductIntro";
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "12345";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
            conn = DriverManager.getConnection(url, USER_NAME, PASSWORD);
            System.out.println("Kết nối database thành công!");
        } catch (ClassNotFoundException e) {
            System.out.println("Không tìm thấy driver SQL Server: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Kết nối database thất bại: " + e.getMessage());
        }
        return conn;
    }
}
