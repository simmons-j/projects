<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div class="w3-bar hubbubblue-background">
            <a class="w3-bar-item w3-button" href="main?action=login">I'm a Bub&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=join">Sign Me Up!</a>

        </div>
        
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h2>Welcome to Hubbub&trade;</h2>
            <hr>
            <div>
                <h2>Here are the latest Bub&trade;s' Blurb&trade;s.</h2>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/post.jspf"%>
                </c:forEach>
            </div>
    </body>
</html>
