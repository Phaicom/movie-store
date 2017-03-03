<%@page import="jsp.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Shop</title>
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
                                    <h1><i class="fa fa-archive"></i> Shop : </h1>
                                </div>
                                <hr>
                                <div class="col-md-3">
                                    <div class="row">
                                        <div class="col-md-12 div-blog">
                                            <div class="div-header">
                                                <h2><i class="fa fa-bars"></i> Category</h2>
                                            </div>
                                            <ul class="nav nav-pills nav-stacked">
                                                <li role="presentation">
                                                    <a href="showShop">All</a>
                                                </li>
                                                <c:forEach items="${lc}" var="lc">
                                                    <li role="presentation">
                                                        <a href="showShop?category=${lc.getName()}">${lc.getName()}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="row div-blog2">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <c:forEach items="${movieList}" var="movie" varStatus="loop">
                                                    <div class="col-md-3 thumbnail">
                                                        <a href="showMovieDetail?id=${movie.getMovie_id()}" class="img-link center">
                                                            <div class="img-hover">
                                                                <div class="img-hover-content">
                                                                    <p>${movie.getName()}</p>
                                                                    <i class="fa fa-inbox fa-3x"></i>
                                                                </div>
                                                            </div>
                                                            <img src="${movie.getPoster()}" class="img-thumbnail" alt="${movie.getName()}" style="height: 280px">
                                                        </a><br>
                                                        <p class="center">
                                                            <a href="Cart?movie_id=${movie.getMovie_id()}" class="btn btn-success btn-sd ${user.isBuy(user.getUser_id(),movie.getMovie_id())?"hidden":""}" ${Cart.isOrder(movie.getMovie_id())?"disabled":""} ><i class="fa fa-cart-plus"></i> Buy</a>
                                                            <a href='${movie.isSameWishlist(movie.getMovie_id(),user.user_id)==true?"deleteWishlist?from=&":"addWishlist?"}id=${movie.getMovie_id()}'  class="btn ${movie.isSameWishlist(movie.getMovie_id(),user.user_id)==true?"btn-default":"btn-danger"} btn-md button ${user.isBuy(user.getUser_id(),movie.getMovie_id())==true?"hidden":""}"  ${movie.isSameWishlist(movie.getMovie_id(),user.user_id)==true?"":""} ><i class="fa fa-heart"></i> Add to wish</a>
                                                        </p>
                                                    </div>
                                                    <c:if test="${(loop.count%4)==0}">
                                                    </div>
                                                    <div class="row">
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="center">
                                            <ul class="pagination">
                                                <c:if test="${currentPage != 1}">
                                                    <li>
                                                        <a href="showShop?page=${currentPage - 1}">Previous</a>
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
                                                                <a href="showShop?page=${i}">${i}</a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${currentPage lt noOfPages}">
                                                    <li>
                                                        <a href="showShop?page=${currentPage + 1}">Next</a>
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
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
