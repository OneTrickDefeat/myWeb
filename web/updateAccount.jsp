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

                <div class="container">
                    <h2 id="sign2"></h2><hr style="border: 2px dotted white;"/>
                    <div class="col-md-12 text-center"> 
                    <label>Current Password</label>&nbsp;&nbsp;
                    <input name="password" required type="password" placeholder="Enter Here..."/><br><br>
                    </div>
                    <div class="col-md-12 text-center">                     
                    <h2>Please edit your details below</h2>
                    </div>
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%=loggedInUser.getFirstName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%=loggedInUser.getLastName()%>" required>
                    </div>
                    <div class="col-md-12 text-center"> 
                    <button  type="submit" class="btn btn-primary"value="update">Update User Details</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="updateUser" />
                </div>


                <div class="container">
                    <h2 id="sign2"></h2><hr style="border: 2px dotted white;"/>


                    <label>Delivery address</label>&nbsp;&nbsp;
                    <%
                        //  AddressDao addressDao = new AddressDao("furniturestore");
                        //  ArrayList<Address> addressList = addressDao.getListOfAddresses();

                    %>
                    <input name="lastname" required type="text" placeholder="address dropdown here"/><br>


                    <div class="col-md-12 text-center"> 
                    <button  type="submit" class="btn btn-primary" value="update">Set Delivery Address</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="updateAddress" />
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
