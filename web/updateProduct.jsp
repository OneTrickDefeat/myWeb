<%-- 
    Document   : updateProduct
    Created on : 14-Feb-2019, 12:54:29
    Author     : D00197085
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    
    <body>
        <div class="container">
           
            <form action="TheServlet" method="post">
                <select name="categoryOption" onchange="this.form.submit()">
                    <%
                        for(int i=0; i<catList.size(); i++){ %>
                        <option value="<%=catList.get(i).getCatId()%>"><%=catList.get(i).getCatName()%></option> <%
                        }
                    %>
                </select>
                <input type="hidden" name="action" value="changeLanguage"/>
            </form>
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
