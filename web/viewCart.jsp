<%-- 
    Document   : viewCart
    Created on : 04-Mar-2019, 23:02:56
    Author     : Audrius
--%>

<%@page import="Business.ProductCart"%>
<%@page import="Business.Product"%>
<%@page import="DAO.ProductCartDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "header.jsp" %>

    <body>

        <div class="container">
            <%
            
            try {
                
                
                ProductCartDao pCartDao = new ProductCartDao("furniturestore");
                int cartID = loggedInUserCart.getCartID();
                ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);
                
            }
            
            %>
            <h1>Cart</h1>
            
              <table id="allProducts">
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
                        for (Product p : cartProducts) {
                    %>
                    <!-- Create a row for this customer -->
                    <tr>
                        <!-- Create a cell for each component of this customer's information and fill it with 
                             data in this customer's object -->
                        <td><%=p.getImage()%></a></td>
                        <td><%=p.getName()%></a></td>
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
            
        </div>


            
    </body>
</html>
