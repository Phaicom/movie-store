<%@page import="jsp.model.Movie"%>
<%@page import="jsp.model.review"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Review Detail</title>
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
                                    <h1><i class="fa fa-commenting"></i> Review Detail : </h1>
                                </div>
                                <hr>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-3">
                                        <a href="#" class="img-link">
                                            <div class="img-hover">
                                                <div class="img-hover-content">
                                                    <p>${r.getName()}</p>
                                                    <i class="fa fa-inbox fa-3x"></i>
                                                </div>
                                            </div>

                                            <img alt="title" src="${imgr}" style="height:360px" class="thumbnail"/>
                                        </a>
                                    </div>        
                                    <div class="col-md-9">

                                        <p>
                                        <h3>
                                            ${r.getName()}
                                        </h3><br>
                                        <input type="number" class="rating" name="rating" value="${r.rating}" data-size="xs" data-rtl="true" disabled/>
                                        </p>
                                        <p>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${r.getDescription()}
                                        </p>
                                        <p>
                                            <%
                                                review r = (review)request.getAttribute("r");
                                                int movie_id = r.getMovie_id();
                                                Movie m  = Movie.findById(movie_id);
                                                request.setAttribute("s", m);
                                            %>
                                            <a href="Cart?movie_id=${s.getMovie_id()}" class="btn btn-success btn-lg ${user.isBuy(user.getUser_id(),s.getMovie_id())?"hidden":""}" ${Cart.isOrder(s.getMovie_id())?"disabled":""} ><i class="fa fa-cart-plus"></i> Buy</a>
                                            <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">
                                        </p>
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
