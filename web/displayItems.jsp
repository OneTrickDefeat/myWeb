<%-- 
    Document   : displayBedroomItems
    Created on : 27-Feb-2019, 20:58:06
    Author     : Ahmed Khan
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDao"%>
<%@page import="Business.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>

    <body>
        <%
            Integer cID = Integer.parseInt(request.getParameter("cID")) ;
        
            ProductDao catDao2 = new ProductDao("furniturestore");
            List<Product> prods = catDao2.findProductsByCategoryId(cID);
            //Product p = catDao.findProductsByCategoryId(cID);

            if (prods != null) {


        %>

        <table>



            <section class="col-xs-12 col-sm-6 col-md-12">
                <%                // Loop to print out all of the rows
                    for (Product pp : prods) {
                %>


                <article class="search-result row">
                    <div class="col-xs-12 col-sm-12 col-md-3">
                        <a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>" title="<%=pp.getName()%>" class="thumbnail"><img src="img/<%=pp.getImage()%>" alt="<%=pp.getName()%>" /></a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-2">
                        <ul class="meta-search">
                            <li><a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>"><i class="glyphicon glyphicon-info-sign"></i> <span><%=pp.getName()%></span></li>
                            <li><a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>"><i class="glyphicon glyphicon-list-alt"></i> <span><%=pp.getStockQuantity()%></span></li>
                            <li><a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>"><i class="glyphicon glyphicon-eur"></i> <span><%=pp.getPrice()%></span></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                        <h3><a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>" title=""><%=pp.getName()%></a></h3>
                        <p id="descrip"><%=pp.getDescription()%></p>				
                        <span class="plus"><a href="viewProduct.jsp?prodId=<%=pp.getProductId()%>" title="Lorem ipsum"><i class="glyphicon glyphicon-chevron-right"></i></a></span>
                    </div>
                    <span class="clearfix borda"></span>
                </article>
                <%
                    }

                %>
            </section>



            <% } else {%>
            <h2>Sorry , no products matched your search</h2>
            <%}%>

        </table>

    </body>
</html>