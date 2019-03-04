<%-- 
    Document   : viewCart
    Created on : 04-Mar-2019, 23:02:56
    Author     : Audrius
--%>

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
                
                int cartID = loggedInUserCart.getCartID();
                ProductCartDao pCartDao = new ProductCartDao("furniturestore");
                ArrayList<ProductCart> cartList = pCartDao.
            }
            
            %>
            <h1>Cart</h1>
            
             
            
        </div>


            <h1>Hello World!</h1>
    </body>
</html>
