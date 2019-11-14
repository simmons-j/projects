<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Wall</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <!-- NAVBAR : HOME/TIMELINE | ADD A BLURB/POST | MY DEETS/PROFILE | MY WALL | FOLLOW/UNFOLLOW | LOGOUT -->
        <nav class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deetz&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user}">My Wall</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
            <span style="float: right; font-size: 75%" class="w3-bar-item hubbubred">
                Logged in as ${user}
            </span>
        </nav>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>
                    "Build the Wall!", said 
                    <a href="main?action=profile&for=${param.for}">${param.for}</a>.
                </h2>
                <hr>
            </div>
        
<!-- It doesn't make sense to show the postbox in this view, so I am commenting it out for now -->
    <!--
            <div>
    -->
                <//%@include file="/WEB-INF/jspf/postbox.jspf"%>
    <!--
            </div>
    -->
            <div>
                <h2>Here are all of ${param.for}'s Blurb&trade;s.</h2>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/post.jspf"%>
                </c:forEach>
            </div>
        </section>
    </body>
</html>