<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Feature Panel</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script src="js/sweetalert2.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="js/sweetalert2.css">


        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-user-secret"></i> Administration Panel : </h1>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            <div class="panel panel-header" style="border-color: #F7F7F7">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><i class="fa fa-bars"></i> Menu</h3>
                                                </div>
                                                <ul class="nav nav-pills nav-stacked" style="background-color: #F7F7F7">
                                                    <li role="presentation">
                                                        <a href="admin_panel.jsp">
                                                            <i class="fa fa-line-chart"></i> Dashboard
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="orderList">
                                                            <i class="fa fa-check-square-o"></i> Order list
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="moviePanel">
                                                            <i class="fa fa-film"></i> Movie Panel
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="addReview">
                                                            <i class="fa fa-book"></i> Review Panel
                                                        </a>
                                                    </li>
                                                    <li role="presentation" class="active">
                                                        <a href="featurePanel">
                                                            <i class="fa fa-cubes"></i> Feature Panel
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="showContact">
                                                            <i class="fa fa-cubes"></i> Show Contact
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="div-header">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                    <h2><i class="fa fa-book"></i> Feature Panel : </h2>
                                                                </div>
                                                                <div class="col-md-2" style="padding:10px;">
                                                                    <a href="addFeature" class="btn btn-success button"><i class="fa fa-plus-circle"></i> Add Feature</a>
                                                                </div>
                                                                <div class="col-md-2" style="padding:10px;">
                                                                    <div class="dropdown">
                                                                        <button class="btn btn-dropdown dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                                                                            Category
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                                            <li><a href="featurePanel">All</a></li>
                                                                                <c:forEach items="${lc}" var="lc">
                                                                                <li>
                                                                                    <a href="featurePanel?category=${lc.getName()}">${lc.getName()}</a>
                                                                                </li>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <h3>${msg}</h3>
                                                </div>
                                                <div class="row">
                                                    <c:forEach items="${featureList}" var="featureList" varStatus="loop">
                                                        <div class="col-md-3">
                                                            <div class="thumbnail">
                                                                <a href="featureDetail?id=${featureList.getMovie_id()}">
                                                                    <img class="img-thumbnail" src="${featureList.getMovie(featureList.getMovie_id()).getPoster()}">
                                                                </a>
                                                                <div class="caption center">
                                                                    <a href="addReview?movie_name=${featureList.getMovie(featureList.getMovie_id()).getName()}" class="btn btn-success btn-sm button ${featureList.isSameReview(featureList.getMovie_id())==true?"disabled":""}">Review</a>
                                                                    <a href="deleteFeature?id=${featureList.getMovie_id()}" class="btn btn-danger btn-sm" value="${featureList.getMovie_id()}">Delete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:if test="${(loop.count%4)==0}">
                                                        </div>
                                                        <div class="row">
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="center">
                                                    <ul class="pagination">
                                                        <c:if test="${currentPage != 1}">
                                                            <li>
                                                                <a href="featurePanel?page=${currentPage - 1}">Previous</a>
                                                            </li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                    <li>
                                                                        <a href="#">${i}</a>
                                                                    </li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li>
                                                                        <a href="featurePanel?page=${i}">${i}</a>
                                                                    </li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <c:if test="${currentPage lt noOfPages}">
                                                            <li>
                                                                <a href="featurePanel?page=${currentPage + 1}">Next</a>
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
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>