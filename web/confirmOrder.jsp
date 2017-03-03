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
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-user-secret"></i> Confirm Order : </h1>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="col-md-12 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="div-header">
                                                    <p class="jumbotron" style="color: black">
                                                        Order id : ${order.getOrder_id()}
                                                        <br>Name : ${order.getUser(order.getUser_id()).getFname()} ${order.getUser(order.getUser_id()).getLname()}
                                                        <br>Address : ${order.getUser(order.getUser_id()).getAddressline1()} ${order.getUser(order.getUser_id()).getAddressline2()} ${order.getUser(order.getUser_id()).getCity()} ${order.getUser(order.getUser_id()).getState()} ${order.getUser(order.getUser_id()).getZip()}</td>
                                                        <br>Phone : ${order.getUser(order.getUser_id()).getPhone()}
                                                        <br>Email : ${order.getUser(order.getUser_id()).getEmail()}
                                                        <br>Status : ${order.getStatus()}
                                                    </p>
                                                    <table class="table table-hover">
                                                        <tr class="text-primary">
                                                            <td>Quantity</td>
                                                            <td>Cover Picture</td>
                                                            <td>Name</td>
                                                            <td>Price</td>
                                                        </tr>
                                                        <c:if test="${listmovie != null}">
                                                            <c:forEach var="list" items="${listmovie}">
                                                                <tr>
                                                                    <td>
                                                                        ${list.qty}
                                                                    </td>
                                                                    <td><img src="${list.getMovie(list).getPoster()}" class="fiximg" style="height: 70px"></td>
                                                                    <td>${list.getMovie(list).name}</td>
                                                                    <td>
                                                                        ${list.getMovie(list).getMovieCurrencyFormat()}
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            <td></td>
                                                            <td></td>
                                                            <td><b>Total</b></td>
                                                            <td>${order.getAmount()}</td>
                                                        </c:if>
                                                    </table>
                                                </div><br>
                                                <div class="col-md-12">
                                                    <form class="form-horizontal" role="form" action="confirmOrder" method="post">
                                                        <div class="form-group">
                                                            <div class="col-sm-6">
                                                                ${msg=="null"?"":msg}
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Amount
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <div class="ui-widget">
                                                                    <input type="number"  step="0.01" name="amount" class="form-control"  required >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Bank
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input type="text" id="rname" class="form-control" name="bank"  required/>
                                                            </div>
                                                        </div><div class="form-group">
                                                            <label class="col-sm-3 control-label">
                                                                Date Transfer
                                                            </label>
                                                            <div class="col-sm-6">
                                                                <input type="datetime-local" id="rname" class="form-control" name="datetransfer"  required/>
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="order_id"  hidden value="${order.order_id}"/>
                                                        <hr>
                                                        <div class="form-group">
                                                            <div class="center">
                                                                <button type="submit" id="subedit" class="btn btn-success btn-lg"><i class="fa fa-pencil"></i> Confirm </button>
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
