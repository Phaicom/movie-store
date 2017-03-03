<%@page import="jsp.model.confirm_order"%>
<%@page import="jsp.model.Movie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Order Detail</title>
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
                        text: 'You will not be able to recover this Movie!',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes!',
                        closeOnConfirm: false},
                    function () {
                        swal('Deleted!', 'Your file has been deleted.', 'success'
                                );
                        setTimeout(function () {
                            $('#submitform').click();
                        }, 2000);
                    });
                });

                $('#updateitem').prop('checked', 'checked');
            });
        </script>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-header">
                                    <h1><i class="fa fa-info-circle"></i> Order Detail : </h1>
                                </div>
                                <hr>
                                <div class="jumbotron" style="color: black">
                                    Order id : ${order.getOrder_id()}
                                    <br>Name : ${order.getUser(order.getUser_id()).getFname()} ${order.getUser(order.getUser_id()).getLname()}
                                    <br>Address : ${order.getUser(order.getUser_id()).getAddressline1()} ${order.getUser(order.getUser_id()).getAddressline2()} ${order.getUser(order.getUser_id()).getCity()} ${order.getUser(order.getUser_id()).getState()} ${order.getUser(order.getUser_id()).getZip()}</td>
                                    <br>Phone : ${order.getUser(order.getUser_id()).getPhone()}
                                    <br>Email : ${order.getUser(order.getUser_id()).getEmail()}
                                    <br>Status : ${order.getStatus()}

                                    <hr>
                                    <!--confirm-->
                                    <c:if test="${confirm!=null}">
                                        <!--<div class="col-lg-12 " >-->
                                            <p>
                                            <h3 style="font-weight: bold">Confirm</h3>
                                            Amount : ${confirm.amount}<br>
                                            Bank : ${confirm.bank}<br>
                                            Date Transfer : ${confirm.datetransfer}<br>
                                            </p>
                                        <!--</div>-->
                                    </c:if>
                                    <!--end confirm-->
                                </div>
                                <table class="table table-hover">
                                    <tr class="text-primary">
                                        <td>Quantity</td>
                                        <td>Cover Picture</td>
                                        <td>Name</td>
                                        <td>Price</td>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${listmovie != null}">
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
                                        </c:when>
                                        <c:otherwise>
                                            <h3><p class="jumbotron" style="color: orangered"> No Order!! </p><h3>
                                                </c:otherwise>
                                            </c:choose>
                                            </table>
                                            <form class="form-horizontal" role="form" action="orderList" method="post" >
                                                <input type="checkbox"  name="updateitem" id="updateitem" value="${order.getOrder_id()}" hidden>
                                                <input type="number" hidden value="${order.getOrder_id()}" name="detail">

                                                <hr>
                                                <div align="center">
                                                    <c:if test="${user.role==1}">
                                                        <input type="button" id="updateorder" class="btn btn-danger btn-lg" value="Update" ${order.getConfirm_no()==1?"disabled":""}>
                                                    </c:if>
                                                    <input type="submit" id="submitform" hidden>
                                                    <!--                                                <input type="button" class="btn btn-default btn-lg" value="Back" onClick="location.href = 'orderList'">-->
                                                    <input type="button" class="btn btn-success btn-lg" value="Back" onClick="window.history.back();">

                                                </div>
                                            </form>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            <jsp:include page="include/footer.jsp"/>
                                            </body>
                                            </html>
