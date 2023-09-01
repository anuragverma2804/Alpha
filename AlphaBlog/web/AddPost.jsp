<%@page import="java.util.ArrayList"%>
<%@page import="com.alpha.entities.Category"%>
<%@page import="com.alpha.dao.PostDao"%>
<%@page import="com.alpha.helper.ConnectionProvider"%>
<%@page import="com.alpha.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.alpha.entities.User" %>
<%@page errorPage="ErrorPage.jsp" %>
<% User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("/LoginSevlet");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="css/Style.css" rel="stylesheet">
        <title>Create Blog</title>
    </head>
    <body>
        <%@include file="ProfileNavbar.jsp" %>
        <div class="container  my-5">
            <form action="AddPostServlet" id="post_form" method="post" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <label class="input-group-text" for="inputGroupSelect01">Category</label>
                    <select class="form-select" name="cid" id="inputGroupSelect01">
                        <option selected>Choose...</option>
                        <%                            PostDao post = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list = post.getCategory();
                            for (Category c : list) {
                        %>
                        <option value="<%= c.getCid() %>"><%= c.getName()%></option>
                        <%
                            }
                        %>

                    </select>
                </div>
                <div class="input-group my-3">
                    <span class="input-group-text">Title</span>
                    <input name="title" type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                </div>
                <div class="input-group my-3">
                    <span class="input-group-text">Content</span>
                    <textarea name="content" class="form-control" aria-label="With textarea"></textarea>
                </div>

                <div class="input-group my-3">
                    <span class="input-group-text">Code</span>
                    <textarea name="code" class="form-control" aria-label="With textarea"></textarea>
                </div>
                <div class="input-group mb-3">
                    <input name="image" type="file" class="form-control" id="inputGroupFile02">
                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>
                <div class="text-center">
                    <button id="post_form_submit_btn" class="btn btn-primary" type="submit">Post</button>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>           
        <script src="js/js.js"></script>
    </body>
</html>
