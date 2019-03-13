<%-- 
    Document   : myAccount
    Created on : 02-Dec-2018, 15:53:16
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file = "header.jsp" %>
    <%@ include file = "head.jsp" %>
    <%@ include file = "nav.jsp" %>
    


    <body>
        <div class="container">
            <%            if (loggedInUser != null) {
            %>
            <p><%=dataBundle.getString("myAcc_username")%> : <%=loggedInUser.getUsername()%></p>
            <p><%=dataBundle.getString("myAcc_firstName")%> : <%=loggedInUser.getFirstName()%></p>
            <p><%=dataBundle.getString("myAcc_secondName")%> : <%=loggedInUser.getLastName()%></p>


            <a href="updateAccount.jsp"><%=dataBundle.getString("myAcc_updateLink")%></a><br>
            <a href="updatePassword.jsp">Update Password</a>





            <div class="container">
                <div class="row">
                    <div class="col-md-6 img">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvzOpl3-kqfNbPcA_u_qEZcSuvu5Je4Ce_FkTMMjxhB-J1wWin-Q"  alt="" class="img-rounded">
                    </div>
                    <div class="col-md-6 details">
                        <blockquote>
                            <h5> <%=loggedInUser.getFirstName()%>  <%=loggedInUser.getLastName()%> </h5>
                            <small><cite title="Source Title">Chicago, United States of America  <i class="icon-map-marker"></i></cite></small>
                        </blockquote>
                        <p>
                            <%=loggedInUser.getUsername()%><br>
                            www.bootsnipp.com <br>
                            June 18, 1990
                        </p>
                    </div>
                </div>
            </div>

            <%
                //end of what happens if theyre logged in
            } else {
            %>



            <h1>Log in to see user profile</h1>


            <%
                }
            %>
        </div>
    </body>
</html>
