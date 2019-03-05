<%-- 
    Document   : viewCart
    Created on : 04-Mar-2019, 23:02:56
    Author     : Audrius
--%>

<%@page import="DAO.ProductDao"%>
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
                ProductCartDao pCartDao = new ProductCartDao("furniturestore");
                ProductDao productDao = new ProductDao("furniturestore");
                int cartID = loggedInUserCart.getCartID();
                //getting list of products in user cart
                ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);
            %>
            <h1>Cart</h1>
            <table id="allProducts">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%  //going through the list of user product cart                      
                        for (ProductCart p : cartProducts) {
                            
                           //creating a new object of product, using productID
                           //details from cartProduct ArrayList
                           Product product = productDao.findProductByProductId(p.getProductId());
                    %>
                    <!-- Create a row for this customer -->
                    <tr>
                        <!-- Create a cell for each component of this product information and fill it with 
                             data in this product object -->
                        <td><%=product.getName()%></td>
                        <td><%=product.getPrice()%></td>
                        <td><%=p.getQuantity()%></td>
                        <!-- Line to generate a tailored link that will go to the view cart page and pass it the id of the customer to be selected from the database -->
                    </tr>
                    <%
                        // Close the loop
                        }
                    %>
                </tbody>
            </table> 
        </div>
    </body>
</html>
