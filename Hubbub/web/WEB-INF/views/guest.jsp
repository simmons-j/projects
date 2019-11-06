<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=login">I'm a Bub&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=join">Sign Me Up!</a>
<!-- I am commenting out the Log Out link because logged in users should not get to the guest view
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
-->
        </div>
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>Welcome to Hubbub&trade; ${user}</h2>
                <hr>
                <div class="w3-container">
                    <h2>Here are the latest Bub&trade;s' Blurb&trade;s.</h2>
                    <c:forEach var="post" items="${posts}">
                        <%@include file="/WEB-INF/jspf/post.jspf"%>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>
