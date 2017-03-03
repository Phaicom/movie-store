<%@page import="jsp.model.User_order"%>
<%@page import="jsp.model.Movie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jsp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Administration Panel</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <link rel="stylesheet" href="js/chartist-js-develop/dist/chartist.min.css">
        <script src="js/chartist-js-develop/dist/chartist.min.js"></script>

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
                                                    <li role="presentation" class="active">
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
                                                    <h2><i class="fa fa-line-chart"></i> Static : </h2>
                                                </div>
                                                <br>
                                                <h3 class="text-muted center" style="font-weight: bold;color: whitesmoke"><i class="fa fa-star"></i> Movie Store: monthly active users </h3>



                                                <div class="col-md-12  jumbotron ct-chart" >
                                                </div>
                                                <div class="col-lg-4 col-sm-12 statbox " >
                                                    <%
                                                        List<Movie> lm = Movie.findByName("");
                                                        int total_movie = lm.size();
                                                        request.setAttribute("total_movie", total_movie);
                                                    %>
                                                    <h4 style="font-weight: bold">total movie</h4>
                                                    <h4>${total_movie}</h4>
                                                </div>
                                                <div class="col-lg-4 col-sm-12 statbox " >
                                                    <%
                                                        double total_amount = User_order.getProfit();
                                                        request.setAttribute("total_amount", total_amount);
                                                    %>
                                                    <h4 style="font-weight: bold">total profit</h4>
                                                    <h4>${total_amount} Bath</h4>
                                                </div>
                                                <div class="col-lg-4 col-sm-12 statbox " >
                                                    <%
                                                        List<User> lu = User.findByName("");
                                                        int total_user = lu.size();
                                                        request.setAttribute("total_user", total_user);
                                                    %>
                                                    <h4 style="font-weight: bold">total user</h4>
                                                    <h4>${total_user}</h4>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        User u = new User();
                                        int total = 0;
                                        Calendar now = Calendar.getInstance();
                                        int month = now.get(Calendar.MONTH) + 1;
                                        int year = now.get(Calendar.YEAR) - 543;
                                        request.setAttribute("u", u);
                                    %>
                                    <script>
                                                var d = new Date();
                                                var month = new Array();
                                                month[0] = "January";
                                                month[1] = "February";
                                                month[2] = "March"; month[3] = "April";
                                                month[4] = "May";
                                                month[5] = "June";
                                                month[6] = "July";
                                                month[7] = "Aug ust";
                                                month[8] = "September";
                                                month[9] = "October";
                                                month[10] = "November";
                                                month[11] = "December";
                                                var n = month[d.getMonth()];
                                                new Chartist.Line('.ct-chart', {
                                                labels: [month[d.getMonth() - 5], month[d.getMonth() - 4], month[d.getMonth() - 3], month[d.getMonth() - 2], month[d.getMonth() - 1], month[d.getMonth()]],
                                                        series: [

                                                                [<c:forEach begin="0" end="5" varStatus="loop">
                                            ${u.totalUserByMonth(6)[loop.count-1]} <c:if test="${loop.count!=6}">,</c:if>
                                        </c:forEach>
                                                                ]
                                                        ]
                                                }, {
                                                low: 0,
                                                        showArea: true
                                                });
                                    </script>
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
