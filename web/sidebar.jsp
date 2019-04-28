<%-- 
    Document   : sidebar
    Created on : 13-Mar-2019, 00:53:00
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- start of sidebar --> 
        <div id="mySidebar" class="sidebar">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
            <a href="myAccount.jsp"><%=dataBundle.getString("index_accountMsg")%></a>
            <a href="viewCart.jsp"><%=dataBundle.getString("index_myCartMsg")%></a>
            
            <%
                if (loggedInUser.isAdmin()) {

            %>
            <hr>
            <a href="addCategory.jsp"><%=dataBundle.getString("admin_addCategory")%></a>
            <a href="deleteCategory.jsp"><%=dataBundle.getString("admin_deleteCategory")%></a>
            <a href="addProduct.jsp"><%=dataBundle.getString("admin_addProduct")%></a>
            <a href="updateProduct.jsp"><%=dataBundle.getString("admin_updateProduct")%></a>
            <a href="transactionSearch.jsp"><%=dataBundle.getString("admin_searchTransaction")%></a>
            <% }%>
            <a href="TheServlet?action=logout"><%=dataBundle.getString("index_LogOutMsg")%></a>

        </div>

        <div id="main">
            <button class="openbtn" onclick="openNav()">☰ User Functions</button>  

        </div>
        <!-- end of sidebar -->
</html>
