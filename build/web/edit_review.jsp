<%@page import="jsp.model.Movie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Review Panel</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        
            <%
                List<Movie> listmovie =  Movie.findByReviewName("");
                request.setAttribute("listmovie", listmovie);
            %>
        <script>
            
                
            $(function () {
                var availableTags = [
            <c:forEach items="${listmovie}" var="lm">
                    "${lm.getName()}",
            </c:forEach>
                ];
                $("#movie_review").autocomplete({
                    source: function (request, response) {
                        var results = $.ui.autocomplete.filter(availableTags, request.term);

                        response(results.slice(0, 3));
                    },
                    select: function (event, ui) {
                        doSearch(ui.item.label, ui.item.city);
                    }
                });
            });
            function doSearch(term, location) {
                window.location.href = 'editReview?movie_name=' + term;
            }
            
        </script>
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
                                                    <li role="presentation" class="active">
                                                        <a href="addReview">
                                                            <i class="fa fa-book"></i> Review Panel
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="featurePanel">
                                                            <i class="fa fa-cubes"></i> Feature Panel
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="div-header">
                                                    <h2><i class="fa fa-book"></i> Review Panel : </h2>
                                                </div><br>
                                                <ul class="nav nav-pills nav-justified">
                                                    <li role="presentation">
                                                        <a href="addReview">
                                                            <i class="fa fa-upload"></i> Add Review
                                                        </a>
                                                    </li>
                                                    <li role="presentation" class="active">
                                                        <a href="#">
                                                            <i class="fa fa-pencil"></i> Edit Review
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="col-md-12">
                                                    <form class="form-horizontal" role="form" action="editReview" method="post">
                                                        <h2><i class="fa fa-pencil"></i> Edit Review : </h2><hr>
                                                        <div class="form-group">
                                                            <div class="col-sm-6">
                                                                ${msg=="null"?"":msg}
                                                            </div>
                                                        </div>
                                                            
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Movie
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <div class="ui-widget">
                                                                    <input id="movie_review" name="movie_name" class="form-control"  required value="${review.getMoviename(review.movie_id)}">
                                                                    <input type="text" id="moviename_default"  hidden value="${review.getMoviename(review.movie_id)}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Review Name
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input type="text" id="rname" class="form-control" name="name" value="${review.name}" required/>
                                                                <input type="text" id="rname_default"  hidden value="${review.name}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Rating
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input type="number" id="rating" class="form-control rating" name="rating" min=0 max=5 step=1 data-size="lg" value="${review.rating}" data-rtl="true" required/>
                                                                <input type="text" id="rating_default"  hidden value="${review.rating}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Review Detail
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <textarea class="form-control" id="description" style="height: 200px"  name="description" required>${review.description!=null?review.description:""}</textarea>
                                                                <input type="text" id="description_default"  hidden value="${review.description}"/>
                                                            </div>
                                                        </div>
                                                                <input type="hidden" name="review_id"  hidden value="${review.review_id}"/>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="center">
                                                                <button type="submit" id="subedit" class="btn btn-success btn-lg"><i class="fa fa-pencil"></i> Edit Review</button>
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
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
