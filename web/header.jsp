<%-- 
    Document   : header
    Created on : 30-Nov-2018, 14:23:34
    Author     : Tom
--%>
<%@page import="Business.Cart"%>
<%@include file="internationalisationHeader.jsp" %>
<%@page import="Business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container">
       
            <%                User loggedInUser = (User) session.getAttribute("loggedInUser");
                Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");

                if (loggedInUser != null) {
            %>
          <!--  
            <div>
                <h2><%=dataBundle.getString("logInForm_greeting")%>  <%=loggedInUser.getUsername()%></h2>
            </div>
          -->
            <%
            } else {
            %>     
            <form action="TheServlet" method="post">
                <table>
                    <tr>
                        <td> <%=dataBundle.getString("logInForm_username")%>  : </td><td> <input name="email" required size=20 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> <%=dataBundle.getString("logInForm_password")%>  : </td><td> <input name="password" required size=50 type="password" /> </td> 
                    </tr>
                </table>
                <input type="submit" value=<%=dataBundle.getString("logInForm_button")%> />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="login" />
            </form>


            <div>
                <p>
                    <%=dataBundle.getString("logInForm_notRegMsg")%><br/>
                    <a href="register.jsp"><%=dataBundle.getString("logInForm_notRegLink")%></a>
                </p>
            </div>

            <%
                }
            %>


       

    </div>
</html>
