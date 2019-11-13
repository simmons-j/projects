<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deets&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user.username}">My Wall</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </nav>
        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>Welcome to Hubbub&trade;, ${user}</h2>
                <hr>
            </div>
            <div>
                <div>
                    <%@include file="/WEB-INF/jspf/postbox.jspf"%>
                </div>
                <h2>Here are all of our Bub&trade;s' Blurb&trade;s.</h2>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/post.jspf"%>
                </c:forEach>
            </div>
        </section>
    </body>
</html>
