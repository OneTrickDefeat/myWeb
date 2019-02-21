<%-- 
    Document   : displaySearchedProducts
    Created on : 05-Feb-2019, 20:45:57
    Author     : Audrius
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Business.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "header.jsp" %>
    
    <body>
        <div class="container">
            <h1 id="allbookstitle">Searched Products</h1>
            <%                ArrayList<Product> foundProducts = (ArrayList<Product>) session.getAttribute("foundProducts");
                if (foundProducts != null) {
                    //deal with displaying
            %>
            <table id="allbooks">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Left in stock</th>
                    </tr>
                </thead>
                <tbody>
                    <%                // Loop to print out all of the rows
                        for (Product p : foundProducts) {
                    %>
                    <!-- Create a row for this customer -->
                    <tr>
                        <!-- Create a cell for each component of this customer's information and fill it with 
                             data in this customer's object -->
                        <td><a href="viewBook.jsp?bookNum=<%=p.getImage()%>"><%=p.getName()%></a></td>
                        <td><%=p.getPrice()%></td>
                        <td><%=p.getStockQuantity()%></td>
                        <!-- Line to generate a tailored link that will go to the view Customer page and pass it the id of the customer to be selected from the database -->
                    </tr>
                    <%
                            // Close the loop
                        }
                        // We have finished with the list of found books 
                        // so now we can remove the value from the session
                        session.removeAttribute("foundBooks");
                    %>
                </tbody>
            </table>
            <% } else {%>
            No products was found.
            <%}%>
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>
