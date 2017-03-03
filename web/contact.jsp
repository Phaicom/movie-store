<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | Contact</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-envelope fa-fw"></i> Contact Us</h2>
                        </div>
                        <hr>
                        <form action="addContact" method="post">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="form-group">
                                        ${msg}
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Your Name *" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Your Email *" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="tel" class="form-control" placeholder="Your Phone *" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" placeholder="Your Message *" name="message" required></textarea>
                                    </div>
                                    <hr>
                                    <div class="col-lg-12 text-center">
                                        <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-paper-plane"></i> Send</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
