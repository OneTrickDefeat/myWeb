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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>


    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">Furniture Depot</a>
            </div>

            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a> </li>
                <li><a href="displayItems.jsp?cID=1&name=Bedroom"> Bedroom</a>  </li>
                <li><a href="displayItems.jsp?cID=2&name=Living Room">Living Room</a></li>
                <li><a href="displayItems.jsp?cID=3&name=Home Office">Home Office</a></li>
                <li><a href="displayItems.jsp?cID=4&name=Game And Bar">Game & Bar</a></li>
                <li><a href="displayItems.jsp?cID=5&name=Kitchen And Dining">Kitchen & Dining</a></li>
                <li><a href="displayItems.jsp?cID=6&name=Home Entertainment">Home Entertainment</a></li>
                
                
                
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
                        
                 if (loggedInUser != null)         {
                                %>
            <!-- welcome note -->
            <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=dataBundle.getString("logInForm_greeting")%>  <%=loggedInUser.getFirstName()%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/preferences"><i class="icon-cog"></i> Preferences</a></li>
                            <li><a href="/help/support"><i class="icon-envelope"></i> Contact Support</a></li>
                            <li class="divider"></li>
                            <li><a href="/auth/logout"><i class="icon-off"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
              </div>
            <!-- end of welcome note -->
            <%}%>

        </div>
    </nav>



</html>
