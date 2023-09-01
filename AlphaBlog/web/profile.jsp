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
        <title><%= user.getName()%></title>
    </head>
    <body>
        <%@include file="ProfileNavbar.jsp" %>
        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="alert <%= msg.getCssClass()%> mx-5 my-5" role="alert">
            <%= msg.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }

        %>
        <main>
            <div class="mx-2 my-2">
                <div class="row">
                    <div class="col-md-3">
                        <div class="list-group mx-2" id="category_list">
                            <a href="" id="category_0" class="list-group-item active" aria-current="true">All Post</a>                                 
                            <%  PostDao post = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = post.getCategory();
                                for (Category c : list) {
                            %>

                            <a href="" id="category_<%=c.getCid()%>" class="list-group-item" aria-current="true"><%= c.getName()%></a> 
                            <%
                                }
                            %>
                        </div>

                    </div>
                    <div class="col-md-9" id="postContainer">
                    </div>
                </div>
            </div>
        </main>






        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"><%= user.getName()%></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div id="profile_detail" style="display: block">
                        <div  class="modal-body">
                            <div class="container my-2 text-center" >
                                <img style="width: 100px;height: 100px;" src="Profile/<%= user.getProfile()%>"> 
                            </div>
                            <h6>Email: <%= user.getEmail()%> </h6>
                            <br>
                            <h6>Gender: <%= user.getGender()%></h6>


                        </div>
                        <div class="modal-footer">
                            <button id="edit_profile" type="button" class="btn btn-secondary">Edit Profile</button>

                            <a href="/LogoutServlet"><button type="button" class="btn btn-primary">Logout</button></a>
                        </div>
                    </div>

                    <div id="profile_edit" style="display: none">
                        <form action="EditServlet" method="post" enctype='multipart/form-data'>
                            <div  class="modal-body">
                                <div class="row mb-3">
                                    <div class="col-sm-3"></div>
                                    <label for="name" class="col-sm-2 col-form-label">Username</label>
                                    <div class="col-sm-4">
                                        <input name="name" value="<%= user.getName()%>" type="text" class="form-control" id="name">
                                    </div>
                                    <div class="col-sm-3"></div>

                                </div>

                                <div class="row mb-3">
                                    <div class="col-sm-3"></div>
                                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-4">
                                        <input name="email" value="<%= user.getEmail()%>" type="email" class="form-control" id="email">
                                    </div>
                                    <div class="col-sm-3"></div>

                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3"></div>

                                    <label for="password" class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-4">
                                        <input name="password" value="<%= user.getPassword()%>" type="password" class="form-control" id="password">
                                    </div>
                                    <div class="col-sm-3"></div>


                                </div>
                                <div class="row mb-3 " style="margin-left: 0.5rem;">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-7 form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="male_gender" value="male" checked>
                                        <label class="form-check-label" for="male_gender">
                                            Male
                                        </label>
                                    </div>
                                </div>
                                <div class="row mb-3 " style="margin-left: 0.5rem;">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-7 form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="female_gender" value="female">
                                        <label class="form-check-label" for="female_gender">
                                            Female
                                        </label>
                                    </div>
                                </div>
                                <div class="row mb-3 " style="margin-left: 0.5rem;">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-7 input-group mb-3">
                                        <label class="input-group-text" for="profile">Upload</label>
                                        <input name="profile" type="file" class="form-control" id="profile">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>           
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>           
        <script src="js/js.js"></script>
        <script>
            $("#category_list").click(function (event) {
                event.preventDefault();
                $.ajax({
                    url: "loadPost.jsp",
                    data: {"catId": event.target.id[9]},
                    success: function (data) {
                        for (let i = 0; i <= ((document.getElementById("category_list")).getElementsByTagName('a').length); i++) {
                            $("#category_" + i).removeClass('active');
                        }
                        $("#" + event.target.id).addClass('active');
                        $("#postContainer").html(data);
                    }
                });


            });
        </script>
    </body>
</html>
