<%-- 
    Document   : updateAccount
    Created on : 02-Dec-2018, 18:50:30
    Author     : Ahmed Khan
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

            <form action="TheServlet" method="post" autocomplete="off">

                <div>
                    <h2 id="sign2"></h2><hr style="border: 2px dotted white;"/>



                    <div class="form-group">
                        <label for="oldPassword">Current Password</label>
                        <input type="password" class="form-control" name="oldPassword" placeholder="Enter Here..." required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" name="newPassword" placeholder="Enter Here..." required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" class="form-control" name="confirmPassword" placeholder="Enter Here..." required>
                    </div>

                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="update">Update Password</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="updatePassword" />
                </div>


            </form>
        </div>
        <%@include file="chatwindow.jsp" %>
        <br><br>
        <div class="container">
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>
