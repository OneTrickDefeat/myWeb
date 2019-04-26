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
                <a href="index.jsp"><img src="img/newlogo.png" alt="logo"/><br><br></a>
                <p id="copyright">© 2019 Furniture Depot, All Rights Reserved</p>
            </div>
            <div class="col-md-4 footer-nav animated fadeInUp">
                <h4> <%=dataBundle.getString("footer_menu")%>  </h4>
                <div class="col-md-6">
                    <ul class="pages">
                        <li><a href="displayItems.jsp?cID=1&name=Bedroom"> <%=dataBundle.getString("navbar_bedroom")%></a>  </li>
                        <li><a href="displayItems.jsp?cID=2&name=Living Room"><%=dataBundle.getString("navbar_living_room")%></a></li>
                        <li><a href="displayItems.jsp?cID=3&name=Home Office"><%=dataBundle.getString("navbar_home_office")%></a></li>
                        <li><a href="displayItems.jsp?cID=4&name=Game And Bar"><%=dataBundle.getString("navbar_game&bar")%></a></li>
                        <li><a href="displayItems.jsp?cID=5&name=Kitchen And Dining"><%=dataBundle.getString("navbar_kitchen&dining")%></a></li>
                        <li><a href="displayItems.jsp?cID=6&name=Home Entertainment"><%=dataBundle.getString("navbar_home_entertainment")%></a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="list">
                        <li><a href="aboutUs.jsp"><%=dataBundle.getString("footer_aboutUs")%></a></li>
                        <li><a href="contact.jsp"><%=dataBundle.getString("footer_Contact")%></a></li>
                        <li><a href="termsandconditions.jsp"><%=dataBundle.getString("footer_Terms")%></a></li>
                        <li><a href="#"><%=dataBundle.getString("footer_privacy")%></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 footer-social animated fadeInDown">
                <h4> <%=dataBundle.getString("footer_followUs")%>  </h4>
                <ul>
                    <li><a target="_blank" href="https://www.facebook.com/Onestopfurnitureshop246/">Facebook</a></li>
                    <li><a target="_blank" href="https://twitter.com/furnituredepot2">Twitter</a></li>
                    <li><a target="_blank" href="https://www.instagram.com/explore/tags/furniture/?hl=en">Instagram</a></li>
                    <li><a target="_blank" href="https://www.pinterest.ie/homegoods/furniture/">Pinterest</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-ns animated fadeInRight">
                <h4> <%=dataBundle.getString("footer_newsletter")%> </h4>
                <p><%=dataBundle.getString("footer_newsletter_signup")%></p>

                <form action="TheServlet" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Enter your email" name="addEmail2">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-envelope"></span></button>
                        </span>
                        <input type="hidden" name ="action" value="addNewsletter" />

                    </div>
                    <%
                        Object msg2 = session.getAttribute("newsletter");
                        String success = (String) msg2;
                        if (success != null) {
                    %>

                    <div> <%=success%> </div>
                    <%
                        }
                        session.removeAttribute("newsletter");
                    %> 
                </form>

            </div>
        </div>
    </footer>


</div>
