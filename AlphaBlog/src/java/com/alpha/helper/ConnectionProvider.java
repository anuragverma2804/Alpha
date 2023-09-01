/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.alpha.helper;

import java.sql.*;

/**
 *
 * @author anurag
 */
public class ConnectionProvider {

    private static Connection connection;

    public static Connection getConnection() {
        try {
            if (connection == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/AlphaDB", "root", "123qwe@Anuragverma");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

}
