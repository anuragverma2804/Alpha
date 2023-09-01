<%@page import="java.util.ArrayList"%>
<%@page import="com.alpha.dao.PostDao"%>
<%@page import="java.util.List"%>
<%@page import="com.alpha.entities.Post"%>
<%@page import="com.alpha.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <%
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = new ArrayList<>();
        if (request.getParameter("catId").equals("0")) {
            posts = postDao.getAllPosts();
        } else {
            posts = postDao.getPostByCatId(Integer.parseInt(request.getParameter("catId")));
        }
        if(posts.size()==0){
            out.println("<div class='text-centre'><h3>No Post Found In This Category</h3></div>");
            return;
        }
        for (Post p : posts) {
    %>

    <div class="col-md-6">
        <div class="card" style="width: 18rem;">
            <img style="width: 300px;height: 300px;" src="blogImages/<%= p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%= p.getpTitle()%></h5>
                <h6 class="card-subtitle mb-2 text-body-secondary"><%= p.getpContent()%></h6>
                <pre><%= p.getpCode()%></pre>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>