<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Cart</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-shopping-cart"></i> Cart : </h1>
                        </div>
                        <hr>
                        <div class="div-blog2">
                            <table class="table table-hover">
                                <tr class="text-primary">
                                    <td>Quantity</td>
                                    <td>Cover Picture</td>
                                    <td>Name</td>
                                    <td>Price</td>
                                    <td>Delete</td>
                                </tr>
                                <c:choose>
                                    <c:when test="${Cart.getCount() != 0}">
                                        <c:forEach var="list" items="${Cart.list}">
                                            <tr>
                                                <td>
                                                    ${list.qty}
                                                </td>
                                                <td><img src="${list.movie.poster}" class="fiximg" style="height: 70px"></td>
                                                <td>${list.movie.name}</td>
                                                <td>
                                                    ${list.movie.getMovieCurrencyFormat()}
                                                </td>
                                                <td>
                                                    <form action="Cart" method="post">
                                                        <input type="hidden" name="movie_id" value="${list.getMovie_id()}"> 
                                                        <input type="hidden" name="quantity" value="0">
                                                        <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="jumbotron alert alert-danger"><h3>No Movie in Cart!!</h3></div>
                                    </c:otherwise> 
                                </c:choose>

                                <td></td>
                                <td></td>
                                <td><b>Total</b></td>
                                <td>${Cart.getCartCurrencyFormat()}</td>
                                <td></td>
                            </table>
                            <hr>
                            <div class="center">
                                <a href="showShop" type="button" class="btn btn-primary btn-lg button"><i class="fa fa-arrow-left"></i> Continue Shopping</a>
                                <a type="button" class="btn btn-success button btn-lg checkout" ${Cart==null||Cart.getCount()==0?"disabled":""}><i class="fa fa-check"></i> Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>