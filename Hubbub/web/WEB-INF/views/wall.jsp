<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Bub&trade; Wall</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

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
                <!--<//%@include file="/WEB-INF/jspf/postbox.jspf"%>-->
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