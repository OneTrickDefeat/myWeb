<%-- 
    Document   : transactionSearch
    Created on : 28-Apr-2019, 18:19:39
    Author     : Tom
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


                    <h2>Search by transaction ID</h2>
                    <div class="form-group">
                        <label for="transId">transaction Id</label>
                        <input type="text" class="form-control" name="transId" placeholder="Enter Here..." required>
                    </div>
                    

                    <div class="col-md-12 text-center"> 
                        <button  type="submit" class="btn btn-primary" value="update">Find transaction</button><br><br>
                    </div>
                    <!-- Include a hidden field to identify what the user wants to do -->

                    <input type="hidden" name ="action" value="searchTransaction" />
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
