<%-- 
    Document   : index
    Created on : 30-Nov-2018, 14:20:53
    Author     : Tom
--%>

<%@page import="Business.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <%@ include file = "nav.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "header.jsp" %>



    <body>
        <div class="container">
            <%            if (loggedInUser != null) {
            %>


            <h1><%=dataBundle.getString("index_loggedInMsg")%></h1>
            <a href="myAccount.jsp"><%=dataBundle.getString("index_accountMsg")%></a>
            <br>
            <a href="TheServlet?action=logout"><%=dataBundle.getString("index_LogOutMsg")%></a>

            <%
                if (loggedInUser.isAdmin()) {

            %>

            <h2>Admin functions</h2>
            <br>
            <a href="addCategory.jsp"><%=dataBundle.getString("admin_addCategory")%></a>
            <br>
            <a href="deleteCategory.jsp"><%=dataBundle.getString("admin_deleteCategory")%></a>
            <br>
            <a href="addProduct.jsp"><%=dataBundle.getString("admin_addProduct")%></a>
            <br>
            <a href="updateProduct.jsp"><%=dataBundle.getString("admin_updateProduct")%></a>

            <%
                }
                Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");
                if(loggedInUserCart != null) {
            %>
            <h4>Cart does exist</h4>
            <% }%>

            <%
                //end of what happens if theyre logged in
            } else {
            %>


            <h1><%=dataBundle.getString("index_LogInCheckMsg")%></h1>



            <%
                }
            %>
        </div>
    </body>

    <%@ include file = "footer.jsp" %>


</html>
