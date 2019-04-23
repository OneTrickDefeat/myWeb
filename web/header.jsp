<%-- 
    Document   : header
    Created on : 30-Nov-2018, 14:23:34
    Author     : Tom
--%>
<%@page import="Business.UserAddress"%>
<%@page import="Business.Address"%>
<%@page import="Business.Cart"%>

<%@page import="Business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container">

        <%                User loggedInUser = (User) session.getAttribute("loggedInUser");
            Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");
            Address loggedInUserAddress = (Address) session.getAttribute("loggedInUserAddress");

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
        <center>
            <div class="con">
                <h3 id="sign">Login</h3>
                <form action="TheServlet" method="post">
                    <table>
                        <tr>
                        <input name="email" required size=20 type="text" placeholder="<%=dataBundle.getString("logInForm_username")%>"/>  
                        </tr>
                        <tr>
                        <input name="password" required size=50 type="password" placeholder="<%=dataBundle.getString("logInForm_password")%>"/>  
                        </tr>
                    </table>

                    <input id="button" type="submit" value=<%=dataBundle.getString("logInForm_button")%> />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="login" />
                </form>


                <label id="signup"><%=dataBundle.getString("logInForm_notRegMsg")%> &nbsp;<a id="account" href="register.jsp"><%=dataBundle.getString("logInForm_notRegLink")%></a></label>

            </div>

            <%
                }
            %>


        </center>

    </div>
</html>
