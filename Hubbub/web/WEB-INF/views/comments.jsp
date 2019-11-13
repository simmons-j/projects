<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Blurb&trade; &raquo; Comment</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <!-- NAVBAR : HOME/TIMELINE | ADD A BLURB/POST | MY DEETS/PROFILE | MY WALL | FOLLOW/UNFOLLOW | LOGOUT -->
        <nav class="w3-bar hubbubblue-background">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deetz&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user}">My Wall</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </nav>
        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <h3>The Blurb&trade; Sayeth:</h3>
                <%@include file="/WEB-INF/jspf/post.jspf"%>
            </div>
            <div>
                <c:forEach var="comment" items="${post.comments}">
                    <%@include file="/WEB-INF/jspf/comment.jspf"%>
                </c:forEach>
                <%@include file="/WEB-INF/jspf/commentbox.jspf"%>
            </div>
        </section>
    </body>
</html>