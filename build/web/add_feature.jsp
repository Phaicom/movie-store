<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Add Feature</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script>
            $(function () {
                var availableTags = [
            <c:forEach items="${lm}" var="lm">
                    "${lm.getName()}",
            </c:forEach>
                ];
                $("#movie_name").autocomplete({
                    source: function (request, response) {
                        var results = $.ui.autocomplete.filter(availableTags, request.term);

                        response(results.slice(0, 3));
                    }
                });

                $("#searchposter").autocomplete({
                    source: function (request, response) {
                        var results = $.ui.autocomplete.filter(availableTags, request.term);

                        response(results.slice(0, 3));
                    }
                });
            });

            $(document).ready(function () {
                $('#search_poster_button').click(function () {
                    var searchposter = $('#searchposter').val();
                    $(this).attr("href", "https://www.themoviedb.org/search?query=" + searchposter);
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
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-9 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="div-header">
                                                    <h2><i class="fa fa-book"></i> Feature Panel : </h2>
                                                </div>
                                                <div class="col-md-12">
                                                    <form class="form-horizontal" role="form" action="addFeature" method="post">
                                                        <h3><i class="fa fa-plus-circle"></i> Add Feature</h3>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="col-sm-6">
                                                                ${msg}
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Search Poster Image
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <div class="input-group">
                                                                    <input  type="text"  class="form-control"  name="searchposter" id="searchposter">
                                                                    <span class="input-group-btn">
                                                                        <a target="_blank" id="search_poster_button" class="btn btn-primary button"><i class="fa fa-search"></i></a>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Poster link
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input required  type="text"  class="form-control" name="pic">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Movie
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <div class="ui-widget">
                                                                    <input id="movie_name" class="form-control" name="movie_name" required value="${param.movie_name=="null"?"":param.movie_name}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="center">
                                                                <button type="button" class="btn btn-default btn-lg" onClick="window.history.back();"><i class="fa fa-arrow-left"></i> Back</button>
                                                                <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-plus-circle"></i> Add feature</button>
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
