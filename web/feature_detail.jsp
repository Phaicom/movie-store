<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Feature Detail</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="row" style="background-color: whitesmoke;padding:20px">
                            <div class="col-md-10">
                                <h2  style="color: black">Feature Detail</h2>
                                <p style="color: black">
                                    ${mf.getMovie(mf.getMovie_id()).getName()}
                                </p>
                            </div>
                        </div>
                        <div class="row" style="background-color: white">
                            <div class="col-md-12">
                                <img alt="title" src="${mf.getPic()}"  />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
