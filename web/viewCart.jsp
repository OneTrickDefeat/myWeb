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
            <%                ProductCartDao pCartDao = new ProductCartDao("furniturestore");
                ProductDao productDao = new ProductDao("furniturestore");
                int cartID = loggedInUserCart.getCartID();
                //getting list of products in user cart
                ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);
            %>
            <h1>Cart</h1>






            <div class="container">
                <table id="cart" class="table table-hover table-condensed">
                    <thead>
                        <tr>
                            <th style="width:50%">Product</th>
                            <th style="width:10%">Price</th>
                            <th style="width:8%">Quantity</th>
                            <th style="width:22%" class="text-center">Subtotal</th>
                            <th style="width:10%"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  //going through the list of user product cart                      
                            for (ProductCart p : cartProducts) {

                                //creating a new object of product, using productID
                                //details from cartProduct ArrayList
                                Product product = productDao.findProductByProductId(p.getProductId());
                        %>
                        <tr>
                            <td data-th="Product">
                                <div class="row">
                                    <div class="col-sm-2 hidden-xs"><img src="img/<%=product.getImage()%>" alt="..." class="img-responsive"/></div>
                                    <div class="col-sm-10">
                                        <h4 class="nomargin"><%=product.getName()%></h4>

                                    </div>
                                </div>
                            </td>
                            <td data-th="Price">€<%=product.getPrice()%></td>
                            <td data-th="Quantity">
                                <input type="number" class="form-control text-center" value="<%=p.getQuantity()%>">
                            </td>
                            <td data-th="Subtotal" class="text-center"><%=product.getPrice() * p.getQuantity()%></td>
                            <td class="actions" data-th="">
                                <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
                            </td>
                        </tr>
                    </tbody>
                    <%
                            // Close the loop
                        }
                    %>
                    <tfoot>
                        <tr class="visible-xs">
                            <td class="text-center"><strong>Total 1.99</strong></td>
                        </tr>
                        <tr>
                            <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                            <td colspan="2" class="hidden-xs"></td>
                            <td class="hidden-xs text-center"><strong>Need help getting total here</strong></td>
                            <td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>









        </div>
    </body>
</html>
