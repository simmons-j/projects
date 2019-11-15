<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Blurb&trade; &raquo; Comment</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

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