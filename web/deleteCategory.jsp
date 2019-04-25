<%-- 
    Document   : deleteCategory
    Created on : 08-Feb-2019, 20:09:22
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
        
            <div class="col-md-12 text-center"> 
                    <h2>Delete a Product Category</h2>
                </div>
            <form action="TheServlet" method="post">
<!--                <table>
                    <tr>
                        <td> Category Name  : </td><td> <input name="categoryName" required size=15 type="text" /> </td> 
                    </tr>
                   
                    
                </table>
                <input type="submit" value="Delete category" />-->
                <div class="form-group">
                        <label for="firstName">Category Name</label>
                        <input class="form-control" name="categoryName" required type="text"  placeholder="Enter Category Name" >
                    </div>

                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="Delete category">Delete category</button><br><br>
                    </div>
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="deleteCategory" />
            </form>
        
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@include file="chatwindow.jsp" %>
            <br><br>
            
                <%@ include file = "footer.jsp" %>
          
        </div>
    </body>
</html>
