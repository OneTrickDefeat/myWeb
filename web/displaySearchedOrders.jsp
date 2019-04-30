<%-- 
    Document   : displaySearchedOrders
    Created on : 28-Apr-2019, 18:46:37
    Author     : Tom
--%>


<%@page import="Business.Orders"%>
<%@page import="DAO.OrdersDao"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Business.OrderProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Business.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>
    <!--include header temp deleted... -->

    <body>
        <div class="container">
            <%ArrayList<OrderProduct> foundOrders = (ArrayList<OrderProduct>) session.getAttribute("foundOrders");
                ProductDao productDao = new ProductDao("furniturestore");
                Product prod = new Product();
                OrdersDao ordDao = new OrdersDao("furniturestore");
                Orders ord = new Orders();

                if (foundOrders != null) {
                    //deal with displaying
            %>

            <div class="container">
                <%int orderCount = foundOrders.size();%>

                <hgroup class="mb20">
                    <h1><strong class="text-danger lead2">Search Results</strong></h1>
                    <h2 class="lead"><strong class="text-danger"> <%=orderCount%> </strong> results were found based on   <strong class="text-danger">Your transaction Id</strong></h2>								
                </hgroup>


             

                    <div class="container">          
                        <table class="table table-hover">

                            <thead>
                                <tr>
                                    <th scope="col">Transaction Id</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Product Id</th>
                                    <th scope="col">Colour</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Date</th>
                                </tr>
                            </thead>
                            <%                // Loop to print out all of the rows
                                for (OrderProduct p : foundOrders) {
                                    prod = productDao.findProductByProductId(p.getproductId());
                                    ord =  ordDao.findOrdersByTransactionId(p.getTransactionId());
                            %>
                            <tbody>
                                <tr>
                                    <th scope="row"><%=p.getTransactionId()%></th>
                                    <th scope="row"><%=prod.getName()%></th>
                                    <th scope="row"><%=prod.getProductId()%></th>
                                    <th scope="row"><%=prod.getColour()%></th>
                                    <th scope="row"><%=p.getQuantity()%></th>
                                    <th scope="row"><%=ord.getEmail()%></th>
                                    <th scope="row"><%=ord.getDate()%></th>
                                </tr>

                            </tbody>
                            <%
                                    // Close the loop
                                }
                            %>
                        </table>
                    </div>


               
            </div>


            <% } else {%>
            <h2>Sorry , no transactions matched your search</h2>
            <%}%>

        </div>
        <%@include file="chatwindow.jsp" %>
        <br><br>
        <div class="container">
            <%@ include file = "footer.jsp" %>
        </div>









    </body>
</html>

