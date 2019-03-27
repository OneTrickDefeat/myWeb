<%-- 
    Document   : updateAccount
    Created on : 02-Dec-2018, 18:50:30
    Author     : Ahmed Khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    
    <body>
        <div class="container">

            <form action="TheServlet" method="post" autocomplete="off">

                    <div>
                        <h2 id="sign2"></h2><hr style="border: 2px dotted white;"/>

                        <label>House Number</label>&nbsp;&nbsp;
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
                        <input name="postcode" type="text" placeholder="Postcode"/><br>   
                        

                        <button  type="submit" value="update">SUBMIT</button><br><br>

                        <!-- Include a hidden field to identify what the user wants to do -->

                        
                        <input type="hidden" name ="action" value="addAddress" />
                    </div>


            </form>
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
