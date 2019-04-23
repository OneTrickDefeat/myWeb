<%-- 
    Document   : error
    Created on : 30-Nov-2018, 15:57:09
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "head4.jsp" %>

    <body>
        <br><br>
    <center>
        <h1>Something went wrong</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("errorMessage");
            // Cast it to a String so we can use it
            String error = (String) msg;
            if (error != null) {
                // Display the message
%>

        <div><h3> <%=error%> </h3></div>
        <%
            }
            // We have finished with the results of this action
            // so now we can remove the value from the session
            session.removeAttribute("errorMessage");
            // This makes sure that old error messages 
            // don't mistakenly get printed out later
%> 
    </center>
    <br><br>
    <!-- Include a footer so that there is always a link back to the home page! -->
    <%@ include file = "footer.jsp" %>
</body>
</html>
