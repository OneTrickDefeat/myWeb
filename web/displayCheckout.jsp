<%-- 
    Document   : displayCheckout
    Created on : 04-Apr-2019, 12:16:48
    Author     : D00197085
--%>

<%@page import="Business.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Business.ProductCart"%>
<%@page import="DAO.ProductDao"%>
<%@page import="DAO.ProductCartDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>  
    
    <body>
        <%
            ProductCartDao pCartDao = new ProductCartDao("furniturestore");
            ProductDao productDao = new ProductDao("furniturestore");
            int cartID = loggedInUserCart.getCartID();
            //getting list of products in user cart
            ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);

            NumberFormat formatter = new DecimalFormat("#0.00");
            double total = 0;
        %>
        <div class="container">
            <div class="row">
                <form action="TheServlet" id="TheServlet" method="post">

                    <input type="text" name="firstName" value="<%=loggedInUser.getFirstName()%>">
                    <input type="text" name="lastName" value="<%=loggedInUser.getLastName()%>">
                    <input type="text" name="houseNo" value="<%=loggedInUserAddress.getHouseNo()%>">
                    <input type="text" name="streetLine1" value="<%=loggedInUserAddress.getStreetLine1()%>">
                    <input type="text" name="streetLine2" value="<%=loggedInUserAddress.getStreetLine2()%>">
                    <input type="text" name="town" value="<%=loggedInUserAddress.getTown()%>">
                    <input type="text" name="county" value="<%=loggedInUserAddress.getCounty()%>">
                    <input type="text" name="country" value="<%=loggedInUserAddress.getCountry()%>">
                    <input type="text" name="postCode" value="<%=loggedInUserAddress.getPostcode()%>">
                    <input type="hidden" id="nonce" name="nonce" value="">
                    <input type="hidden" id="paymentMethod" name="paymentMethod" value="">
                    <input type="hidden" id="total" name="total" value="<%=total%>">
                    <input type="hidden" name="action" value="completeTransaction">

                </form>
                    
                    <button id="submit_button">"Complete transaction"</button>

                <div id="dropin-container">

                </div>
                <!--                            <div class="col-sm-10">
                                                <h3>USER</h3>
                                                <h4 class="nomargin"><%=loggedInUser.getFirstName()%></h4>
                                                <h4 class="nomargin"><%=loggedInUser.getLastName()%></h4>
                                                <h3>ADDRESS</h3>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getHouseNo()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getStreetLine1()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getStreetLine2()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getTown()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getCounty()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getCountry()%></h4>
                                                <h4 class="nomargin"><%=loggedInUserAddress.getPostcode()%></h4>
                
                                            </div>-->
            </div>
            <h3>PRODUCTS</h3>
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

                    <%  
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
                        <td data-th="Price" id = "Price">€<%=product.getPrice()%></td>


                        <%
                            double sub = product.getPrice() * p.getQuantity();
                        %>
                        <td data-th="Subtotal" class="text-center"><%=sub%></td>
                        <td data-th="Subtotal" class="text-center"><%=p.getQuantity()%></td>
                        <%
                            total = total + sub;
                        %>

                        <td class="actions" data-th="">

                            <!--  update  button 
                            <form action="TheServlet" method="post">
                                <input type="number" name="productQuantity" class="form-control text-center" value="//p.getQuantity()%>">
                                <input type="hidden" name="productID" value="//p.getProductId()%>">
                                <input type="hidden" name="action" value="updateCartQuantity">
                                <input class="btn btn-info btn-sm" type="submit" value="Update Quantity" > 
                            </form>

                            <!--  remove button 
                            <form action="TheServlet" method="post">
                                <input type="hidden" name="productID" value="//p.getProductId()%>">
                                <input type="hidden" name="action" value="removeFromCart">
                                <input class="btn btn-danger btn-sm" type="submit" value="Remove from Cart" > 
                            </form>-->
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
                        <td><a href="displayCheckout.jsp?totalPrice=<%=total%>" class="btn btn-success btn-block">Pay <i class="fa fa-angle-right"></i></a></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </body>
   
    
    <script>
        var button1 = document.querySelector('#submit_button');
        
        braintree.dropin.create({
        authorization: '<%= (String) session.getAttribute("clientToken")%>',
                container: '#dropin-container',
                
                //STYLING
                //            card: {
                //        overrides: {
                //          styles: {
                //            input: {
                //              color: 'blue',
                //              'font-size': '18px'
                //            },
                //            '.number': {
                //              'font-family': 'monospace',
                //               placeholder: 'Card Number'
                //            },
                //            '.invalid': {
                //              color: 'red'
                //            },
                //            '.expirationDate': {
                //                color:'blue',
                //                'font-size': '18px'
                //            }
                //          }
                //        }
                //      },

        paypal: {
        flow:'checkout',
                amount:<%=total%>,
                currency: 'EUR',
                commit:true,
                buttonStyle:{
                colour:'blue',
                        shape:'rect',
                        size:'medium',
                        label:'pay'
                }

        },
                
        threeDSecure: {
        amount:<%=total%>

        }

        }, function(createErr, instance){
    
                if (createErr){
                    console.error(createErr);
                    //location.reload(true);
                    return;
                }

            button1.addEventListener('click', function (e){
                e.preventDefault();
                instance.requestPaymentMethod(function (requestPaymentMethodErr, payload){
                if (requestPaymentMethodErr){
                    console.error(requestPaymentMethodErr)
                    return;
                }
                
                
                if (payload.liabilityShifted || payload.type !== 'CreditCard'){

                    document.getElementById("nonce").value = payload.nonce;
                    console.log(payload.nonce);
                    document.getElementById("paymentMethod").value = payload.type;
                    document.getElementById("total").value= <%=total%>;
                    if(!document.getElementById("nonce").value === "")
                    {
                        //must enter card details properly
                    }
                    else
                    {
                        document.getElementById("TheServlet").submit();
                        document.getElementById("submit_button").disabled = true;

                    }
                
                }
        else{
            dropinInstance.clearSelectedPaymentMethod();
        }




                });


               
                });
                
               
                });
                
                

    </script>
</html>
