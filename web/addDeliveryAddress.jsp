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
                    <div class="col-md-12 text-center"> 
                        <h2>Add a Delivery Address</h2>
                    </div>

                    <!--                    <label>House Number</label>&nbsp;&nbsp;
                                        <input name="houseNumber" required type="number"  placeholder="Enter House Number" min=1 max=9999/><br>
                    
                                        <label>Street Line 1</label>&nbsp;&nbsp;
                                        <input name="streetLine1" required type="text" placeholder="Street line 1"/><br>
                    
                                        <label>Street Line 2</label>&nbsp;&nbsp;
                                        <input name="streetLine2" type="text" placeholder="Street line 2"/><br>
                    
                                        <label>Town / City</label>&nbsp;&nbsp;
                                        <input name="town" required type="text" placeholder="Town or City"/><br>   
                    
                                        <label>County</label>&nbsp;&nbsp;
                                        <input name="county" required type="text" placeholder="County"/><br> 
                    
                                        <label>Country</label>&nbsp;&nbsp;
                                        <input name="country" required type="text" placeholder="Country"/><br>   
                    
                                        <label>Postcode</label>&nbsp;&nbsp;
                                        <input name="postcode" type="text" placeholder="Postcode"/><br>   -->

                    <div class="form-group">
                        <label for="firstName">House Number</label>
                        <input class="form-control" name="houseNumber" required type="number"  placeholder="Enter House Number" min=1 max=9999>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Street Line 1</label>
                        <input  class="form-control" name="streetLine1" required type="text" placeholder="Street line 1">
                    </div>
                    <div class="form-group">
                        <label for="houseNo">Street Line 2</label>
                        <input  class="form-control" name="streetLine2" type="text" placeholder="Street line 2">
                    </div>

                    <div class="form-group">
                        <label for="town">Town /City</label>
                        <input class="form-control" name="town" required type="text" placeholder="Town or City">
                    </div>
                    <div class="form-group">
                        <label for="county">County</label>
                        <input  class="form-control" name="county" required type="text" placeholder="County">
                    </div>
                    <div class="form-group">
                        <label for="country">Country</label>
                        <input  class="form-control" name="country" required type="text" placeholder="Country">
                    </div>
                    <div class="form-group">
                        <label for="firstName">Post Code</label>
                        <input  class="form-control" name="postcode" type="text" placeholder="Postcode">
                    </div>
                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="update">Add Delivery Address</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->


                    <input type="hidden" name ="action" value="addAddress" />
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
