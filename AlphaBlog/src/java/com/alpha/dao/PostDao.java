/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.alpha.dao;

/**
 *
 * @author anurag
 */
import com.alpha.entities.Category;
import com.alpha.entities.Post;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection connection;

    public PostDao(Connection connection) {
        this.connection = connection;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String getQuery = "SELECT * FROM categories";
            Statement statement = this.connection.createStatement();
            ResultSet set = statement.executeQuery(getQuery);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category category = new Category(cid, name, description);
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post post) {
        boolean f = false;
        try {
            String savePostQuery = "INSERT INTO posts(pTitle,pContent,pCode,pPic,pDate,catId,userId) values(?,?,?,?,?,?,?)";
            PreparedStatement preparedstatement = connection.prepareStatement(savePostQuery);
            preparedstatement.setString(1, post.getpTitle());
            preparedstatement.setString(2, post.getpContent());
            preparedstatement.setString(3, post.getpCode());
            preparedstatement.setString(4, post.getpPic());
            preparedstatement.setObject(5, post.getpDate());
            preparedstatement.setInt(6, post.getCatId());
            preparedstatement.setInt(7, post.getUserId());
            preparedstatement.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement preparedstatement = connection.prepareStatement("SELECT * FROM posts");
            ResultSet set = preparedstatement.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pImage = set.getString("pPic");
                Date dateTime = set.getDate("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pImage, dateTime, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement preparedstatement = connection.prepareStatement("SELECT * FROM posts WHERE catId=?");
            preparedstatement.setInt(1,catId);
            ResultSet set = preparedstatement.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pImage = set.getString("pPic");
                Date dateTime = set.getDate("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pImage, dateTime, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}