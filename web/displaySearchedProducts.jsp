<%-- 
    Document   : displaySearchedProducts
    Created on : 05-Feb-2019, 20:45:57
    Author     : Audrius
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Business.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "header.jsp" %>

    <body>
        <div class="container">
            <h1 id="allbookstitle">Searched Products</h1>
            <%                ArrayList<Product> foundProducts = (ArrayList<Product>) session.getAttribute("foundProducts");
                if (foundProducts != null) {
                    //deal with displaying
            %>
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
                        for (Product p : foundProducts) {
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

            <div class="container">
                <%int prodCount = foundProducts.size();%>

                <hgroup class="mb20">
                    <h1>Search Results</h1>
                    <h2 class="lead"><strong class="text-danger"> <%=prodCount%> </strong> results were found for  <strong class="text-danger">SEARCHTERM</strong></h2>								
                </hgroup>


                <section class="col-xs-12 col-sm-6 col-md-12">
                    <%                // Loop to print out all of the rows
                        for (Product p : foundProducts) {
                    %>


                    <article class="search-result row">
                        <div class="col-xs-12 col-sm-12 col-md-3">
                            <a href="viewProduct.jsp?prodId=<%=p.getProductId()%>" title="<%=p.getName()%>" class="thumbnail"><img src="img/<%=p.getImage()%>" alt="<%=p.getName()%>" /></a>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-2">
                            <ul class="meta-search">
                                <li><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>"><i class="glyphicon glyphicon-info-sign"></i> <span><%=p.getName()%></span></li>
                                <li><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>"><i class="glyphicon glyphicon-list-alt"></i> <span><%=p.getStockQuantity()%></span></li>
                                <li><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>"><i class="glyphicon glyphicon-eur"></i> <span><%=p.getPrice()%></span></li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                            <h3><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>" title=""><%=p.getName()%></a></h3>
                            <p><%=p.getDescription()%></p>						
                            <span class="plus"><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>" title="Lorem ipsum"><i class="glyphicon glyphicon-chevron-right"></i></a></span>
                        </div>
                        <span class="clearfix borda"></span>
                    </article>
                    <%
                            // Close the loop
                        }
                        // We have finished with the list of found products 
                        // so now we can remove the value from the session
                        session.removeAttribute("foundProducts");
                    %>
                </section>
            </div>


            <% } else {%>
            <h2>Sorry , no products matched your search</h2>
            <%}%>
           
        </div>
        <%@ include file = "footer.jsp" %>









    </body>
</html>
