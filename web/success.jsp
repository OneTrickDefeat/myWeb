<%-- 
    Document   : error
    Created on : 30-Nov-2018, 15:57:09
    Author     : Tom
--%>

<%@page import="Business.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Business.OrderProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.braintreegateway.Transaction"%>
<%@page import="com.braintreegateway.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "nav4.jsp" %>
    <%@ include file = "head.jsp" %>

    <body>
        <div class="container">
        <%
            
            List<OrderProduct> currentOrder = (List) session.getAttribute("currentOrder");
            
            if(currentOrder != null){
                ProductDao pDao = new ProductDao("furniturestore");
                Product currentProduct = new Product();
        %>

        <div class="container">

                <hgroup class="mb20">
                    <h1><strong class="text-danger lead2">Current Order</strong></h1>
                    <h2 class="lead"><strong class="text-danger"> <%=currentOrder.size()%> </strong> product/products were ordered</h2>								
                </hgroup>


                <section class="col-xs-12 col-sm-6 col-md-12">
                    <%                // Loop to print out all of the rows
                        for (OrderProduct op : currentOrder) {
                    %>

                    <article class="search-result row">
                        <div class="col-xs-12 col-sm-12 col-md-3">
                            <%currentProduct = pDao.findProductByProductId(op.getproductId());
                            %>
                            <a href="viewProduct.jsp?prodId=<%=op.getproductId()%>" title="<%=currentProduct.getName()%>" class="thumbnail"><img src="img/<%=currentProduct.getImage()%>" alt="<%=currentProduct.getName()%>" /></a>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-2">
                            <ul class="meta-search">
                                <li><a href="viewProduct.jsp?prodId=<%=op.getproductId()%>"><i class="glyphicon glyphicon-info-sign"></i> <span><%=currentProduct.getName()%></span></li>
                                <li><a href="viewProduct.jsp?prodId=<%=op.getproductId()%>"><i class="glyphicon glyphicon-list-alt"></i> <span><%=op.getQuantity()%></span></li>
                                <li><a href="viewProduct.jsp?prodId=<%=op.getproductId()%>"><i class="glyphicon glyphicon-eur"></i> <span><%=currentProduct.getPrice()%></span></li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                            <h3><a href="viewProduct.jsp?prodId=<%=op.getproductId()%>" title=""><%=currentProduct.getName()%></a></h3>
                            <p id="descrip"><%=currentProduct.getDescription()%></p>						
                            <span class="plus"><a href="viewProduct.jsp?prodId=<%=op.getproductId()%>" title="Lorem ipsum"><i class="glyphicon glyphicon-chevron-right"></i></a></span>
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
</body>
</html>
