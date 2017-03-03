<%@page import="jsp.model.movie_feature"%>
<%@page import="jsp.model.Movie"%>
<%@page import="jsp.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="jsp.model.History"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Home Page</title>
    </head>
    <body onload="document.refresh();">
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-home"></i> Home : </h1>
                        </div>
                        <hr>
                        <div class="carousel slide" id="carousel-621579">
                            <%
                                List<movie_feature> lmf = movie_feature.getShowFeature(3);
                                request.setAttribute("lmf", lmf);
                            %>
                            <ol class="carousel-indicators">
                                <c:forEach items="${lmf}" var="carousel" varStatus="loop">
                                    <li class="${(loop.count-1)==0?"active":""}" data-slide-to="${(loop.count)-1}" data-target="#carousel-621579">
                                    </li>
                                </c:forEach>
                            </ol>
                            <div class="carousel-inner">


                                <c:forEach items="${lmf}" var="mf" varStatus="loop">
                                    <div class="item ${loop.count==1?"active":""}">
                                        <a href="showMovieDetail?id=${mf.getMovie_id()}">
                                            <img alt="${loop.count}" src="${mf.getPic()}" style="height: 480px;width: 1200px" />
                                        </a>
                                        <div class="carousel-caption">
                                            <a href="showMovieDetail?id=${mf.getMovie_id()}">
                                                <h2 style="color: whitesmoke">
                                                    ${mf.getMovie(mf.getMovie_id()).getName()}
                                                </h2>
                                            </a>
                                            <p style="color: whitesmoke">
                                                <c:set var="desc" value="${mf.getMovie(mf.getMovie_id()).getDescription()}"/>
                                                <c:set var="sub" value="${fn:substring(desc, 0, 60)}" />
                                                ${sub} ...
                                            </p>
                                        </div>
                                    </div>

                                </c:forEach>

                            </div> <a class="left carousel-control" href="#carousel-621579" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-621579" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div>
                <%--------TOP 10--------%>
                <div class="col-md-12">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-12 div-blog">
                                <div class="div-header center">
                                    <h2><i class="fa fa-star"></i> Top 10</h2>
                                </div>
                                <hr>
                                <ul class="nav nav-pills nav-stacked">
                                    <%
                                        List<Movie> topten_movie = Movie.getToptenMovie();
                                        request.setAttribute("topten_movie", topten_movie);
                                    %>
                                    <c:forEach items="${topten_movie}" var="lm" varStatus="loop">
                                        <li>
                                            <a href="showMovieDetail?id=${lm.getMovie_id()}">
                                                <h4>${loop.count}.${lm.name}</h4>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <%
                        List<Movie> lm = Movie.recenlyMovie();
                        request.setAttribute("lm", lm);
                    %>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-12 div-blog">
                                <div class="div-header center">
                                    <h2>Just Arrived</h2>
                                </div>
                                <hr>
                                <div class="row">
                                    <c:forEach items="${lm}" var="lm">
                                        <div class="col-md-4 img-item">
                                            <div class="thumbnail" style="height: 520px">
                                                <a href="showMovieDetail?id=${lm.getMovie_id()}" class="img-link">
                                                    <div class="img-hover">
                                                        <div class="img-hover-content">
                                                            <p>${lm.getName()}</p>
                                                            <i class="fa fa-inbox fa-3x"></i>
                                                        </div>
                                                    </div>
                                                    <img src="${lm.getPoster()}" class="img-responsive" alt="${lm.getName()}" style="height: 400px">
                                                </a>
                                                <div class="caption">
                                                    <p>
                                                        <c:set var="desc" value="${lm.getDescription()}"/>
                                                        <c:set var="sub" value="${fn:substring(desc, 0, 65)}" />
                                                        ${sub} ...
                                                    </p>
                                                    <p class="center">
                                                        <a class="btn btn-success" href="#"><i class="fa fa-cart-plus"></i> Buy</a> 
                                                        <a class="btn btn-danger" href="#"><i class="fa fa-heart"></i> Add to wish</a> 
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <%
                            User u = (User) request.getSession().getAttribute("user");
                            int uid = 0;
                            if (u != null) {
                                uid = u.getUser_id();
                            }
                            List<History> lh = History.findByIdList(uid);
                            request.setAttribute("lh", lh);
                            request.setAttribute("u", u);
                        %>
                        <c:if test="${u!=null}">
                            <div class="row">
                                <div class="col-md-12 div-blog">
                                    <div class="row">
                                        <h2 class="center">Recently </h2><hr>
                                        <c:forEach items="${lh}" var="lh" varStatus="loop">
                                            <c:if test="${loop.count<=3}">
                                                <div class="col-md-4">
                                                    <div class="thumbnail">
                                                        <img alt="1" src="${lh.getMovie(lh.getMovie_id()).getPoster()}"/>
                                                        <div class="caption">
                                                            <h3>
                                                                ${lh.getMovie(lh.getMovie_id()).getName()}
                                                            </h3>
                                                            <p>
                                                                <c:set var="desc" value="${lh.getMovie(lh.getMovie_id()).getDescription()}"/>
                                                                <c:set var="sub" value="${fn:substring(desc, 0, 65)}" />
                                                                ${sub} ...
                                                            </p>
                                                            <p>
                                                                <a class="btn btn-success" href="#">Buy</a> 
                                                                <a href="showMovieDetail?id=${lh.getMovie_id()}">Read more</a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
