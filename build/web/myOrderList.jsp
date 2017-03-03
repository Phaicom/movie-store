<%-- 
    Document   : order_list
    Created on : Nov 14, 2015, 2:33:40 AM
    Author     : Reawpai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Order list</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-user-md"></i> My Order Panel : </h1>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-lg-12" align="center">
                                        <div class="col-md-12 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="div-header">
                                                    <h2><i class="fa fa-check-square-o"></i> Order List : </h2>
                                                    <h4><a href="back_account.jsp">Bank Account</a></h4>
                                                </div>
                                                <br>
                                                <form action="orderList" method="post">
                                                    <table class="table table-hover">
                                                        <tr class="text-primary center">
                                                            <td>Order Id</td>
                                                            <td>Name</td>
                                                            <td>Address</td>
                                                            <td>Price</td>
                                                            <td>Status</td>
                                                            <td>View</td>
                                                            <td>Confirm</td>
                                                        </tr>
                                                                <c:forEach var="order" items="${listorder}">
                                                                    <tr>
                                                                        <td class="center">
                                                                            ${order.getOrder_id()}
                                                                        </td>
                                                                        <td>${order.getUser(order.getUser_id()).getFname()}</td>
                                                                        <td>${order.getUser(order.getUser_id()).getAddressline1()} ${order.getUser(order.getUser_id()).getAddressline2()} ${order.getUser(order.getUser_id()).getCity()} ${order.getUser(order.getUser_id()).getState()} ${order.getUser(order.getUser_id()).getZip()}</td>
                                                                        <td>
                                                                            ${order.getAmount()}
                                                                        </td>
                                                                        <td style="color: orangered">
                                                                            ${order.getStatus()}
                                                                        </td>
                                                                        <td class="center">
                                                                            <a href="showOrder?order_id=${order.getOrder_id()}" class="btn btn-primary"><i class="fa fa-search-plus"></i> View</a>
                                                                        </td>
                                                                        <td class="center">
                                                                            <a href="confirmOrder?order_id=${order.getOrder_id()}" class="btn btn-success" ${order.confirm_no == 1||order.confirm_no == 2?"disabled":""}> Confirm</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                    </table>
                                                    <hr>
                                                    <div class="center">
                                                        <ul class="pagination">
                                                            <c:if test="${currentPage != 1}">
                                                                <li>
                                                                    <a href="orderList?page=${currentPage - 1}&myorder=">Previous</a>
                                                                </li>
                                                            </c:if>
                                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                                <c:choose>
                                                                    <c:when test="${currentPage eq i}">
                                                                        <li>
                                                                            <a href="#" style="color: red">${i}</a>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li>
                                                                            <a href="orderList?page=${i}&myorder=">${i}</a>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            <c:if test="${currentPage lt noOfPages}">
                                                                <li>
                                                                    <a href="orderList?page=${currentPage + 1}&myorder=">Next</a>
                                                                </li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                    <div align="center">
                                                       <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">
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
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
