<%-- 
    Document   : updateAccount
    Created on : 02-Dec-2018, 18:50:30
    Author     : Ahmed Khan
--%>

<%@page import="DAO.AddressDao"%>
<%@page import="DAO.UserAddressDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="internationalisationHeader.jsp" %>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav4.jsp" %>

    <body>
        <div class="container">

            <%  UserAddressDao uAddressDao = new UserAddressDao("furniturestore");
                AddressDao addressDao = new AddressDao("furniturestore");
                UserAddress currentAddress = uAddressDao.retrieveDefaultUseraddress(loggedInUser.getUsername());
                Address cAddress = addressDao.findAddressByID(currentAddress.getAddressId());
            %>
            
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
                    <div class="form-group">
                        <label for="houseNo">House Number</label>
                        <input type="number" class="form-control" name="houseNo" value="<%=cAddress.getHouseNo()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="streetLine1">Street Line 1</label>
                        <input type="text" class="form-control" name="streetLine1" value="<%=cAddress.getStreetLine1()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="streetLine2">Street Line 2</label>
                        <input type="text" class="form-control" name="streetLine2" value="<%=cAddress.getStreetLine2()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="town">Town</label>
                        <input type="text" class="form-control" name="town" value="<%=cAddress.getTown()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="county">County</label>
                        <input type="text" class="form-control" name="county" value="<%=cAddress.getCounty()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="postCode">Post Code</label>
                        <input type="text" class="form-control" name="postCode" value="<%=cAddress.getPostcode()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" name="country" value="<%=cAddress.getCountry()%>" required>
                    </div>
                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="update">Update Details</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="updateUser" />
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
