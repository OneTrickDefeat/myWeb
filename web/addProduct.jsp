<%-- 
    Document   : addCategory
    Created on : 08-Feb-2019, 18:34:33
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>

    <body>
        <div class="container">
            <div>
                <div class="col-md-12 text-center"> 
                    <h2>Add a Product </h2>
                </div>
                <form action="TheServlet" method="post">
                    <table>

                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" class="form-control" name="productName" required size=40>
                        </div>
                        <div class="form-group">
                            <label for="colour">Product Colour</label>
                            <input type="text" class="form-control" name="colour" required size=20>
                        </div>
                        <div class="form-group">
                            <label for="colour">Product Price</label>
                            <input type="number" class="form-control" name="price" required step="0.01" min="0">
                        </div>
                        <div class="form-group">
                            <label for="colour">Quantity</label>
                            <input  class="form-control" name="quantity" required size=6 type="number" >
                        </div>

                        <tr>
                            <td> Product Image  : </td><td>  </td> 
                        </tr>

                        <div class="form-group">
                            <label for="colour">Description</label>
                            <input  class="form-control" name="description" required size=300 type="text"  >
                        </div>

                        <tr>
                            <td> Add to category  : </td><td>  <select name="categoryOption">
                                    <option>Select Category</option>
                                    <%
                                        for (int i = 0; i < catList.size(); i++) {%>
                                    <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                                        }
                                    %>

                                </select>

                            </td> 
                        </tr>


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
        <%@include file="chatwindow.jsp" %>
        <br><br>
        <div class="container">
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>