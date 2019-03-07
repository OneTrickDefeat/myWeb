<%-- 
    Document   : footer
    Created on : 30-Nov-2018, 15:33:51
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">


    <!----------- Footer ------------>
    <footer class="footer-bs">
        <div class="row">
            <div class="col-md-3 footer-brand animated fadeInLeft">
                <h2 id="logoFooter">Furniture Depot</h2>
                <a href="index.jsp"><img src="img/logofooter.png" alt="logo"/><br><br></a>
                <p id="copyright">© 2019 Furniture Depot, All Rights Reserved</p>
            </div>
            <div class="col-md-4 footer-nav animated fadeInUp">
                <h4>Menu</h4>
                <div class="col-md-6">
                    <ul class="pages">
                        <li><a href="displayItems.jsp?cID=1&name=Bedroom"> Bedroom</a>  </li>
                        <li><a href="displayItems.jsp?cID=2&name=Living Room">Living Room</a></li>
                        <li><a href="displayItems.jsp?cID=3&name=Home Office">Home Office</a></li>
                        <li><a href="displayItems.jsp?cID=4&name=Game And Bar">Game & Bar</a></li>
                        <li><a href="displayItems.jsp?cID=5&name=Kitchen And Dining">Kitchen & Dining</a></li>
                        <li><a href="displayItems.jsp?cID=6&name=Home Entertainment">Home Entertainment</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="list">
                        <li><a href="aboutUs.jsp">About Us</a></li>
                        <li><a href="contact.jsp">Contacts</a></li>
                        <li><a href="#">Terms & Condition</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 footer-social animated fadeInDown">
                <h4>Follow Us</h4>
                <ul>
                    <li><a target="_blank" href="https://www.facebook.com/Onestopfurnitureshop246/">Facebook</a></li>
                    <li><a target="_blank" href="https://twitter.com/furnituredepot2">Twitter</a></li>
                    <li><a target="_blank" href="https://www.instagram.com/explore/tags/furniture/?hl=en">Instagram</a></li>
                    <li><a target="_blank" href="https://www.pinterest.ie/homegoods/furniture/">Pinterest</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-ns animated fadeInRight">
                <h4>Newsletter</h4>
                <p>Sign up for our newsletter</p>
                <p>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Enter your email">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-envelope"></span></button>
                    </span>
                </div><!-- /input-group -->
                </p>
            </div>
        </div>
    </footer>


</div>
