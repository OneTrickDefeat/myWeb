<%-- 
    Document   : contact
    Created on : 28-Feb-2019, 22:29:05
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
        <h1 id="aboutus">Contact Us</h1>
        <hr class="style2">

        <section class="contact-page-sec">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-map-marked"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>Address</h2>
                                    <span>30-32 Parkgate Street </span> 
                                    <span>Dublin 8, County Dublin</span> 
                                    <span>Ireland</span> 
                                </div>
                            </div>            
                        </div>          
                    </div>          
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>E-mail & Telephone</h2>
                                    <span>+353 (021)4273471</span> 
                                    <span>furnitureDepot@gmail.com</span> 
                                    <span>businessInquiries@yahoo.com</span>
                                </div>
                            </div>            
                        </div>                
                    </div>                
                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-item">
                                <div class="contact-info-icon">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="contact-info-text">
                                    <h2>Businnes Hours</h2>
                                    <span>Mon - Thu  9:00 am - 4.00 pm</span>
                                    <span>Fridays  10.00 pm - 5.00 pm</span>
                                    <span>Weekend  Closed</span>
                                </div>
                            </div>            
                        </div>          
                    </div>          
                </div><br>
                <h1>Our Location</h1><br>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d869304.312522868!2d-122.380256325996!3d37.960316569044245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x203a1f2173c26e02!2sFurniture+Depot!5e0!3m2!1sen!2sus!4v1556056601738!5m2!1sen!2sus" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>               
            </div>
        </section>
    </body>
    <%@ include file = "footer.jsp" %>
</html>
