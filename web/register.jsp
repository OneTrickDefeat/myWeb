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
    
    <body>
        <div class="container">
        <div>
            <p>Please fill in your details to register</p>
            <form action="TheServlet" method="post">
                <table>
                    <tr>
                        <td> email  : </td><td> <input name="email" required size=20 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" required size=50 type="password" /> </td> 
                    </tr>
                    <tr>
                        <td> First Name  : </td><td> <input name="firstName" required size=20 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Last Name  : </td><td> <input name="lastName" size=40 type="text" /> </td> 
                    </tr>
                    
                </table>
                <input type="submit" value="Register" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="register" />
            </form>
        </div>
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>
