<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Tags</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>Tag Wall for 
                    <i class="fa fa-hashtag" aria-hidden="true"></i>
                    ${tag.tagName}
                    <span style="float: bottom-right; font-size: 50%" class="hubbubred">
                        (created by
                        <a href="main?action=wall&for=${tag.creator}">${tag.creator}</a>
                        on <f:formatDate type="both" value="${tag.created}"/>)
                    </span>
                </h2>
            </div>
            <hr>
    
            <h3>Here are the Blurb&trade;s Tagged With 
                <i class="fa fa-hashtag" aria-hidden="true"></i>
                ${tag.tagName}
            </h3>
            <c:forEach var="post" items="${posts}">
                <%@include file="/WEB-INF/jspf/post.jspf"%>
            </c:forEach>
        </section>
    </body>
</html>