<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; ${user} $nbsp Timeline</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            Logged in as <a class="w3-bar-item w3-button" href="inactive">${user}</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Logout</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <!-- Added the c:if test below to display the username when logged in -->
            <h1>Welcome to Hubbub&trade;<c:if test="${not empty user}">, ${user}</c:if></h1>
            <div class="w3-margin">
                <p>Here are your most recent <b>bubs&trade;</b>.</p>
                <c:forEach var="post" items="${posts}">
                    <%@include file="/WEB-INF/jspf/userpost.jspf"%>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
