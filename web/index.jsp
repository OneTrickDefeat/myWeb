<%-- 
    Document   : index
    Created on : 30-Nov-2018, 14:20:53
    Author     : Tom
--%>

<%@page import="Business.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@ include file = "header.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "head.jsp" %>


    <body>



        <div class="container">
            <!-- jumbotron for sliding images -->


            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/amberbed.jpg" alt="Los Angeles" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="img/colebed.jpg" alt="Chicago" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="img/malmdesk.jpg" alt="New york" style="width:100%;">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!-- end of jumbotron --> 

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
                            <h5>$24.99</h5>
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
                            <h5>$24.99</h5>
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
                            <h5>$24.99</h5>
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
                            <h5>$24.99</h5>
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

    <%@ include file = "footer.jsp" %>


</html>
