<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="css/Style.css" rel="stylesheet">
        <title>Register | Alpha</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="row mt-5">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="mb-4 card rounded-3 py-5">
                    <form action="RegisterServlet" method="post" enctype='multipart/form-data'>
                        <div class="row mb-3">
                            <div class="col-sm-3"></div>
                            <label for="name" class="col-sm-2 col-form-label">Username</label>
                            <div class="col-sm-4">
                                <input name="name" type="text" class="form-control" id="name">
                            </div>
                            <div class="col-sm-3"></div>

                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3"></div>
                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-4">
                                <input name="email" type="email" class="form-control" id="email">
                            </div>
                            <div class="col-sm-3"></div>

                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3"></div>

                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-4">
                                <input name="password" type="password" class="form-control" id="password">
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
                        <div class="row mb-3">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
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
