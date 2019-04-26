<%-- 
    Document   : error
    Created on : 30-Nov-2018, 15:57:09
    Author     : Tom
--%>

<%@page import="com.braintreegateway.Transaction"%>
<%@page import="com.braintreegateway.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "nav4.jsp" %>
    <%@ include file = "head.jsp" %>

    <body>
        <br><br>
    <center>
        <h1>Your Payment was Successful!</h1>
        <%
            // Get the error message variable out of the session
            String transId = (String) session.getAttribute("transactionID");
            String name = (String)session.getAttribute("name");

            if (transId != null) {
                // Display the message
        %>

        <div><h3>your transaction ID is :  <%=transId%> </h3></div>
        <h3>the name is : <%=name%> </h3>
        
        <% } else {

        %>
        <div><h3> there is no transaction id</h3></div>
        <% }
        %>
    </center>
    <br><br>
    <!-- Include a footer so that there is always a link back to the home page! -->
    <%@ include file = "footer.jsp" %>
</body>
</html>
