<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store | About</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script>
            var myCenter = new google.maps.LatLng(13.6496908, 100.4946603);
            var marker;

            function initialize()
            {
                var mapProp = {
                    center: myCenter,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                var marker = new google.maps.Marker({
                    position: myCenter,
                    animation: google.maps.Animation.BOUNCE
                });

                marker.setMap(map);
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <div class="container">
            <div class="col-md-12 div-back">
                <div class="col-md-12">
                    <div class="div-blog">
                        <div class="div-header">
                            <h1><i class="fa fa-info-circle"></i> Service : </h1>
                        </div><hr>
                        <div class="row text-center">
                            <div class="col-md-12">
                                <div class="col-md-4 div-hover">
                                    <span class="fa-stack fa-4x">
                                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                        <i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h4 class="service-heading">E-Commerce</h4>
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                                </div>
                                <div class="col-md-4 div-hover">
                                    <span class="fa-stack fa-4x">
                                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                        <i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h4 class="service-heading">Responsive Design</h4>
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                                </div>
                                <div class="col-md-4 div-hover">
                                    <span class="fa-stack fa-4x">
                                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                        <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h4 class="service-heading">Web Security</h4>
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div id="googleMap" style="width:auto;height:380px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
    </body>
</html>
