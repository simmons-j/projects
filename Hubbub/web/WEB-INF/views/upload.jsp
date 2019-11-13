<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Avatar Upload</title>
        <style>
            .flash {color:red;}
        </style>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">Back to My Deets&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user.username}">My Wall</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </nav>
        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>
                <a href="main?action=wall&for=${user}">${user}'s Avatar</a>
                </h2>
            </div>
            <div class="nav">
                <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
                <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deets&trade;</a>
                <a href="main?action=wall&for=${user.username}">Back to My Wall</a> |
                <a href="main?action=post">Post Something</a> |
                <a href="main?action=logout">Log me out</a>
            </div>
            <c:if test="${not empty flash}">
                <h2 class="flash">${flash}</h2>
            </c:if>
            <div>
                <form method="POST" action="main" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="avatar"/>
                    <label for="mime">Upload an Image</label>
                    <input type="file" name="avatar" id="avatar"/>
                    <img src="avatar?for=${user}"/>
                    <input type="submit" value="Upload"/>
                </form>
            </div>
        </section>
    </body>
</html>