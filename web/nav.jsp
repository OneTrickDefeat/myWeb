<%-- 
    Document   : nav
    Created on : 30-Nov-2018, 15:02:07
    Author     : Tom
--%>

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
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="displayAllBedroom.jsp">Bedroom</a> </li>
                <li><a href="displayAllLoans.jsp">Living Room</a></li>
                <li><a href="displayActiveLoans.jsp">Home Office</a></li>
                <li><a href="displayActiveLoans.jsp">Game & Bar</a></li>
                <li><a href="displayActiveLoans.jsp">Kitchen & Dining</a></li>
                <li><a href="displayActiveLoans.jsp">Home Entertainment</a></li>
            </ul>
            
            <%
                CategoryDao catDao = new CategoryDao("furniturestore");
                ArrayList<Category> catList = catDao.getListOfCategories();
                
            %>
            <form class="navbar-form navbar-left" action="TheServlet" method="post"> 
                <select name="searchOption">
                    <option value="0" >All</option>
                    <%
                        for(int i=0; i<catList.size(); i++){ %>
                        <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                        }
                    %>

                </select>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" name="product">
                </div>
                <input type="hidden" name ="action" value="searchProduct" />
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            
            
        </div>
    </nav>



</html>
