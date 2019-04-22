<%-- 
    Document   : head
    Created on : 30-Nov-2018, 15:50:02
    Author     : Tom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <style>
            body {
                padding-top: 3px;
                padding-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/viewProductPage.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/topnav.css">
        

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://js.braintreegateway.com/web/dropin/1.9.1/js/dropin.min.js"></script>
        <script src="js/quantitySelector.js"></script>
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="js/sidebar.js"></script>
        <script>

        $(document).ready(function() {
        $.ajax({
                type: 'POST',
                url: 'TheServlet',
                data: {
                        action : 'generateClientToken'
                        },
                success: function(msg)
                {
                //window.alert("Success");
                        var token = '<%=(String) session.getAttribute("clienttoken")%>';
                        //window.alert(token);
                        console.log("token:" + token);
                },
                error: function(error)
                {

                        console.log(error);
                        //window.alert("Error"); 
                        //window.alert(error);                        
                }
                //window.alert("this " + token);
        });
        });
    </script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
</html>
