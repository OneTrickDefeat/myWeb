<%-- 
    Document   : updateProduct
    Created on : 25-Apr-2019, 23:42:53
    Author     : Audrius
--%>

<%@page import="Business.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>

    <%  int productId = Integer.parseInt(request.getParameter("prodId"));
        ProductDao pDao = new ProductDao("furniturestore");
        Product product = pDao.findProductByProductId(productId);
    %>
    
    <body>
        <div class="container">
            <div>
                <div class="col-md-12 text-center"> 
                    <h2>Update a Product </h2>
                </div>
                <form action="TheServlet" method="post">
                    <table>

                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" name="productName" placeholder="<%=product.getName()%>" required size=40>
                        </div>
                        <div class="form-group">
                            <label for="colour">Product Colour</label>
                            <input type="text" class="form-control" name="colour" placeholder="<%=product.getColour()%>" required size=20>
                        </div>
                        <div class="form-group">
                            <label for="colour">Product Price</label>
                            <input type="number" class="form-control" name="price" placeholder="<%=product.getPrice()%>" required step="0.01" min="0">
                        </div>
                        <div class="form-group">
                            <label for="colour">Quantity</label>
                            <input  class="form-control" name="quantity" placeholder="<%=product.getStockQuantity()%>" required size=6 type="number" >
                        </div>
                        <tr>
                            <td> Product Image  : </td><td>  </td> 
                        </tr>
                        <div class="form-group">
                            <label for="colour">Description</label><br>
                            <textarea id="descripArea" type="text"  class="form-control" name="description" placeholder="<%=product.getDescription()%>"></textarea> 
                        </div>
                        
                    </table>
                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="Add product">Add product</button><br><br>
                    </div>

                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="addProduct" />
                </form>
            </div>

            <!-- Include a footer so that there is always a link back to the home page! -->

        </div>
    </body>
</html>
