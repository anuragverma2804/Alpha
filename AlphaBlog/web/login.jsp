<%@page import="com.alpha.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="css/Style.css" rel="stylesheet">
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <% 
        Message msg=(Message)session.getAttribute("msg");
        if(msg!=null){
        %>
        <div class="alert <%= msg.getCssClass() %> mx-5 my-5" role="alert">
            <%= msg.getContent() %>
</div>
        <%
            session.removeAttribute("msg");
            }
        
        %>

        <div class="row mt-5">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                
                <div class="mb-4 card rounded-3 py-5">
                    <form action="/LoginSevlet" method="post" >
                        
                        <div class="row mb-3">
                            
                            <div class="col-sm-3"></div>
                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-4">
                                <input name="email" required type="email" class="form-control" id="email">
                            </div>
                            <div class="col-sm-3"></div>

                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3"></div>

                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-4">
                                <input name="password" required type="password" class="form-control" id="password">
                            </div>
                            <div class="col-sm-3"></div>


                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>

                            <div class="col-sm-4"></div>

                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-4"></div>

        </div>


    </body>
</html>
