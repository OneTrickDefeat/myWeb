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
                    <h2>Add a Product Category</h2>
                </div>
                <form action="TheServlet" method="post">

<!--                    <table>
                        <tr>
                            <td> Category Name  : </td><td> <input name="categoryName" required size=15 type="text" /> </td> 
                        </tr>
                    </table>-->
                    <div class="form-group">
                        <label for="firstName">Category Name</label>
                        <input class="form-control" name="categoryName" required type="text"  placeholder="Enter Category Name" min=1 max=30>
                    </div>

                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="Add category">Add category</button><br><br>
                    </div>

                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="addCategory" />
                </form>
            </div>

            <!-- Include a footer so that there is always a link back to the home page! -->
            <%@include file="chatwindow.jsp" %>
            <br><br>
            <div class="container">
                <%@ include file = "footer.jsp" %>
            </div>
        </div>
    </body>
</html>