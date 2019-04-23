<%-- 
    Document   : addCategory
    Created on : 08-Feb-2019, 18:34:33
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>
    
    <body>
        <div class="container">
        <div>
            <p>Enter the name of the category</p>
            <form action="TheServlet" method="post">
                <table>
                    <tr>
                        <td> Category Name  : </td><td> <input name="categoryName" required size=15 type="text" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="Add category" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="addCategory" />
            </form>
        </div>
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>