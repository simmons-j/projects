<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <!-- Seems to make sense to add a nav link to the profile view -->
            <a class="w3-bar-item w3-button" href="main?action=profile">Profile</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Welcome to Hubbub&trade;, ${user}</h1>
            <div class="w3-container w3-margin">
            <!-- The post box looks odd here, visually. I would prefer a button or link to the post instead -->
                <!--%@include file="/WEB-INF/jspf/postbox.jspf"%-->
                <a class="w3-bar-item w3-button" style="background-color:#92C4BE" href="main?action=post">Add a Blurb&trade;</a>
                <h2>Here's all our Bub&trade;s' Blurb&trade;s.</h2>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/post.jspf"%>
                </c:forEach>
            </div>
        </div>
    </body>
</html>