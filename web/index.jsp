<%-- 
    Document   : index
    Created on : 30-Nov-2018, 14:20:53
    Author     : Tom
--%>
<%@page import="Business.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>
    
    


    <body>



    <body>
        <div class="container">

            <div class="wrap-slide">
                <a href="#" class="bln" id="bln-left"><<</a>
                <a href="#" class="bln" id="bln-right">>></a>
                <ul class="slideshow">
                    <li class="current" ><img src="img/churchillbed.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/casseltonbed.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/kingstontable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/lavoietable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/nassautable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/palmspringstable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/robbiedining.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/sanctuaryHF.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/solanodesk.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/sorellaHF.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/twistdining.jpg" alt="" width="1000" height="600"/></li>
                </ul>
            </div><br><br><br>

            <script>
                var slideCount = $('.slideshow li').length;
                var slideWidth = $('.slideshow li').width();
                var slideHeight = $('.slideshow li').height();
                var slideULwidth = slideCount * slideWidth;

                $('.wrap-slide').css({width: slideWidth, height: slideHeight});
                $('.slideshow').css({width: slideULwidth, marginLeft: -slideWidth});
                $('.slideshow li:last-child').prependTo($('.slideshow'));

                function moveLeft() {
                    $('.slideshow').animate({
                        left: +slideWidth
                    }, 600, function () {
                        $('.slideshow li:last-child').prependTo('.slideshow');
                        $('.slideshow').css('left', '');
                    });
                }
                ;

                function moveRight() {
                    $('.slideshow').animate({
                        left: -slideWidth
                    }, 600, function () {
                        $('.slideshow li:first-child').appendTo('.slideshow');
                        $('.slideshow').css('left', '');
                    });
                }
                ;
                var idset = setInterval('moveRight()', 4000);
                $('#bln-left').click(function () {
                    clearInterval(idset);
                    moveLeft();
                    idset = setInterval('moveRight()', 4000);
                });
                $('#bln-right').click(function () {
                    clearInterval(idset);
                    moveRight();
                    idset = setInterval('moveRight()', 4000);
                });

            </script>


            <!-- special offers -->
            <div class="row">
               

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=7"><img class="card-img-top" src="img/kingstontable.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=7">Kingston Game Table</a>
                            </h4>
                            <h5>€931.00</h5>
                            <p class="card-text">The Kingston Game Set and Bar Stool </p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=9"><img class="card-img-top" src="img/lavoietable.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=9">3 in 1 Game Table</a>
                            </h4>
                            <h5>€1139.99</h5>
                            <p class="card-text">Lavoie Furniture Mitchell 3 in 1 Game Table</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=11"><img class="card-img-top" src="img/nassautable.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=11">Nassau Game Table</a>
                            </h4>
                            <h5>€599.99</h5>
                            <p class="card-text">The Nassau game set is distinguished and regal. </p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=12"><img class="card-img-top" src="img/palmspringstable.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=12">Palm Springs Game Table</a>
                            </h4>
                            <h5>€789.99</h5>
                            <p class="card-text">Add panche to your game room!</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=17"><img class="card-img-top" src="img/tynonsofa.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=17">Tynon Sofa</a>
                            </h4>
                            <h5>€999.99</h5>
                            <p class="card-text"> The Tynon sofabed is compact enough for any livingroom.</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="viewProduct.jsp?prodId=22"><img class="card-img-top" src="img/mickedesk.jpg" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="viewProduct.jsp?prodId=22">MICKE desk</a>
                            </h4>
                            <h5>€199.99</h5>
                            <p class="card-text">makes it easy to keep sockets and cables out of sight !</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>

            </div>

            <!-- end of special offers -->


            
        </div>
    </body>
    <%@include file="chatwindow.jsp" %>

    <%@ include file = "footer.jsp" %>


</html>
