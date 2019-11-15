<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; @Bub&trade; Mentions</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>
                    <i class="fa fa-at" aria-hidden="true"></i>
                    Mention Wall for
                    <a href="main?action=profile&for=${param.subject}">${param.subject}</a>
                </h2>
                <div class="w3-container w3-margin">
                    <%@include file="/WEB-INF/jspf/postbox.jspf"%>
                    <h2>Here are the Blurb&trade;s Mentioning ${param.subject}</h2>
                    <c:forEach var="post" items="${posts}">
                        <%@include file="/WEB-INF/jspf/post.jspf"%>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>