<%-- 
    Document   : viewProduct
    Created on : 25-Feb-2019, 23:24:41
    Author     : Tom
--%>

<%@page import="Business.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "header.jsp" %>

    <body>


        <div class="container">


            <%                // Get the number of the customre that was clicked on
                String idVal = request.getParameter("prodId");
                // Confirm that a number was supplied
                if (idVal != null) {
                    // Parse the number from text into an int (remember, all request parameters are Strings)
                    int prodNum = 0;
                    try {
                        prodNum = Integer.parseInt(idVal);
                    } // Provide code to handle what happens if there wasn't a number passed in
                    catch (NumberFormatException e) {
                        // Set an error message and redirect to the error page
                        String errorMessage = "Text was supplied for the product number (instead of a number)";
                        session.setAttribute("errorMessage", errorMessage);
                        response.sendRedirect("error.jsp");
                    }

                    // If everything is appropriate, 
                    // get the specific Customer from the database and display it
                    ProductDao prodDao = new ProductDao("furniturestore");
                    Product b = prodDao.findProductByProductId(prodNum);

                    if (b != null) {

            %>  
            <form action="TheServlet" method="post">
                <!-- set up table structure -->
                <table class="table table-bordered">
                    <thead>
                        <tr>

                            <th>name</th>
                            <th>colour</th>
                            <th>price</th>

                        </tr>
                    </thead>
                    <!-- Create a row for this customer -->
                    <tbody>
                        <tr>
                            <!-- Create a cell for each component of this customer's information and fill it with 
                                 data in this customer's object -->
                            <td><%=b.getName()%></td>
                            <td><%=b.getColour()%></td>
                            <td><%=b.getPrice()%></td>

                        </tr>
                    </tbody>
                </table>
                <%if (loggedInUser != null) {%>
                <input type="submit" value="Loan a book" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="isbn" value="<%=b.getProductId()%>" />  
                <input type="hidden" name ="action" value="loanBook" />  
                <% }%>
            </form>


            /////////////////////////////////////////////////////////////////////

            <div class="container">
                <div class="card">
                    <div class="container-fliud">
                        <div class="wrapper row">
                            <div class="preview col-md-6">

                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img src="img/<%=b.getImage()%>" /></div>
                                    
                                </div>
                                
                            </div>
                            <div class="details col-md-6">
                                <h3 class="product-title"><%=b.getName()%></h3>
                                
                                <p class="product-description"><%=b.getDescription()%></p>
                                <h4 class="price">current price: <span><%=b.getPrice()%></span></h4>
                               
                                <div class="action">
                                    <button class="add-to-cart btn btn-default" type="button">add to cart</button>
                                    <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%
            } else {
            %>
            <div><b>No product was found with that number.</b></div>
            <%
                    }
                    // Close the if statement
                } else {
                    // Set an error message and redirect to the error page
                    String errorMessage = "No Product id number was supplied";
                    session.setAttribute("errorMessage", errorMessage);
                    response.sendRedirect("error.jsp");
                }
            %>
        </div>







    </body>
</html>
