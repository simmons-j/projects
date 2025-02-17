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
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <h2>
                    <c:set var="owner" value="${target eq user ? 'Me' : target}"/>
                    Deets&trade; for 
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
                    <em>The following fields are all optional and may be updated piecemeal.</em>
                </c:if>

            <div class="w3-card-4">
        <!-- Avatar -->
                <header class="w3-container w3-light-gray" 
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>
                            <i class="fas fa-theater-masks" aria-hidden="true"></i>
                            Avatar
                        </h4>
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
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>
                            <i class="fas fa-address-book" aria-hidden="true"></i>
                            Name
                        </h4>
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
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>
                            <i class="fas fa-envelope" aria-hidden="true"></i>
                            Email
                        </h4>
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
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>
                            <i class="fas fa-book-open" aria-hidden="true"></i>
                            Biography
                        </h4>
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
                        <textarea style="max-width: 100%" rows="7" name="biography" 
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
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; border-top-width: 2px;">
                    <span id="flex-container">
                        <h4>
                            <i class="fas fa-clock" aria-hidden="true"></i>
                               Timezone
                        </h4>
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

            <hr>
        <!-- Followees -->
            <div class="w3-card-4">
                <header class="w3-container hubbubblue-background" 
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <h4>
                        <i class="fa fa-user-secret"></i>
                        Followees of ${target}
                    </h4>
                </header>
                <div class="w3-container w3-light-gray">
                    <ul class="w3-ul">
                        <c:if test="${empty followees}">
                            <li class="w3-bar">Currently, ${target} is not following anyone.</li> 
                        </c:if>
                        <c:forEach var="followee" items="${followees}">
                            <li class="w3-bar">
                                <img src="avatar?for=${followee}" class="w3-bar-item w3-circle" style="width:60px">
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

            <hr>
        <!-- Followers -->
            <div class="w3-card-4">
                <header class="w3-container hubbubblue-background"
                        style="border-top-color: #E2DDD2; border-top-style: solid; border-top-width: 2px;">
                    <h4>
                        <i class="fa fa-users"></i>
                        Followers of ${target}
                    </h4>
                </header>
                <div class="w3-container w3-light-gray">
                    <ul class="w3-ul">
                        <c:if test="${empty followers}">
                            <li class="w3-bar">Currently, no one is following ${target}. 
                                <i class='far fa-frown'></i>
                            </li> 
                        </c:if>
                        <c:forEach var="follower" items="${followers}">
                            <li class="w3-bar">
                                <img src="avatar?for=${follower}" class="w3-bar-item w3-circle" style="width:60px">
                                <div class="w3-bar-item">
                                    <span class="w3-large">
                                        <a href="main?action=wall&for=${follower}">${follower}</a>
                                    </span>
                                    <br>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <hr>
        <!-- Tags -->
            <div class="w3-card-4">
                <header class="w3-container hubbubtan-background"
                        style="border-top-color: #E2DDD2; 
                        border-top-style: solid; 
                        border-top-width: 2px;">
                    <h4><i class="fa fa-hashtag" aria-hidden="true"></i>
                        Tags Created by ${target}
                    </h4>
                </header>
                <div class="w3-container w3-light-gray">
                    <ul class="w3-ul">
                        <c:if test="${empty tags}">
                            <li class="w3-bar">Currently, ${target} has not created any tags.</li> 
                        </c:if>
                        <c:forEach var="tag" items="${tags}">
                            <li class="w3-bar">
                                <div class="w3-bar-item">
                                    <span class="w3-large">
                                        <a href="main?action=tags&tagName=${tag.tagName}">
                                            <i class="fa fa-hashtag" style="font-size:inherit" aria-hidden="true"></i>
                                            ${tag.tagName}
                                        </a>
                                    </span>
                                    <br>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
        <br><br><br>
    </body>
</html>
