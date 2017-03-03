<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="jsp.model.wishlist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Profile</title>
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
                                    <h1><i class="fa fa-user"></i> Profile : </h1>
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
                                                        <li role="presentation" class="active">
                                                            <a href="userPanel">
                                                                <i class="fa fa-user"></i> My Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="updateProfile">
                                                                <i class="fa fa-pencil-square-o"></i> Edit Profile
                                                            </a>
                                                        </li>
                                                        <li role="presentation">
                                                            <a href="editPassword">
                                                                <i class="fa fa-lock"></i> Change Password
                                                            </a>
                                                        </li>
                                                        <c:if test="${user.role!=1}">
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
                                                        </c:if>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <div class="panel panel-header color-inverse">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">
                                                        Username : 
                                                    </h3>
                                                </div>
                                                <div class="panel-footer">
                                                    Name : ${user.fname}  ${user.lname}
                                                </div>
                                                <div class="panel-footer">
                                                    Gender : ${user.gender}
                                                </div>
                                                <div class="panel-footer">
                                                    Address : ${user.addressline1} ${user.addressline2}
                                                </div>
                                                <div class="panel-footer">
                                                    Email : ${user.email}
                                                </div>
                                                <div class="panel-footer">
                                                    Phones : ${user.phone}
                                                </div>
                                                <div class="panel-footer">
                                                    Date of birth : ${user.DOB}
                                                </div>
                                                <c:if test="${user.role!=1}">
                                                    <div class="panel-footer">
                                                        Movie : ${user.myMovie(user.user_id).size()}
                                                    </div>
                                                    <div class="panel-footer">
                                                        <% wishlist w = new wishlist();
                                                                    request.setAttribute("w", w);%>
                                                        Wish list : ${w.findByIdList(user.user_id).size()}
                                                    </div>
                                                </c:if>
                                            </div>
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
