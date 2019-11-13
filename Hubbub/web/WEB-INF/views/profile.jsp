<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Deets&trade; &raquo; ${target}</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
        <style type="text/css">.success {color:#92C4BE;}</style>
    </head>
    <body>
        <!-- NAVBAR : HOME/TIMELINE | ADD A BLURB/POST | MY DEETS/PROFILE | MY WALL | FOLLOW/UNFOLLOW | LOG ME OUT -->
        <nav class="w3-bar hubbubblue-background">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deetz&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=wall&for=${user}">My Wall</a>
            <c:choose>
                <c:when test="${target eq user}"></c:when>
                <c:when test="${followers.contains(user)}">
                    <a class="w3-bar-item w3-button" href="main?action=unfollow&target=${target}">
                        Unfollow ${target}
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="w3-bar-item w3-button" href="main?action=follow&target=${target}">
                        Follow ${target}
                    </a>
                </c:otherwise>
            </c:choose>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
            <span style="float: right; font-size: 75%" class="w3-bar-item hubbubred">
                Logged in as ${user}
            </span>
        </nav>
        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
            <h2>
                <c:set var="owner" value="${target eq user ? 'Me' : target}"/>
                Hubbub&trade; Deets&trade; for 
                <a href="main?action=wall&for=${target}" class="hubbubred">${owner}</a>
            </h2>
            <h6>
                Bub&trade; since <f:formatDate type="date" value="${target.joined}"/>
            </h6>
            </div>
            <hr>
            <div><!-- area for success/flash message -->
                <c:choose>
                    <c:when test="${not empty flash}">
                        <h2 class="flash">${flash}</h2>
                    </c:when>
                    <c:when test="${not empty success}">
                        <h2 style="color:blue;">${success}</h2>
                    </c:when>
                </c:choose>
            </div>
            <form method="POST" action="main">
                <input type="hidden" name="action" value="profile"/>
                <input type="hidden" name="for" value="${target}"/>
                <c:set var="disabled" value="${target eq user ? '' : 'disabled'}"/>
                <c:if test="${empty disabled}">
                    <p>The following fields are all optional and may be updated piecemeal.</p>
                </c:if>

            <div class="w3-card-4">
        <!-- Avatar -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>Avatar</h4>
                    </span>
                </header>
                <div class="w3-container" style="margin-top: 1em">
                    &nbsp;&nbsp;&nbsp;
                    <img src="avatar?for=${target}"/>
                    <c:if test="${target eq user}">
                        <button class="w3-button w3-margin-right hubbubblue-background">
                            <a href="main?action=avatar">Upload a new Avatar</a>
                        </button>
                        <c:if test="${user.profile.avatar ne null}">
                            <button class="w3-button w3-margin-left hubbublue">
                                <a href="main?action=revert">Revert to Default Avatar</a>
                            </button>
                        </c:if>
                    </c:if>
                </div>

        <!-- Name -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>Name</h4>
                        <p class="hubbubred">
                            <small>
                                <em>
                                    Your real name. No extra points for cleverness or creativity.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </p>
                    </span>
                </header>
                <div class="w3-container">
                    &nbsp;&nbsp;&nbsp;
                    <p>
                        <input class="w3-input w3-light-gray" type="text" ${disabled} 
                               name="firstName" value="${profile.firstName}"/>
                        <label>First Name</label>
                    </p>
                </div>
                <div class="w3-container">
                    &nbsp;&nbsp;&nbsp;
                    <p>
                        <input class="w3-input w3-light-gray" type="text" ${disabled} 
                               name="lastName" value="${profile.lastName}"/>
                        <label>Last Name</label>
                    </p>
                </div>

        <!-- Email -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>Email</h4>
                        <p class="hubbubred">
                            <small>
                                <em>
                                    You shall be spammed.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </p>
                    </span>
                </header>
                <div class="w3-container">
                    &nbsp;&nbsp;&nbsp;
                    <p>
                        <input class="w3-input w3-light-gray" type="text" ${disabled}
                           name="email" value="${profile.email}"/>
                        <label>Email</label>
                    </p>
                </div>

        <!-- Biography -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>Biography</h4>
                        <p class="hubbubred">
                            <small>
                                <em>
                                    Share your darkest secrets with everyone.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </p>
                    </span>
                </header>
                <div class="w3-container">
                    <p>
                        <textarea style="max-width: 100%" rows="10" cols="50" name="biography" 
                                  ${disabled} spellcheck="true" class="w3-input w3-light-gray" 
                                  onkeyup="charcountupdate(this.value)">
                            ${profile.biography}
                        </textarea>
                    </p>
                    <p class="w3-margin-right w3-right-align">
                        <small>
                            Characters (<span id="charcount"></span> left)
                        </small>
                    </p>
                    <script type="text/javascript">
                        function charcountupdate(str) {
                            var lng = str.length;
                            document.getElementById("charcount").innerHTML = 512 - lng;
                        }
                        charcountupdate("");
                    </script>
                </div>

        <!-- Timezone -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>Timezone</h4>
                    </span>
                </header>
                <div class="w3-container">
                    <p>
                        <select class="w3-select" ${disabled} name="timeZone">
                            <option value=""></option>
                            <c:forEach var="tz" items="${timeZones}">
                                <c:set var="selected" value="${tz eq profile.timeZone ? 'selected' : ''}"/>
                                <option value="${tz}" ${selected}>${tz}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p class="w3-margin-right w3-right-align">
                        <small>Select Your Zone</small>
                    </p>
                </div>
                <footer class="w3-container" style="background-color:#E2DDD2">

        <!-- Save Deets Button -->
                    <c:if test="${empty disabled}">
                        <button class="w3-button w3-section w3-ripple hubbubblue-background">
                            Save My Deets&trade;
                        </button>
                    </c:if>
                </footer>
            </div>
            </form>


        <!-- Followees -->
            <div class="w3-card-4">
                <header class="w3-container hubbubblue-background" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <h4>Followees</h4>
                </header>
                <div class="w3-container w3-light-gray">
                    <ul class="w3-ul">
                        <c:forEach var="followee" items="${followees}">
                            <li class="w3-bar">
                                <img src="avatar?for=${followee}" class="w3-bar-item w3-circle" style="width:80px">
                                <div class="w3-bar-item">
                                    <span class="w3-large">
                                        <a href="main?action=wall&for=${followee}">${followee}</a>
                                    </span>
                                    <br>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        
        <!-- Followers -->
            <div class="w3-card-4">
                <header class="w3-container hubbubblue-background"
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <h4>Followers</h4>
                </header>
                <div class="w3-container w3-light-gray">
                    <ul class="w3-ul">
                        <c:forEach var="follower" items="${followers}">
                            <li class="w3-bar">
                                <img src="avatar?for=${follower}" class="w3-bar-item w3-circle" style="width:80px">
                                <div class="w3-bar-item">
                                    <span class="w3-large"><a href="main?action=wall&for=${follower}">${follower}</a></span><br>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </section>
    </body>
</html>
