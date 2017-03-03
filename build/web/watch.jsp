<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Watch</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12 div-blog">
                    <h1>Watch</h1><hr>
                    <div class="col-md-12 div-blog2 jumbotron" style="color: black">
                        <h1>${movie.getName()}</h1>
                        <div align="center" class="embed-responsive embed-responsive-16by9">
                            <video preload controls  class="embed-responsive-item">
                                <source src="movies/${path}" type="video/mp4">
                                <p>Your browser does not support H.264/MP4.</p>
                            </video>
                        </div><br>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="background-color: white;height: 50px" >
                            <input type="button" value="< back >" class="btn btn-default btn-lg" onClick="window.history.back();">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
</html>
