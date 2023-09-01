/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.alpha.dao;

import com.alpha.entities.User;
import java.sql.*;

/**
 *
 * @author anurag
 */
public class UserDao {

    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;

    }

    public boolean saveUser(User user) {
        try {
            String insertData = "INSERT INTO User(name,email,password,gender,profile_photo) values(?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertData);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setString(5, user.getProfile());
            preparedStatement.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String getUser = "SELECT * FROM user WHERE email=? and password=?";
            PreparedStatement preparedSatatement = connection.prepareStatement(getUser);
            preparedSatatement.setString(1, email);
            preparedSatatement.setString(2, password);
            ResultSet set = preparedSatatement.executeQuery();
            if (set.next()) {
                user = new User();
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setProfile(set.getString("profile_photo"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            if (user.getProfile() == "") {
                String updateQuery = "UPDATE user set name=?,email=?,password=? where id=?";
                PreparedStatement preparedstatement = connection.prepareStatement(updateQuery);
                preparedstatement.setString(1, user.getName());
                preparedstatement.setString(2, user.getEmail());
                preparedstatement.setString(3, user.getPassword());
                preparedstatement.setInt(4, user.getId());
                preparedstatement.executeUpdate();
            } else {
                String updateQuery = "UPDATE user set name=?,email=?,password=?, profile_photo=? where id=?";
                PreparedStatement preparedstatement = connection.prepareStatement(updateQuery);
                preparedstatement.setString(1, user.getName());
                preparedstatement.setString(2, user.getEmail());
                preparedstatement.setString(3, user.getPassword());
                preparedstatement.setString(4, user.getProfile());
                preparedstatement.setInt(5, user.getId());
                preparedstatement.executeUpdate();
            }

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
