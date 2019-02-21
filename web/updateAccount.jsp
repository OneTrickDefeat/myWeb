<%-- 
    Document   : updateAccount
    Created on : 02-Dec-2018, 18:50:30
    Author     : Ahmed Khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "header.jsp" %>
    <body>
        <div class="container">

            <form action="TheServlet" method="post" autocomplete="off">

                <div class="con2">
                    <h2 id="sign2"></h2><hr style="border: 2px dotted white;"/>
                   
                    <label>Current Password</label>&nbsp;&nbsp;
                    <input name="password" required type="password" placeholder="Enter Here..."/><br><br>

                    <label>New First Name</label>&nbsp;&nbsp;
                    <input name="firstname" required type="text" placeholder="Enter Here..."/><br>

                    <label>New Last Name</label>&nbsp;&nbsp;
                    <input name="lastname" required type="text" placeholder="Enter Here..."/><br>



                    <button  type="submit" value="update">SUBMIT</button><br><br>

                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="updateUser" />
                </div>


            </form>
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
