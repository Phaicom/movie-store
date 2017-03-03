<%@page import="jsp.model.review"%>
<%@page import="jsp.model.Movie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Search</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="js/search.js" type="text/javascript"></script> 
        <%
            List<Movie> lm = Movie.findByName("");
            request.setAttribute("lm", lm);
            List<review> lr = review.findByName("");
            request.setAttribute("lr", lr);
        %>
        <script>
            $(document).ready(function () {
                var availableTags = [
            <c:forEach items="${lm}" var="lm">
                    "${lm.getName()}",
            </c:forEach>
                ];

                $("#search").autocomplete({
                    source: function (request, response) {
                        var results = $.ui.autocomplete.filter(availableTags, request.term);

                        response(results.slice(0, 5));
                    }
                });
                $('#role').change(function () {
                    if ($(this).val() == 'Movie') {
                        $(function () {
                            var availableTags = [
            <c:forEach items="${lm}" var="lm">
                                "${lm.getName()}",
            </c:forEach>
                            ];

                            $("#search").autocomplete({
                                source: function (request, response) {
                                    var results = $.ui.autocomplete.filter(availableTags, request.term);

                                    response(results.slice(0, 5));
                                }
                            });
                        });
                    } else {
                        $(function () {
                            var availableTags = [
            <c:forEach items="${lr}" var="lr">
                                "${lr.getName()}",
            </c:forEach>
                            ];

                            $("#search").autocomplete({
                                source: function (request, response) {
                                    var results = $.ui.autocomplete.filter(availableTags, request.term);

                                    response(results.slice(0, 5));
                                }
                            });
                        });
                    }
                });
            });
        </script>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-search"></i> Search : </h1>
                        </div>
                        <hr>
                        <div class="row">
                            <div align="center">
                                <form class="form-group" action="search" method="get">
                                    <div class="col-xs-2 col-xs-offset-1">
                                        <select name="role" class="form-control" id="role">
                                            <option value="Movie" id="Movie" ${role=='Movie'||role==''?"selected":""}>Movie</option>
                                            <option value="Review" id="Review" ${role=='Review'?"selected":""}>Review</option>
                                            <c:if test="${user.getRole()==1}">
                                                <option value="Feature" id="Feature" ${role=='Feature'?"selected":""}>Feature</option>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 ">
                                        <select name="type" class="form-control" id="type">
                                            <option value="Name" id="Name" ${type=='Name'||type==''?"selected":""}>Name</option>
                                            <option value="Price" id="Price" ${type=='Price'?"selected":""} ${role=='Review'?"hidden":" "}>Price</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-4 " id="search-name">
                                        <input class="form-control" type="text" id="search" placeholder="Name" name="movie_name" value="${movie_name==""?"":movie_name}" >
                                    </div>
                                    <div class="col-xs-2 search-num">
                                        <input class="form-control" type="number" placeholder="Lowest Price"  name="value1" value="${value1==""?"":value1}" > 
                                    </div>
                                    <div class="col-xs-2 search-num">
                                        <input class="form-control" type="number" placeholder="Highest Price"  name="value2" value="${value2==""?"":value2}">
                                    </div>
                                    <div class="col-xs-2">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search fa-inverse"></i> Search</button>

                                        <%--<c:if test="${user.getRole()==1}">--%>
                                            <!--<a href="saveMovie" type="button" id="saveMovie_button" class="btn btn-primary button" ${role=='Movie'?"":"hidden"}><i class="fa fa-search fa-inverse"></i>Add Movie</a>-->
                                            <!--<a href="addReview" type="button" id="addReview_button" class="btn btn-primary button" ${role=='Review'?"":"hidden"}><i class="fa fa-search fa-inverse"></i>Add Review</a>-->
                                            <!--<a href="addFeature" type="button" id="addFeature_button" class="btn btn-primary button" ${role=='Feature'?"":"hidden"}><i class="fa fa-search fa-inverse"></i>Add Feature</a>-->
                                        <%--</c:if>--%>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <c:choose>
                                <c:when test="${role=='Review'}">
                                    <c:forEach items="${List}" var="review" varStatus="loop">
                                        <div class="col-md-3">
                                            <a href="showReviewDetail?id=${review.getReview_id()}">
                                                <img class="img-thumbnail" src="${review.getImage(review.getMovie_id())}">
                                            </a>
                                        </div>
                                        <c:if test="${(loop.count%4)==0}">
                                        </div>
                                        <div class="row">
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${role=='Feature'}">
                                    <c:forEach items="${List}" var="featureList" varStatus="loop">
                                        <div class="col-md-3 thumbnail">
                                            <a href="featureDetail?id=${featureList.getMovie_id()}">
                                                <img class="img-thumbnail" src="${featureList.getMovie(featureList.getMovie_id()).getPoster()}">
                                            </a>
                                            <div class="caption center">
                                                <a href="addReview?movie_name=${featureList.getMovie(featureList.getMovie_id()).getName()}" class="btn btn-success btn-lg button ${featureList.isSameReview(featureList.getMovie_id())==true?"disabled":""}">Review</a>
                                                <script>
                                                    $(document).ready(function () {
                                                        $(".deletefeature").click(function () {
                                                            swal({title: 'Are you sure?',
                                                                text: 'You will not be able to recover this Movie!',
                                                                type: 'warning',
                                                                showCancelButton: true,
                                                                confirmButtonColor: '#3085d6',
                                                                cancelButtonColor: '#d33',
                                                                confirmButtonText: 'Yes, delete it!',
                                                                closeOnConfirm: false},
                                                            function () {
                                                                setTimeout(function () {
                                                                    window.location.href = 'deleteFeature?id=${featureList.getMovie_id()}';
                                                                }, 2000);

                                                                swal('Deleted!', 'Your file has been deleted.', 'success'
                                                                        );
                                                            });
                                                        });
                                                    });
                                                </script>
                                                <button  class="btn btn-danger btn-lg deletefeature" value="${featureList.getMovie_id()}">Delete</button>
                                            </div>
                                        </div>
                                        <c:if test="${(loop.count%4)==0}">
                                        </div>
                                        <div class="row">
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${List}" var="movie" varStatus="loop">
                                        <div class="col-md-3">
                                            <a href="showMovieDetail?id=${movie.getMovie_id()}" class="img-link center">
                                                <div class="img-hover">
                                                    <div class="img-hover-content">
                                                        <p>${movie.getName()}</p>
                                                        <i class="fa fa-inbox fa-3x"></i>
                                                    </div>
                                                </div>
                                                <img src="${movie.getPoster()}" class="img-thumbnail" alt="${movie.getName()}" style="height: 350px">
                                            </a>
                                        </div>
                                        <c:if test="${(loop.count%4)==0}">
                                        </div>
                                        <div class="row">
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <hr>
                        <div class="center">
                            <ul class="pagination">
                                <c:if test="${currentPage != 1}">
                                    <li>
                                        <c:if test="${param.type=='Name'||param.type==''}">
                                            <a href="search?page=${currentPage - 1}&role=${param.role}&type=${param.type}&movie_name=${param.movie_name}">Previous</a>
                                        </c:if>
                                        <c:if test="${param.type=='Price'}">
                                            <a href="search?page=${currentPage - 1}&role=${param.role}&type=${param.type}&value1=${param.value1}&value2=${param.value2}">Previous</a>
                                        </c:if>
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
                                                <c:if test="${param.type=='Name'||param.type==''}">
                                                    <a href="search?page=${i}&role=${param.role}&type=${param.type}&movie_name=${param.movie_name}">${i}</a>
                                                </c:if>
                                                <c:if test="${param.type=='Price'}">
                                                    <a href="search?page=${i}&role=${param.role}&type=${param.type}&value1=${param.value1}&value2=${param.value2}">${i}</a>
                                                </c:if>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${currentPage lt noOfPages}">
                                    <li>
                                        <c:if test="${param.type=='Name'||param.type==''}">
                                            <a href="search?page=${currentPage + 1}&role=${param.role}&type=${param.type}&movie_name=${param.movie_name}">Next</a>
                                        </c:if>
                                        <c:if test="${param.type=='Price'}">
                                            <a href="search?page=${currentPage + 1}&role=${param.role}&type=${param.type}&value1=${param.value1}&value2=${param.value2}">Next</a>
                                        </c:if>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div align="center">
                            <h2 style="color: black">${msg}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
