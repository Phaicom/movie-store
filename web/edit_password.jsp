<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Change Password</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="js/jquery.js" type="text/javascript"></script> 
        <script src="js/edit_password.js" type="text/javascript"></script> 

        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-lock"></i> Change Password : </h1>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12 div-blog">
                                                    <div class="div-header">
                                                        <h2><i class="fa fa-bars"></i> Menu</h2>
                                                    </div>
                                                    <ul class="nav nav-pills nav-stacked">
                                                        <li role="presentation">
                                                            <a href="userPanel">
                                                                <i class="fa fa-user"></i> My Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="updateProfile">
                                                                <i class="fa fa-pencil-square-o"></i> Edit Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="active">
                                                            <a href="editPassword">
                                                                <i class="fa fa-lock"></i> Change Password
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="myMovie">
                                                                <i class="fa fa-film"></i> My Movie
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="wishList">
                                                                <i class="fa fa-heart"></i> Wish list
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <form class="form-horizontal" role="form" action="editPassword" method="post">
                                                <h2>Current Password : </h2>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Password
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input required type="password" class="form-control" name="password" id="password"/><br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        Password Again
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input required type="password" class="form-control" name="password-check" id="password-check" /> <br>
                                                        <span class="warn hidden checknote">Password do not match!</span>
                                                    </div>
                                                </div>
                                                <hr>
                                                <h2>New Password : </h2>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">
                                                        New Password
                                                    </label>
                                                    <div class="col-sm-6">
                                                        <input required type="password" class="form-control" name="password-new" id="password-new"/> <br>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-6">
                                                        ${msg}
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="form-group">
                                                    <div class="center">
                                                        <input type="submit" class="btn btn-danger btn-lg" value="Change" id="register_submit">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
