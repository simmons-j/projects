<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Blurb&trade; &raquo; Comment</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div class="w3-bar hubbubblue-background">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deets&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </div>
        <section>
            <%@include file="/WEB-INF/jspf/commentbox.jspf"%>
        </section>
        <div class="w3-container">
            <h1>The Blurb&trade; Sayeth:</h1>
            <%@include file="/WEB-INF/jspf/post.jspf"%>
            <c:forEach var="comment" items="${post.comments}">
            <%@include file="/WEB-INF/jspf/comment.jspf"%>
            </c:forEach>
        </div>
    </body>
</html>