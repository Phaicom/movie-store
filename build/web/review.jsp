<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Review</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-commenting"></i> Review</h1>
                        </div>
                        <hr>
                        <div class="row">
                            <c:forEach items="${show_review}" var="sr">
                                <div class="col-md-3">
                                    <a href="showReviewDetail?id=${sr.getReview_id()}" class="img-link">
                                        <div class="img-hover">
                                            <div class="img-hover-content">
                                                <p>View</p>
                                                <i class="fa fa-inbox fa-3x"></i>
                                                <input type="number" class="rating" name="rating" value="${sr.rating}" data-size="xs" data-rtl="false" disabled/>
                                            </div>
                                        </div>
                                        <img src="${sr.getImage(sr.getMovie_id())}" class="img-responsive" alt="${sr.getName()}" style="height: 400px">
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <hr>

                        <c:forEach items="${reviewList}" var="review">
                            <div class="row">
                                <form action="showReviewDetail" method="post">
                                    <div class="col-md-10 col-md-offset-1 div-blog2">
                                        <h3><strong>${review.getName()}</strong></h3>
                                        <h4 style="color:#212121">${review.getUsername(review.getUser_id())} , 
                                            <input type="number" class="rating" name="rating" value="${review.rating}" data-size="xs" data-rtl="false" disabled/>
                                            , ${review.getPostdate()}</h4>
                                        <input type="text" value="${review.getReview_id()}" name="id" hidden>
                                        <input type="submit" class="btn btn-default" value="Read more...">
                                    </div>
                                </form>
                            </div><br><hr>
                        </c:forEach>
                        <div class="center">
                            <ul class="pagination">
                                <c:if test="${currentPage != 1}">
                                    <li>
                                        <a href="showReview?page=${currentPage - 1}">Previous</a>
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
                                                <a href="showReview?page=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${currentPage lt noOfPages}">
                                    <li>
                                        <a href="showReview?page=${currentPage + 1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
