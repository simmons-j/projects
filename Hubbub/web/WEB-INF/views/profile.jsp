<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Deets&trade; &raquo; ${target.username}</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
        <style type="text/css">.success {color:#92C4BE;}</style>
    </head>
    <body>
        <div class="w3-bar hubbubblue">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Home</a>
            <a class="w3-bar-item w3-button" href="main?action=post">I'm Gonna Blurb&trade;!</a>
            <c:if test="${target ne user}">
                <a class="w3-bar-item w3-button" href="main?action=profile&for=${user}">My Deets&trade;</a>
            </c:if>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Out</a>
        </div>
        <div class="w3-container">
            <h1><img src="images/hubbub_logo_no-text.png" style="height: 1em">
                Deets&trade; for <span class="hubbubred">${target}</span>
                (Bub&trade; since <f:formatDate type="date" value="${target.joined}"/>)
            </h1>
        </div>
        <div class="w3-container"><!-- area for success/flash message -->
            <c:choose>
                <c:when test="${not empty flash}">
                    <h2 class="flash">${flash}</h2>
                </c:when>
                <c:when test="${not empty success}">
                    <h2 style="color:blue;">${success}</h2>
                </c:when>
            </c:choose>
        </div>
        <form class="w3-container w3-margin" method="POST" action="main">
            <input type="hidden" name="action" value="profile"/>
            <input type="hidden" name="for" value="${target}"/>
            <c:set var="disabled" value="${target eq user ? '' : 'disabled'}"/>
            <c:if test="${empty disabled}">
                <p>The following fields are all optional and may be updated piecemeal.</p>
            </c:if>
    <!-- Avatar -->
            <div class="w3-card-4">
                <header>
                    <div id="flex-container" class="w3-container w3-light-gray">
                        <h4 class="w3-margin-left">Avatar</h4>
                    </div>
                    <div id="main" style="color:#8F3049">
                </header>
                <div class="w3-container">
                    &nbsp;&nbsp;&nbsp;
                    <img src="avatar?for=${target}"/>
                    <c:if test="${target eq user}">
                        <button class="w3-button w3-margin-right hubbubblue">
                            <a href="main?action=avatar">Upload a new Avatar</a>
                        </button>
                        <c:if test="${user.profile.avatar ne null}">
                            <button class="w3-button w3-margin-left hubbublue">
                                <a href="main?action=revert">Revert to Default Avatar</a>
                            </button>
                        </c:if>
                    </c:if>
                </div>
            <br>

    <!-- Name -->
                <header>
                    <div id="flex-container" class="w3-container w3-light-gray">
                        <h4>Name</h4>
                        <div id="main" style="color:#8F3049">
                            <small>
                                <em>
                                    Your real name. No extra points for cleverness or creativity.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </div>
                    </div>
                </header>
                <div class="w3-container">
                        &nbsp;&nbsp;&nbsp;
                        <p>
                            <input class="w3-input w3-light-gray" type="text" ${disabled}
                               name="firstName" value="${target.profile.firstName}"/>
                            <label>First Name</label>
                        </p>
                    </div>
                <div class="w3-container">
                        &nbsp;&nbsp;&nbsp;
                        <p>
                            <input class="w3-input w3-light-gray" type="text" ${disabled}
                               name="lastName" value="${target.profile.lastName}"/>
                            <label>Last Name</label>
                        </p>
                    </div>
                    <br>

    <!-- Email -->
                <header>
                    <div id="flex-container" class="w3-container w3-light-gray">
                        <h4>Email</h4>
                        <div id="main" style="color:#8F3049">
                            <small>
                                <em>
                                    You shall be spammed.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </div>
                    </div>
                </header>
                <div class="w3-container">
                    &nbsp;&nbsp;&nbsp;
                    <p>
                        <input class="w3-input w3-light-gray" type="text" ${disabled}
                           name="email" value="${target.profile.email}"/>
                        <label>Email</label>
                    </p>
                </div>
                <br>

    <!-- Biography -->
                <header>
                    <div id="flex-container" class="w3-container w3-light-gray">
                        <h4>Biography</h4>
                        <div id="main" style="color:#8F3049">
                            <small>
                                <em>
                                    Share your darkest secrets with everyone.
                                    &nbsp;&nbsp;&nbsp;
                                </em>
                            </small>
                        </div>
                    </div>
                </header>
                <div class="w3-container">
                    <p>
                        <textarea rows="10" cols="50" name="biography" ${disabled} spellcheck="true"
                            class="w3-input w3-light-gray"
                            onkeyup="charcountupdate(this.value)">${target.profile.biography}</textarea>
                        <label>Biography (<span id="charcount"></span> left)</label>
                    </p>
                    <script type="text/javascript">
                    function charcountupdate(str) {
                        var lng = str.length;
                        document.getElementById("charcount").innerHTML = 512 - lng;
                    }
                    charcountupdate("");
                    </script>
                </div>
                <br>

        <!-- Timezone -->
                <header>
                    <div id="flex-container" class="w3-container w3-light-gray">
                        <h4>Timezone</h4>
                    </div>
                </header>
                <div class="w3-container">
                    <p>
                        <select class="w3-select" ${disabled} name="timeZone">
                            <option value=""></option>
                            <c:forEach var="tz" items="${timeZones}">
                            <c:set var="selected" value="${tz eq target.profile.timeZone ? 'selected' : ''}"/>
                            <option value="${tz}" ${selected}>${tz}</option>
                            </c:forEach>
                        </select>                    
                        <label>Time Zone</label>
                    </p>
                </div>
                <footer class="w3-container" style="background-color:#E2DDD2">
                    <p></p>
                </footer>
                <c:if test="${empty disabled}">
                    <hr/>
                    <p>
                        <button class="w3-button w3-section w3-ripple hubbubblue">
                            Save Deets&trade;
                        </button>
                    </p>
                </c:if>
            </div>
        </form>
    </body>
</html>
