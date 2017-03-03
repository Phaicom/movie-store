<%@page import="jsp.model.Movie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="bootstrap/font-awesome/css/font-awesome.min.css"/>
<link rel="stylesheet" href="bootstrap/css/theme.css"/>
<link href="js/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
<!--jqury-->
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="js/star-rating.min.js" type="text/javascript"></script>
<%
    List<Movie> lm = Movie.findByName("");
    request.setAttribute("lm", lm);
%>
<script>
    $(function () {
        var availableTags = [
    <c:forEach items="${lm}" var="lm">
            "${lm.getName()}",
    </c:forEach>
        ];

        $("#tags").autocomplete({
            source: function (request, response) {
                var results = $.ui.autocomplete.filter(availableTags, request.term);

                response(results.slice(0, 5));
            }, //
            select: function (event, ui) {
                doSearch(ui.item.label, ui.item.city);
            }
        });
    });
    function doSearch(term, location) {
        window.location.href = 'showMovieDetail?movie_name=' + term;
    }
</script>
<script src="js/sweetalert2.min.js"></script> 
<link rel="stylesheet" type="text/css" href="js/sweetalert2.css">
<script>
    $(document).ready(function () {
        $(".checkout").click(function () {
            swal({title: 'Are you sure?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes!',
                closeOnConfirm: false},
            function () {
                swal('Complete!', 'Your Cart has been submit.', 'success'
                        );
                setTimeout(function () {
                    window.location.href = 'addOrder';
                }, 2000);
            });
        });
    });
</script>
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">

        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button><a class="navbar-brand" href="index.jsp">Movie Store</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="index.jsp">Home</a>
                </li>
                <li>
                    <a href="about.jsp">About</a>
                </li>
                <li>
                    <a href="showReview">Review</a>
                </li>
                <li>
                    <a href="showShop">Shop</a>
                </li>
            </ul>
            <!--search-->
            <form class="navbar-form navbar-left" role="search" action="search">
                <div id="custom-search-input">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control" placeholder="Search" id="tags" name="movie_name"/>
                        <input type="text"  id="tags" name="role" hidden value=""/>
                        <input type="text"  id="tags" name="type" hidden value=""/>
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-search fa-inverse"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="contact.jsp"><i class="fa fa-envelope fa-fw"></i> Contact</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-users fa-fw"></i> ${user.getUsername()==null?"My Account":user.getUsername()}<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <c:choose>
                            <c:when test="${user==null}">
                                <li>
                                    <a href="login.jsp"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                                </li>
                                <li>
                                    <a href="register.jsp"><i class="fa fa-user-plus fa-fw"></i> Register</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="userPanel"><i class="fa fa-user fa-fw"></i> Profile</a>
                                </li>
                                <c:if test="${user.getRole()==1}">
                                <li>
                                    <a href="admin_panel.jsp"><i class="fa fa-user-secret fa-fw"></i> Admin Panel</a>
                                </li>
                                </c:if>
                                <c:if test="${user.getRole()==0}">
                                <li>
                                    <a href="myMovie"><i class="fa fa-film fa-fw"></i> My Movie</a>
                                </li>
                                <li>
                                    <a href="orderList?myorder="><i class="fa fa-shopping-cart fa-fw"></i> My Order</a>
                                </li>
                                <li>
                                    <a href="wishList"><i class="fa fa-heart fa-fw"></i> Wish list</a>
                                </li>
                                </c:if>
                                <li>
                                    <a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <%--<c:set var="count" value="${Cart}" />--%>
                    <c:if test="${user!=null}">
                        <a href="#cart"  data-toggle="modal"><i class="fa fa-shopping-cart fa-fw"></i> Cart ( ${Cart.getCount()!=null?Cart.getCount():"0"} )</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="cart">
    <div class="modal-content col-lg-6 col-lg-offset-3">
        <div class="container">
            <div class="row">
                <div class="modal-body center col-lg-7" style="color: black">
                    <h1>Cart</h1>
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
                                                <input type="submit"  class="btn btn-danger" value="Delete">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="jumbotron col-lg-12"><h3>No Movie in Cart!!</h3></div>
                            </c:otherwise> 
                        </c:choose>

                        <td></td>
                        <td></td>
                        <td><b>Total</b></td>
                        <td>${Cart.getCartCurrencyFormat()}</td>
                        <td></td>
                    </table>

                    <hr>
                    <a href="cart.jsp" type="button" class="btn btn-primary button"><i class="fa fa-shopping-cart"></i> Cart</a>
                    <a type="button" class="btn btn-success button checkout" ${Cart==null||Cart.getCount()==0?"disabled":""}><i class="fa fa-check"></i> Checkout</a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                </div>
            </div>
        </div>
    </div>
</div>