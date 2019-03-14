<%-- 
    Document   : index
    Created on : 30-Nov-2018, 14:20:53
    Author     : Tom
--%>
<%@page import="Business.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "header.jsp" %>
    <%@ include file = "nav.jsp" %>
    <%@ include file = "head.jsp" %>


    <body>



    <body>
        <div class="container">

            <div class="wrap-slide">
                <a href="#" class="bln" id="bln-left"><<</a>
                <a href="#" class="bln" id="bln-right">>></a>
                <ul class="slideshow">
                    <li class="current" ><img src="img/churchillbed.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/casseltonbed.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/kingstontable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/lavoietable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/nassautable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/palmspringstable.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/robbiedining.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/sanctuaryHF.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/solanodesk.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/sorellaHF.jpg" alt="" width="1000" height="600"/></li>
                    <li><img src="img/twistdining.jpg" alt="" width="1000" height="600"/></li>
                </ul>
            </div><br><br><br>

            <script>
                var slideCount = $('.slideshow li').length;
                var slideWidth = $('.slideshow li').width();
                var slideHeight = $('.slideshow li').height();
                var slideULwidth = slideCount * slideWidth;

                $('.wrap-slide').css({width: slideWidth, height: slideHeight});
                $('.slideshow').css({width: slideULwidth, marginLeft: -slideWidth});
                $('.slideshow li:last-child').prependTo($('.slideshow'));

                function moveLeft() {
                    $('.slideshow').animate({
                        left: +slideWidth
                    }, 600, function () {
                        $('.slideshow li:last-child').prependTo('.slideshow');
                        $('.slideshow').css('left', '');
                    });
                }
                ;

                function moveRight() {
                    $('.slideshow').animate({
                        left: -slideWidth
                    }, 600, function () {
                        $('.slideshow li:first-child').appendTo('.slideshow');
                        $('.slideshow').css('left', '');
                    });
                }
                ;
                var idset = setInterval('moveRight()', 4000);
                $('#bln-left').click(function () {
                    clearInterval(idset);
                    moveLeft();
                    idset = setInterval('moveRight()', 4000);
                });
                $('#bln-right').click(function () {
                    clearInterval(idset);
                    moveRight();
                    idset = setInterval('moveRight()', 4000);
                });

            </script>


        </div>
    </body>

    <%@ include file = "footer.jsp" %>


</html>
