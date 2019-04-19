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
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    <!--include header temp deleted... -->

    <body>
        <div class="container">
            <%ArrayList<Product> foundProducts = (ArrayList<Product>) session.getAttribute("foundProducts");
                if (foundProducts != null) {
                    //deal with displaying
            %>
            
            <div class="container">
                <%int prodCount = foundProducts.size();%>

                <hgroup class="mb20">
                    <h1><strong class="text-danger lead2">Search Results</strong></h1>
                    <h2 class="lead"><strong class="text-danger"> <%=prodCount%> </strong> results were found based on   <strong class="text-danger">Your Search</strong></h2>								
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
                            <p id="descrip"><%=p.getDescription()%></p>						
                            <span class="plus"><a href="viewProduct.jsp?prodId=<%=p.getProductId()%>" title="Lorem ipsum"><i class="glyphicon glyphicon-chevron-right"></i></a></span>
                        </div>
                        <span class="clearfix borda"></span>
                    </article>
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
            <h2>Sorry , no products matched your search</h2>
            <%}%>

        </div>
            <%@include file="chatwindow.jsp" %>
        <%@ include file = "footer.jsp" %>









    </body>
</html>
