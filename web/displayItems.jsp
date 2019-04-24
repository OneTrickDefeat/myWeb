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
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>
    

    <body>
        <%  Integer cID = 1;
            try {
                
            cID = Integer.parseInt(request.getParameter("cID"));
            //String name = request.getParameter("name");

            } catch(NumberFormatException c){
                cID = 1;
            }
            ProductDao catDao2 = new ProductDao("furniturestore");
            CategoryDao categoryDao = new CategoryDao("furniturestore");
            List<Product> prods = catDao2.findProductsByCategoryId(cID);
            String categoryName = categoryDao.findCategoryNameByCategoryID(cID); 
            //Product p = catDao.findProductsByCategoryId(cID);

            if (prods != null) {

        %>
        <div class="container">
            <%int prodCount = prods.size();%>
            <%String name = request.getParameter("name");%>
            <center><h1 id="catTitle"><%=categoryName%></h1></center>
            <hr class="style">
            
            <hgroup class="mb20">
                <h2 class="lead"><strong class="text-danger"> <%=prodCount%> </strong> results were found</h2>								
            </hgroup>


            <section class="col-xs-12 col-sm-6 col-md-12">
                <%                // Loop to print out all of the rows
                    for (Product p : prods) {
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
                    session.removeAttribute("foundProducts");
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