<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Movie Panel</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script>
            $(document).ready(function(){
                $('#search_picture_button').click(function (){
                    var searchpic = $('#searchpic').val();
                    $(this).attr("href","https://www.themoviedb.org/search?query="+searchpic);
                });
                
                $('#search_trailer_button').click(function (){
                    var searchtrailer = $('#searchtrailer').val();
                    $(this).attr("href","https://www.youtube.com/results?search_query="+searchtrailer+" trailer");
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
                                                <div class="div-header">
                                                    <h2><i class="fa fa-film"></i> Movie Panel : </h2>
                                                </div><br>
                                                <ul class="nav nav-pills nav-justified">
                                                    <li role="presentation" class="active">
                                                        <a href="moviePanel">
                                                            <i class="fa fa-upload"></i> Add Movie
                                                        </a>
                                                    </li>
                                                    <li role="presentation">
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
                                                <div class="col-md-12">
                                                    <form class="form-horizontal" role="form" action="saveMovie" method="post" enctype="multipart/form-data">
                                                        <h2><i class="fa fa-upload"></i> Add Movie : </h2><hr>
                                                        <div class="form-group">
                                                            <div class="col-sm-8">
                                                                ${msg}
                                                            </div>
                                                        </div>
<!--                                                        search picture
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Search Picture Image
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <div class=" input-group">
                                                                    <input  type="text"  class="form-control"  name="searchpic" id="searchpic"><br>
                                                                    <span class="input-group-btn">
                                                                        <a target="_blank" id="search_picture_button" class="btn btn-primary button"><i class="fa fa-search"></i></a>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        search video
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Search Trailer Video
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <div class="input-group">
                                                                    <input  type="text"  class="form-control"  name="searchtrailer" id="searchtrailer"><br>
                                                                    <span class="input-group-btn">
                                                                        <a target="_blank" id="search_trailer_button" class="btn btn-primary button"><i class="fa fa-search"></i></a>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>-->
                                                        <!--form-->
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Name
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input type="text" class="form-control" name="name" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Description
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <textarea required  class="form-control" name="description" style="height: 300px"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Category
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <select class="form-control" name="category" required>
                                                                    <c:forEach items="${lc}" var="lc">
                                                                        <option value="${lc.getName()}">${lc.getName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Price
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input required  type="number" class="form-control" name="price" step="0.01"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Released Year
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input required  type="text"  class="form-control" name="releasedyear">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Totaltime
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input required  type="text"  class="form-control" name="totaltime">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Poster link
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input required  type="text"  class="form-control" name="poster">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Trailer Embed
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <input required  type="text" class="form-control" name="trailer"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Language
                                                            </label>
                                                            <div class="col-sm-8">
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
                                                            <div class="col-sm-8">
                                                                <input required  type="file" class="form-control" name="path" >
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="center">
                                                                <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-upload"></i> Add Movie</button>
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
