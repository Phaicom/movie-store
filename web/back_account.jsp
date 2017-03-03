<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Shop</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-archive"></i> Bank ID : </h1>
                                </div>
                                <hr>
                                <div class="col-md-12">
                                    <img src="http://sundoome.com/wp-content/uploads/2014/06/file_id_112723.jpg" class="img-responsive" style='margin: 0 auto;'>
                                </div>
                                <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">
                                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
