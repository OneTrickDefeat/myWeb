<%-- 
    Document   : updateProduct
    Created on : 14-Feb-2019, 12:54:29
    Author     : D00197085
--%>

<%@page import="java.util.List"%>
<%@page import="Business.Product"%>
<%@page import="DAO.ProductDao"%>
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

            } catch (NumberFormatException c) {
                cID = 1;
            }

            List<Product> foundProducts = (List<Product>) session.getAttribute("foundProducts");

            ProductDao catDao2 = new ProductDao("furniturestore");
            CategoryDao categoryDao = new CategoryDao("furniturestore");
            List<Product> prods = catDao2.findProductsByCategoryId(cID);
            String categoryName = "";
            if (foundProducts != null) {
                categoryName = categoryDao.findCategoryNameByCategoryID(foundProducts.get(1).getCatId());
            } else {
                categoryName = categoryDao.findCategoryNameByCategoryID(cID);
            }
        %>
        <div class="container">
            <form action="TheServlet" method="post">
                <div class="form-group">
                    <select class="col-md-12 text-center" name="categoryOption" onchange="this.form.submit()">
                        <%                        for (int i = 0; i < catList.size(); i++) {%>
                        <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                            }
                        %>

                    </select>
                </div>
                <input type="hidden" name="action" value="changeCategory"/>
            </form>
        </div>           
        <%if (foundProducts != null) {

        %>
        <div class="container">
            <%int prodCount = foundProducts.size();%>
            <%String name = request.getParameter("name");%>
            <center><h1 id="catTitle"><%=categoryName%></h1></center>
            <hr class="style">

            <hgroup class="mb20">
                <h2 class="lead"><strong class="text-danger"> <%=prodCount%> </strong> results were found</h2>								
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
                        <span class="plus"><a href="updateProduct.jsp?prodId=<%=p.getProductId()%>" title="Lorem ipsum"><i class="glyphicon glyphicon-chevron-right"></i></a></span>
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
        <div class="col-md-12 text-center"> 
        <h2>Please select category, from drop down list above</h2>
        </div>
        <%}%>

        <%@include file="chatwindow.jsp" %>
            <br><br>
            <div class="container">
                <%@ include file = "footer.jsp" %>
            </div>
    </body>
</html>
