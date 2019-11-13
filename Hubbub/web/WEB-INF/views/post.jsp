<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Blurb</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <!-- NAVBAR : HOME/TIMELINE | ADD A BLURB/POST | MY DEETS/PROFILE | MY WALL | FOLLOW/UNFOLLOW | LOGOUT -->
        <nav class="w3-bar hubbubblue-background">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
       <!-- <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a> -->
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deetz&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user}">My Wall</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
            <span style="float: right; font-size: 75%" class="w3-bar-item hubbubred">
                Logged in as ${user}
            </span>
        </nav>
        <!-- MAIN CONTENT SECTION -->
        <section>
            <%@include file="/WEB-INF/jspf/postbox.jspf"%>
        </section>
    </body>
</html>