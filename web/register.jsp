<%-- 
    Document   : register
    Created on : 30-Nov-2018, 15:32:51
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>

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
                    <input name="lastName" size=40 type="text"  placeholder="Last Name"/> 
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
    <%@ include file = "footer.jsp" %>
</body>
</html>
