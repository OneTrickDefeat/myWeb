<%-- 
    Document   : addCategory
    Created on : 08-Feb-2019, 18:34:33
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>

    <body>
        <div class="container">
            <div>
                <p>Enter the name of the category</p>
                <form action="TheServlet" method="post">
                    <table>
                        <tr>
                            <td> Product Name  : </td><td> <input name="productName" required size=40 type="text" /> </td> 
                        </tr>

                        <tr>
                            <td> Product Colour  : </td><td> <input name="colour" required size=20 type="text" /> </td> 
                        </tr>

                        <tr>
                            <td> Product Price  : </td><td> <input name="price" type="number" step="0.01" min="0"/> </td> 
                        </tr>

                        <tr>
                            <td> Product Quantity  : </td><td> <input name="quantity" required size=6 type="number" /> </td> 
                        </tr>

                        <tr>
                            <td> Product Image  : </td><td>  </td> 
                        </tr>

                        <tr>
                            <td> Product Description  : </td><td> <input name="description" required size=300 type="text" /> </td> 
                        </tr>

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
                    <input type="submit" value="Add product" />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="addProduct" />
                </form>
            </div>

            <!-- Include a footer so that there is always a link back to the home page! -->
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>