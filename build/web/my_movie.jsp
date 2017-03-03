<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | My Movie</title>
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
                                    <div class="row">
                                        <div class="col-md-10">
                                            <h1><i class="fa fa-film"></i> My Movie :</h1>
                                        </div>
                                        <div class="col-md-2" style="padding:15px;">
                                            <div class="dropdown">
                                                <button class="btn btn-dropdown btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                                                    Category
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                    <li><a href="myMovie">All</a></li>
                                                        <c:forEach items="${lc}" var="lc">
                                                        <li>
                                                            <a href="myMovie?category=${lc.getName()}">${lc.getName()}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                                <li role="presentation">
                                                    <a href="editPassword">
                                                        <i class="fa fa-lock"></i> Change Password
                                                    </a>
                                                </li>
                                                <li role="presentation" class="active">
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
                                    <hr>
                                    <div class="row">
                                        <c:forEach items="${movieList}" var="movie" varStatus="loop">
                                            <div class="col-md-3">
                                                <a href="showMovieDetail?id=${movie.getMovie_id()}" class="img-link center">
                                                    <div class="img-hover">
                                                        <div class="img-hover-content">
                                                            <p>${movie.getName()}</p>
                                                            <i class="fa fa-inbox fa-3x"></i>
                                                        </div>
                                                    </div>
                                                    <img src="${movie.getPoster()}" class="img-thumbnail" alt="${movie.getName()}" style="height: 280px">
                                                </a>
                                            </div>
                                            <c:if test="${(loop.count%4)==0}">
                                            </div>
                                            <div class="row">
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <hr>
                                    <div class="center">
                                        <ul class="pagination">
                                            <c:if test="${currentPage != 1}">
                                                <li>
                                                    <a href="myMovie?page=${currentPage - 1}">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li>
                                                            <a href="#" style="color: red">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="myMovie?page=${i}">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${currentPage lt noOfPages}">
                                                <li>
                                                    <a href="myMovie?page=${currentPage + 1}">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
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
