<%@page import="jsp.model.Movie"%>
<%@page import="jsp.model.review"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="jsp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Movie_detail</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="js/sweetalert2.css">
        <script>
            $(document).ready(function () {
                $("#deletemovie").click(function () {
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
                            window.location.href = 'deleteMovie?id=${s.getMovie_id()}';
                        }, 2000);

                        swal('Deleted!', 'Your file has been deleted.', 'success'
                                );
                    });
                });
            });
        </script>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1>${s.getName()}</h1>
                                </div>
                                <div class="col-md-4" style="margin-top: 10px">
                                    <div class="thumbnail">
                                        <img src="${s.getPoster()}" style="height: 400px" class="img-thumbnail" />
                                        <div class="caption">
                                            <p class="text-center">
                                                <a href="#playtrailer" data-toggle="modal" class="center">
                                                    <button class="btn btn-primary btn-lg"><i class="fa fa-play"></i> Watch Trailer</button>
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="playtrailer">
                                        <div class="col-md-4 col-md-offset-4 modal-body" style="margin-top:10%">
                                            <div align="center">
                                                <iframe width="560" height="315" src="${s.getTrailer()}" frameborder="0" allowfullscreen></iframe>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="col-md-8 div-blog2">
                                    <h2>Description : </h2>
                                    <%
                                        Movie m = (Movie)request.getAttribute("s");
                                        int movie_id = m.getMovie_id();
                                        review r = review.findByMovieId(movie_id);
                                        request.setAttribute("r", r);
                                    %>
                                     <input type="number" class="rating" name="rating" value="${r.rating}" data-size="xs" data-rtl="true" disabled/>
                                     <p>
                                        ${s.getDescription()}
                                    </p>
                                    <div>
                                        <h3 style="color: black"> Price : ${s.getMovieCurrencyFormat()}<br></h3>
                                        <h4 style="color: rgb(45,45,45)">    
                                            Total Time : ${s.getTotaltime()} Minutes <br>
                                            Release Year : ${s.getReleasedyear()}<br>
                                            Category : <a href="showShop?category=${s.getCategory().getName()}">${s.getCategory().getName()}</a>
                                        </h4>
                                        <hr>
                                        <c:choose>
                                            <c:when test="${user.getRole()==1}">
                                                <a href="addFeature?movie_name=${s.getName()}" class="btn btn-success btn-md button ${s.isSameFeature(s.getMovie_id())==true?"disabled":""}"><i class="fa fa-cubes"></i> Feature</a>
                                                <a href="addReview?movie_name=${s.getName()}" class="btn btn-warning btn-md button ${s.isSameReview(s.getMovie_id(),uid)==true?"disabled":""}"><i class="fa fa-book"></i> Add Review</a>
                                                <button id="deletemovie" class="btn btn-danger btn-md" ><i class="fa fa-trash"></i> Delete</button>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="Cart?movie_id=${s.getMovie_id()}" class="btn btn-success btn-md ${user.isBuy(user.getUser_id(),s.getMovie_id())?"hidden":""}" ${Cart.isOrder(s.getMovie_id())?"disabled":""} ><i class="fa fa-cart-plus"></i> Buy</a>
                                                <c:if test="${s.isReview(s.getMovie_id())!=null}">
                                                    <a href="showReviewDetail?id=${s.isReview(s.getMovie_id()).getReview_id()}" class="btn btn-warning btn-md" ><i class="fa fa-book"></i> Review</a>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:if  test="${uid!=null}">
                                            <c:if test="${user.role!=1}">
                                                <a href='${s.isSameWishlist(s.getMovie_id(),uid)==true?"deleteWishlist?from=&":"addWishlist?"}id=${s.getMovie_id()}'  class="btn ${s.isSameWishlist(s.getMovie_id(),uid)==true?"btn-default":"btn-danger"} btn-md button ${user.isBuy(user.getUser_id(),s.getMovie_id())==true?"hidden":""}"  ${s.isSameWishlist(s.getMovie_id(),uid)==true?"":""} ><i class="fa fa-heart"></i> Add to wish</a>
                                            </c:if>
                                            <c:if test="${user.isBuy(user.getUser_id(),s.getMovie_id()) || user.getRole()==1}">
                                                <c:forEach items="${s.getHl_list(s.getMovie_id())}" var="hl"> 
                                                    <a href="watch?id=${s.getMovie_id()}&path=${hl.getPath()}" class="btn btn-success btn-md button" ><i class="fa fa-heart"></i> ${hl.getLanguage()} </a>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                        <button type="button" class="btn btn-default btn-md" onClick="${header.referer=="http://localhost:8080/MovieStore/index.jsp"?"javascript:window.location = document.referrer;":"window.history.back();"}"><i class="fa fa-arrow-left"></i> Back</button>
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