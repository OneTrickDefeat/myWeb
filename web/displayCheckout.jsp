<%-- 
    Document   : displayCheckout
    Created on : 04-Apr-2019, 12:16:48
    Author     : D00197085
--%>

<%@page import="java.math.RoundingMode"%>
<%@page import="Business.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Business.ProductCart"%>
<%@page import="DAO.ProductDao"%>
<%@page import="DAO.ProductCartDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "header.jsp" %>

    <%@ include file = "nav4.jsp" %>  

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

            <h3>Your Items</h3>
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
                            total = (total + sub);
//                            formatter.setRoundingMode(RoundingMode.UP);
//                            String t = formatter.format(total);
//                            total = Double.parseDouble(t);
                        %>

                    </tr>
                </tbody>


                <%
                        // Close the loop
                        idForContinue = product.getCatId();
                    }

                %>
                <tfoot>

                    <tr>

                        <td colspan="1" class="hidden-xs"><strong>Total</strong></td>
                        <td class="hidden-xs text-center"><strong><%=(formatter.format(total))%></strong></td>
                    </tr>
                </tfoot>
            </table><br>

            <h3>Your Delivery Information</h3>
            <div class="container">
                <form action="TheServlet" id="TheServlet" method="post">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%=loggedInUser.getFirstName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%=loggedInUser.getLastName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="houseNo">House Number</label>
                        <input type="text" class="form-control" name="houseNo" value="<%=loggedInUserAddress.getHouseNo()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="streetLine1">Street Line 1</label>
                        <input type="text" class="form-control" name="streetLine1" value="<%=loggedInUserAddress.getStreetLine1()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="streetLine2">Street Line 2</label>
                        <input type="text" class="form-control" name="streetLine2" value="<%=loggedInUserAddress.getStreetLine2()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="town">Town</label>
                        <input type="text" class="form-control" name="town" value="<%=loggedInUserAddress.getTown()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="county">County</label>
                        <input type="text" class="form-control" name="county" value="<%=loggedInUserAddress.getCounty()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" name="country" value="<%=loggedInUserAddress.getCountry()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="firstName">Post Code</label>
                        <input type="text" class="form-control" name="postCode" value="<%=loggedInUserAddress.getPostcode()%>" required>
                    </div>

                    <!--nonce will populate this value representing the customer's payment method -->
                    <input type="hidden" id="nonce" name="nonce" value="">
                    <input type="hidden" id="total" name="total" value="<%=total%>">

                    <input type="hidden" name="action" value="completeTransaction">

                </form>


                <!-- this will drop in the options for payment , paypal or card-->
                <div id="dropin-container">

                </div>
                <div class="col-md-12 text-center">   
                    <button type="button" class="btn btn-success"  id="submit_button">Complete transaction</button>
                </div>

            </div>



        </div>
    </body>


    <script>
//      Reference to submit button
        var button1 = document.querySelector('#submit_button');
        

//        initiates the drop in flow
        braintree.dropin.create({
//            gives authorisation to access the braintree API using the client token generated earlier in the head.jsp
            authorization: '<%= (String) session.getAttribute("clientToken")%>',
            container: '#dropin-container',

            //STYLING
                        card: {
                    overrides: {
                      styles: {
                        input: {
                          color: 'blue',
                          'font-size': '18px'
                        },
                        '.number': {
                          'font-family': 'monospace',
                           placeholder: 'Card Number'
                        },
                        '.invalid': {
                          color: 'red'
                        },
                        '.expirationDate': {
                            color:'blue',
                            'font-size': '18px'
                        }
                      }
                    }
                  },
            //      
//            set up paypal
            paypal: {
                //can be checkout(single payment) of vault(storing the card and customer info)
                flow: 'checkout',
                amount:<%=total%>,
                currency: 'EUR',
                //commit true - pay straight away, false would finish the payment later
                commit: true,
                buttonStyle: {
                    colour: 'blue',
                    shape: 'rect',
                    size: 'medium',
                    label: 'pay'
                }

            },

            //present security question challenege from bank provider
            threeDSecure: {
                amount:<%=total%>

            }

        }, function (createErr, instance) {
            // if any errors  occur , log them to the console
            if (createErr) {
                console.error(createErr);
                //location.reload(true);
                return;
            }

//            button listens for click 
            button1.addEventListener('click', function (e) {
                //stops button from submitting form 
                e.preventDefault();
//                submit payment information and get a payload representing this 
                instance.requestPaymentMethod(function (requestPaymentMethodErr, payload) {
                    if (requestPaymentMethodErr) {
//                        print any errors to the console
                        console.error(requestPaymentMethodErr);
                        return;
                    }

//                    if bank has accepted transaction 
                    if (payload.liabilityShifted || payload.type !== "CreditCard") {
//                        get nonce from the payload and populate into form 
                        document.getElementById("nonce").value = payload.nonce;
                        // console.log(payload.nonce);
                        //populate total into the form field before making the request 
                        document.getElementById("total").value = <%=total%>;

//                        submit the form 
                        document.getElementById("TheServlet").submit();

                        document.getElementById("submit_button").disabled = true;

                    } else {
                        alert("Payment failed, please try again");
                    }

                });
            });
        });



    </script>
    <%@include file="chatwindow.jsp" %>
    <br><br>
    <div class="container">
        <%@ include file = "footer.jsp" %>
    </div>
</html>
