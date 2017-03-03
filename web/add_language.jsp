<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Add Movie</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
                    },
                    select: function (event, ui) {
                        doSearch(ui.item.label, ui.item.city);
                    }
                });
            });

            function doSearch(term, location) {
                window.location.href = 'addNewMovieLanguage?movie_name=' + term;
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
                                                    <li role="presentation" class="active">
                                                        <a href="moviePanel">
                                                            <i class="fa fa-film"></i> Movie Panel
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
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
                                                    <h2><i class="fa fa-film"></i> Movie Panel : </h2>
                                                </div>
                                                <hr>
                                                <ul class="nav nav-pills nav-justified">
                                                    <li role="presentation">
                                                        <a href="moviePanel">
                                                            <i class="fa fa-upload"></i> Add Movie
                                                        </a>
                                                    </li>
                                                    <li role="presentation" class="active">
                                                        <a href="addNewMovieLanguage">
                                                            <i class="fa fa-language"></i> Add New Language
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
                                                        <a href="updateMovie">
                                                            <i class="fa fa-pencil"></i> Edit Movie
                                                        </a>
                                                    </li>
                                                </ul>
                                                <hr>
                                                <div class="col-md-12">
                                                    <form class="form-horizontal" role="form" action="addNewMovieLanguage" method="post" enctype="multipart/form-data">
                                                        <h2><i class="fa fa-language"></i> Add New Movie Language : </h2><hr>
                                                        <div class="form-group">
                                                            <div class="col-sm-12" >
                                                                ${msg}<br>
                                                                <c:if test="${s.getHl_list(s.getMovie_id())!=null}">
                                                                This Movie already have  
                                                                <c:forEach items="${s.getHl_list(s.getMovie_id())}" var="hl"> 
                                                                    <span style="font-weight: bold"> ${hl.getLanguage()} Language</span>, 
                                                                </c:forEach>
                                                                    If you add the same language it will be updated.
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Movie
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <div class="ui-widget">
                                                                    <input id="movie_name" name="name" class="form-control" required value="${s.name}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Language
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <select class="form-control" name="language" required>
                                                                    <option value="thai">Thai</option>
                                                                    <option value="english">English</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Path
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input required  type="file"  accept="movies/*" class="form-control" name="path" >
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="center">
                                                                <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-language"></i> Add Language</button>
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
