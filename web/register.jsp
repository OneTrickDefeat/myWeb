<%-- 
    Document   : register
    Created on : 30-Nov-2018, 15:32:51
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>

    <body><br>
    <center>
        <div class="con">
            <h2 id="sign">Register</h2>
            <hr style="border: 1px solid lightgrey;"/>
            <form action="TheServlet" method="post">
                <table>
                    <tr>
                    <input name="email" required size=20 type="text" placeholder="Email"/> 
                    </tr>
                    <tr>
                    <input name="password" required size=50 type="password"  placeholder="Password"/> 
                    </tr>
                    <tr>
                    <input name="firstName" required size=20 type="text"  placeholder="First Name"/>
                    </tr>
                    <tr>
                    <input name="lastName" required size=40 type="text"  placeholder="Last Name"/> 
                    </tr>
                    <tr>
                    <input name="houseNo" required size=40 type="number" placeholder="House Number"/> 
                    </tr>
                    <tr>
                    <input name="streetLine1" required size=40 type="text"  placeholder="Address Line 1"/> 
                    </tr>
                    <tr>
                    <input name="streetLine2" required size=40 type="text"  placeholder="Address Line 2"/> 
                    </tr>
                    <tr>
                    <input name="town" required size=40 type="text"  placeholder="Town/City"/> 
                    </tr>
                    <tr>
                    <input name="county" required size=40 type="text"  placeholder="County"/> 
                    </tr>
                    <tr>
                    <input name="postCode" required size=40 type="text"  placeholder="Post Code"/> 
                    </tr>
                    <tr>
                    <input name="country" required size=40 type="text"  placeholder="Country"/> 
                    </tr>

                </table>
                <hr style="border: 1px solid lightgrey;"/>
                <button id="button" type="submit" value="Register">&nbsp; Register</button><br><br>
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="register" />

                <label id="signup">Already Registered? &nbsp;<a id="account" href="index.jsp">Login Here!</a></label>


            </form>
        </div><br><br><br>
    </center>

    <!-- Include a footer so that there is always a link back to the home page! -->
    <%@include file="chatwindow.jsp" %>
    <%@ include file = "footer.jsp" %>
</body>
</html>
