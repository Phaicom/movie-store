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
        <script src="js/sweetalert2.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="js/sweetalert2.css">
        <script>
            $(document).ready(function () {
                $("#updateorder").click(function () {
                    swal({title: 'Are you sure?',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes',
                        closeOnConfirm: false},
                    function () {
                        swal('Submit!', 'Order(s) is now complete.', 'success'
                                );
                        setTimeout(function () {
                            $('#submitform').click();
                        }, 2000);
                    });
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
                                    <div class="col-lg-12">
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
                                                    <li role="presentation" class="active">
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
                                        </div><div class="col-md-9 div-blog2">
                                            <div class="col-md-12 div-blog">
                                                <div class="div-header">
                                                    <h2><i class="fa fa-check-square-o"></i> Order List : </h2>
                                                </div>
                                                <br>
                                                <form action="orderList" method="post">
                                                    <table class="table table-hover">
                                                        <tr class="text-primary center">
                                                            <td>Select</td>
                                                            <td>Order Id</td>
                                                            <td>Name</td>
                                                            <td>Address</td>
                                                            <td>Price</td>
                                                            <td>Status</td>
                                                            <td>View</td>
                                                            <td>Delete</td>
                                                        </tr>
                                                        <c:choose>
                                                            <c:when test="${Cart.getCount() != 0}">
                                                                <c:forEach var="order" items="${listorder}">
                                                                    <tr>
                                                                        <td class="center">
                                                                            <input type="checkbox" name="updateitem" value="${order.getOrder_id()}">
                                                                        </td>
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
                                                                            <a href="deleteOrder?order_id=${order.getOrder_id()}" class="btn btn-danger"> Delete</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="jumbotron col-lg-12"><h3>No Movie in Cart!!</h3></div>
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </table>
                                                    <hr>
                                                    <div class="center">
                                                        <ul class="pagination">
                                                            <c:if test="${currentPage != 1}">
                                                                <li>
                                                                    <a href="orderList?page=${currentPage - 1}">Previous</a>
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
                                                                            <a href="orderList?page=${i}">${i}</a>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            <c:if test="${currentPage lt noOfPages}">
                                                                <li>
                                                                    <a href="orderList?page=${currentPage + 1}">Next</a>
                                                                </li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                    <div align="center">
                                                        <button type="button" id="updateorder" class="btn btn-danger btn-lg"><i class="fa fa-upload"></i> Update</button>
                                                        <input type="submit" id="submitform" hidden>
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
