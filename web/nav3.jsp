<%-- 
    Document   : nav3
    Created on : 22-Apr-2019, 04:50:11
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


    <nav class="navbar navbar-dark bg-dark">

        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=1&name=Bedroom">Bedroom</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=2&name=Living Room">Living Room</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=3&name=Home Office">Home Office</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=4&name=Game And Bar">Game & Bar</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=5&name=Kitchen And Dining">Kitchen & Dining</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="displayItems.jsp?cID=6&name=Home Entertainment">Home Entertainment</a>
        </li>
            <%
                CategoryDao catDao = new CategoryDao("furniturestore");
                ArrayList<Category> catList = catDao.getListOfCategories();

            %>
        <form class="form-inline my-2 my-lg-0" action="TheServlet" method="post">
            <select name="searchOption">
                <option value="0" >All</option>
                <%                        for (int i = 0; i < catList.size(); i++) {%>
                <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                    }
                %>

            </select>
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="product" id="mySearch">
            <input type="hidden" name ="action" value="searchProduct" />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
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

    </nav>



</html>
