<%-- 
    Document   : nav
    Created on : 30-Nov-2018, 15:02:07
    Author     : Tom
--%>

<%@page import="Business.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Business.Category"%>
<%@page import="DAO.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>


    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">Furniture Depot</a>
            </div>

            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp"><%=dataBundle.getString("navbar_home")%></a> </li>
                <li><a href="displayItems.jsp?cID=1&name=Bedroom"> <%=dataBundle.getString("navbar_bedroom")%></a>  </li>
                <li><a href="displayItems.jsp?cID=2&name=Living Room"><%=dataBundle.getString("navbar_living_room")%></a></li>
                <li><a href="displayItems.jsp?cID=3&name=Home Office"><%=dataBundle.getString("navbar_home_office")%></a></li>
                <li><a href="displayItems.jsp?cID=4&name=Game And Bar"><%=dataBundle.getString("navbar_game&bar")%></a></li>
                <li><a href="displayItems.jsp?cID=5&name=Kitchen And Dining"><%=dataBundle.getString("navbar_kitchen&dining")%></a></li>
                <li><a href="displayItems.jsp?cID=6&name=Home Entertainment"><%=dataBundle.getString("navbar_home_entertainment")%></a></li>



            </ul>

            <%
                CategoryDao catDao = new CategoryDao("furniturestore");
                ArrayList<Category> catList = catDao.getListOfCategories();

            %>
            <form class="navbar-form navbar-left" action="TheServlet" method="post"> 
                <select name="searchOption">
                    <option value="0" >All</option>
                    <%                        for (int i = 0; i < catList.size(); i++) {%>
                    <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                        }
                    %>

                </select>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" name="product" id="mySearch">
                </div>
                <input type="hidden" name ="action" value="searchProduct" />
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <%
                if (loggedInUser != null) {
            %>
            <!-- welcome note -->
            <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=dataBundle.getString("logInForm_greeting")%>  <%=loggedInUser.getFirstName()%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="myAccount.jsp"><i class="icon-cog"></i> <%=dataBundle.getString("index_accountMsg")%></a></li>
                            <li><a href="viewCart.jsp"><i class="icon-envelope"></i> <%=dataBundle.getString("index_myCartMsg")%></a></li>
                                <%
                                    if (loggedInUser.isAdmin()) {

                                %>
                            <li class="divider"></li>
                            <li><a href="addCategory.jsp"><%=dataBundle.getString("admin_addCategory")%></a></li>
                            <li><a href="deleteCategory.jsp"><%=dataBundle.getString("admin_deleteCategory")%></a></li>
                            <li><a href="addProduct.jsp"><%=dataBundle.getString("admin_addProduct")%></a></li>
                            <li><a href="updateProduct.jsp"><%=dataBundle.getString("admin_updateProduct")%></a></li>
                                <% }

                                %>
                            <li class="divider"></li>
                            <li><a href="TheServlet?action=logout"><%=dataBundle.getString("index_LogOutMsg")%></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- end of welcome note -->
            <% } %>

        </div>
    </nav>



</html>
