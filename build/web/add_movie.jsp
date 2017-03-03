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
                <div class="div-blog">
                    <form class="form-horizontal" role="form" action="saveMovie" method="post" enctype="multipart/form-data">
                        <h1>Add Movie</h1><hr>
                        <div class="form-group">
                            <div class="col-sm-6 .col-sm-offset-3">
                                ${msg}
                            </div>
                        </div>
                        <!--search picture-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Search Picture Image
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input  type="text"  class="form-control"  name="searchpic" id="searchpic"><br>
                                <a target="_blank" id="search_picture_button" class="btn btn-default btn-lg button"> Search </a>
                            </div>
                        </div>
                        <!--search video-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Search Trailer Video
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input  type="text"  class="form-control"  name="searchtrailer" id="searchtrailer"><br>
                                <a target="_blank" id="search_trailer_button" class="btn btn-default btn-lg button"> Search </a>
                            </div>
                        </div>
                        <!--form-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Name
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input type="text" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Description
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <textarea required  class="form-control" name="description" style="height: 300px"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Category
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
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
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="number" class="form-control" name="price" step="0.01"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Released Year
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="text"  class="form-control" name="releasedyear">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Totaltime
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="text"  class="form-control" name="totaltime">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Poster link
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="text"  class="form-control" name="poster">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Trailer Embed
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="text" class="form-control" name="trailer"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Language
                            </label>
                            <div class="col-sm-6 .col-sm-offset-3">
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
                            <div class="col-sm-6 .col-sm-offset-3">
                                <input required  type="file" class="form-control" name="path" >
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="center">
                                <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">
                                <input type="submit" class="btn btn-success btn-lg" value="Add Movie">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
</body>
</html>
