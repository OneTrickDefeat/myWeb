<%-- 
    Document   : myAccount
    Created on : 02-Dec-2018, 15:53:16
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
            <%            if (loggedInUser != null) {

                    if (loggedInUserAddress != null) {%>



            <div class="container">
                <div class="row">
                    <div class="col-md-5  toppad  pull-right col-md-offset-3 ">

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%></h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 col-lg-3 " align="center"> <img alt="<%=loggedInUser.getUsername()%>" src="img/profilepic.png" class="img-circle img-responsive"> </div>

                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-user-information">
                                            <tbody>
                                                <tr>
                                                    <td>User Name</td>
                                                    <td><%=loggedInUser.getUsername()%></td>
                                                </tr>
                                                <tr>
                                                    <td>House Number</td>
                                                    <td><%=loggedInUserAddress.getHouseNo()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Street line 1</td>
                                                    <td><%=loggedInUserAddress.getStreetLine1()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Street line 2</td>
                                                    <td><%=loggedInUserAddress.getStreetLine2()%></td>
                                                </tr>

                                                
                                                <tr>
                                                    <td>Town</td>
                                                    <td><%=loggedInUserAddress.getTown()%></td>
                                                </tr>
                                                <tr>
                                                    <td>County</td>
                                                    <td><%=loggedInUserAddress.getCounty()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Country</td>
                                                    <td><%=loggedInUserAddress.getCountry()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Post Code</td>
                                                    <td><%=loggedInUserAddress.getPostcode()%></td>
                                                </tr>

                                            </tbody>
                                        </table>

                                        <a href="updateAccount.jsp" class="btn btn-primary"><%=dataBundle.getString("myAcc_updateLink")%></a>
                                        <a href="updatePassword.jsp"" class="btn btn-primary">Update Password</a>
                                        <a href="addDeliveryAddress.jsp" class="btn btn-primary">Add Delivery Address</a>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">

                            </div>

                        </div>
                    </div>
                </div>
            </div>





            <%
                }
                //end of what happens if theyre logged in
            } else {
            %>



            <h1>Log in to see user profile</h1>


            <%
                }
            %>
        </div>
        <%@include file="chatwindow.jsp" %>
        <br><br>
        <div class="container">
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            var panels = $('.user-infos');
            var panelsButton = $('.dropdown-user');
            panels.hide();

            //Click dropdown
            panelsButton.click(function () {
                //get data-for attribute
                var dataFor = $(this).attr('data-for');
                var idFor = $(dataFor);

                //current button
                var currentButton = $(this);
                idFor.slideToggle(400, function () {
                    //Completed slidetoggle
                    if (idFor.is(':visible'))
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                    } else
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                    }
                })
            });


            $('[data-toggle="tooltip"]').tooltip();

            $('button').click(function (e) {
                e.preventDefault();
                alert("This is a demo.\n :-)");
            });
        });

    </script>
</html>

