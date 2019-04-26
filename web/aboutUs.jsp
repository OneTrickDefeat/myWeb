<%-- 
    Document   : aboutUs
    Created on : 28-Feb-2019, 22:28:53
    Author     : Ahmed Khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>

    <body>

        <h1 id="aboutus">About Us</h1>
        <hr class="style2">
        <section class="about-section">
            <div class="container">
                <div class="row">
                    <div class="content-column col-lg-6 col-md-12 col-sm-12 order-2">
                        <div class="inner-column">
                            <div class="sec-title">
                                <span class="title">About Furniture Depot</span>
                                <h2>Manufacturing high quality <br>furniture in Ireland Since 2010</h2>
                            </div>
                            <div class="text">We are a team of 3 located in Ireland. our mission is to provide the best quality of all furniture to our customers at all cost. We are currently providing a range of furniture including Bedroom, Living Room, Home Office, Game & Bar, Kitchen & Dining, Home Entertainment, And in the future, we do plan to expand our furniture collection to include outdoor furniture and have have sub categories for each type.</div>
                            <ul class="list-style-one">
                                <li>Best Prices Guaranteed across all Furniture!!</li>
                                <li>Top Quality material when producing Furniture.</li>
                                <li>Free delivery on orders over €200!</li>
                            </ul>
                            For contact information, please use the below link.
                            <br><br>
                            <div class="btn-box">
                                <a href="contact.jsp" class="theme-btn btn-style-one">Contact Us</a>
                            </div>
                        </div>
                    </div>

                    <!-- Image Column -->
                    <div class="image-column col-lg-6 col-md-12 col-sm-12">
                        <div class="inner-column wow fadeInLeft">
                            <figure class="image-1"><a href="#" class="lightbox-image" data-fancybox="images"><img src="https://i.ibb.co/QP6Nmpf/image-1-about.jpg" alt=""></a></figure>
                            <figure class="image-2"><a href="#" class="lightbox-image" data-fancybox="images"><img src="http://uploads.kinibiz.com/2013/07/Furniture-manufacturers-generic.jpg" alt=""></a></figure>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

    <%@ include file = "footer.jsp" %>
</html>
