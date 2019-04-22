<%-- 
    Document   : viewCart
    Created on : 04-Mar-2019, 23:02:56
    Author     : Audrius
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Business.ProductCart"%>
<%@page import="Business.Product"%>
<%@page import="DAO.ProductCartDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>


    <body>
        <div class="container">
            <%                ProductCartDao pCartDao = new ProductCartDao("furniturestore");
                ProductDao productDao = new ProductDao("furniturestore");
                int cartID = loggedInUserCart.getCartID();
                //getting list of products in user cart
                ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);

                NumberFormat formatter = new DecimalFormat("#0.00");
                
            %>
            <h1>Cart</h1>






            <div class="container">
                <table id="cart" class="table table-hover table-condensed">
                    <thead>
                        <tr>
                            <th style="width:50%">Product</th>
                            <th style="width:10%">Price</th>
                            <th style="width:22%" class="text-center">Subtotal</th>
                            <th style="width:8%">Quantity</th>

                            <th style="width:10%"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%  double total = 0;
                            int idForContinue = 0;

                            //going through the list of user product cart                      
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


                            <%
                                double sub = product.getPrice() * p.getQuantity();
                            %>
                            <td data-th="Subtotal" class="text-center"><%=sub%></td>
                            <%
                                total = total + sub;
                            %>

                            <td class="actions" data-th="">

                                <!--  update  button -->
                                <form action="TheServlet" method="post">
                                    <input type="number" name="productQuantity" class="form-control text-center" value="<%=p.getQuantity()%>">
                                    <input type="hidden" name="productID" value="<%=p.getProductId()%>">
                                    <input type="hidden" name="action" value="updateCartQuantity">
                                    <input class="btn btn-info btn-sm" type="submit" value="Update Quantity" > 
                                </form>

                                <!--  remove button -->
                                <form action="TheServlet" method="post">
                                    <input type="hidden" name="productID" value="<%=p.getProductId()%>">
                                    <input type="hidden" name="action" value="removeFromCart">
                                    <input class="btn btn-danger btn-sm" type="submit" value="Remove from Cart" > 
                                </form>
                            </td>

                        </tr>
                    </tbody>
                    <%
                            // Close the loop
                            idForContinue = product.getCatId();
                        }

                    %>
                    <tfoot>

                        <tr>
                            <td><a href="displayItems.jsp?cID=<%=idForContinue%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                            <td colspan="1" class="hidden-xs"><strong>Total</strong></td>
                            <td class="hidden-xs text-center"><strong><%=(formatter.format(total))%></strong></td>
                            <td><a href="displayCheckout.jsp" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
                        </tr>
                    </tfoot>
                </table>
            </div>









        </div>
    </body>
        <%@include file="chatwindow.jsp" %>
    <br><br>
    <div class="container">
        <%@ include file = "footer.jsp" %>
    </div>
</html>
