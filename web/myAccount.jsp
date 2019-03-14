<%-- 
    Document   : myAccount
    Created on : 02-Dec-2018, 15:53:16
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
            <%            if (loggedInUser != null) {
            %>
            <p><%=dataBundle.getString("myAcc_username")%> : <%=loggedInUser.getUsername()%></p>
            <p><%=dataBundle.getString("myAcc_firstName")%> : <%=loggedInUser.getFirstName()%></p>
            <p><%=dataBundle.getString("myAcc_secondName")%> : <%=loggedInUser.getLastName()%></p>


            <a href="updateAccount.jsp"><%=dataBundle.getString("myAcc_updateLink")%></a><br>
            <a href="updatePassword.jsp">Update Password</a>





            <%
                //end of what happens if theyre logged in
            } else {
            %>



            <h1>Log in to see user profile</h1>


            <%
                }
            %>
        </div>
    </body>
</html>
