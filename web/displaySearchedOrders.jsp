<%-- 
    Document   : displaySearchedOrders
    Created on : 28-Apr-2019, 18:46:37
    Author     : Tom
--%>


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
            
                if (foundOrders != null) {
                    //deal with displaying
            %>

            <div class="container">
                <%int orderCount = foundOrders.size();%>

                <hgroup class="mb20">
                    <h1><strong class="text-danger lead2">Search Results</strong></h1>
                    <h2 class="lead"><strong class="text-danger"> <%=orderCount%> </strong> orders were found based on   <strong class="text-danger">Your transaction Id</strong></h2>								
                </hgroup>


                <section class="col-xs-12 col-sm-6 col-md-12">
                    <%                // Loop to print out all of the rows
                        for (OrderProduct p : foundOrders) {
                    %>

                    <table class="table">
                        <thead>
                            <tr>

                                <th scope="col">Transaction Id</th>
                                <th scope="col">Product Id</th>
                                <th scope="col">Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><%=p.getTransactionId()%></th>
                                <th scope="row"><%=(%></th>
                                <th scope="row"><%=p.getQuantity()%></th>

                            </tr>

                        </tbody>
                    </table>

                    <%
                            // Close the loop
                        }
                        // We have finished with the list of found products 
                        // so now we can remove the value from the session
                        //session.removeAttribute("foundProducts");
                    %>
                </section>
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

