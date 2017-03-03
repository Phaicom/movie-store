<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Login</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-sign-in"></i> Login</h1>
                                </div>
                                <hr>
                                <div class="col-md-6">
                                    <form class="form-horizontal" role="form" action="Login" method="get">
                                        <div class="form-group">
                                            <label class="col-sm-offset-1 col-sm-2 control-label">
                                                Username
                                            </label>
                                            <div class="col-sm-6 col-sm-offset-2 input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                <input type="text" class="form-control" name="username" value="${cookie.uname.value}" placeholder="Username" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-offset-1 col-sm-2 control-label">
                                                Password
                                            </label>
                                            <div class="col-sm-6 col-sm-offset-2 input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="password" class="form-control" name="password" placeholder="Password" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <div class="checkbox">
                                                    <label class="control-label">
                                                        <input type="checkbox" name="remember" value="true"/> Remember me
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <span style="color:red">${msg}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button class="btn btn-primary btn-lg" type="submit"><i class="fa fa-sign-in"></i> Sign In</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-md-12 div-blog2">
                                         <h1><i class="fa fa-user-plus"></i> Register</h1><hr>
                                        <h2>
                                            Don't have an Account ?
                                        </h2>
                                        <p>
                                            Register Now !!! on this button
                                        </p>
                                        <p>
                                            <a class="btn btn-success btn-lg" href="register.jsp"><i class="fa fa-user-plus"></i> Sign Up</a>
                                        </p>
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
