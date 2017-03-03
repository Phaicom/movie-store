<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Check Out</title>
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
                                    <h1><i class="fa fa-credit-card"></i> Check out : </h1>
                                </div>
                                <hr>
                                <div class="col-md-8 col-md-offset-2 div-blog2">
                                    <div class="col-md-12">
                                        <div class="panel panel-header color-inverse">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">
                                                    Payment Transaction : 
                                                </h3>
                                            </div>
                                            <div class="panel-footer">
                                                Pay to : 
                                            </div>
                                            <div class="panel-footer">
                                                Amount : 
                                            </div>
                                        </div>
                                    </div>
                                    <form class="form-horizontal" role="form">
                                        <div class="col-md-12">
                                            <div class="panel panel-header color-inverse">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">
                                                        Confirm Password : 
                                                    </h3>
                                                </div>
                                                <div class="panel-footer">
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">
                                                            Password
                                                        </label>
                                                        <div class="col-sm-6">
                                                            <input required type="password" class="form-control" name="password-new" id="password-new"/> <br>
                                                        </div>
                                                    </div>

                                                    <div class="center">
                                                        <button type="submit" class="btn btn-primary"><i class="fa fa-credit-card"></i> Submit</button>
                                                        <button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back</button>
                                                    </div>
                                                </div>
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
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
