<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Tags</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <!-- NAVBAR : HOME/TIMELINE | ADD A BLURB/POST | MY DEETS/PROFILE | MY WALL | FOLLOW/UNFOLLOW | LOG ME OUT -->
        <nav id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </nav>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>Tag Wall for 
                    <i class="fa fa-hashtag" aria-hidden="true"></i>
                    ${tag.tagName}
                    <span style="float: bottom-right; font-size: 50%" class="hubbubred">
                        (created by<a href="main?action=wall&for=${tag.creator}">${tag.creator}</a>
                        on <f:formatDate type="both" value="${tag.created}"/>)
                    </span>
                </h2>
                <div class="w3-container">
                    <h2>Here are the Blurb&trade;s Tagged With 
                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                        ${tag.tagName}
                    </h2>
                    <c:forEach var="post" items="${posts}">
                        <%@include file="/WEB-INF/jspf/post.jspf"%>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>