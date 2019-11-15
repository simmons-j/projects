<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Login</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/navbar.jspf"%>

        <!-- MAIN CONTENT SECTION -->
        <section>
            <div>
                <%@include file="/WEB-INF/jspf/masthead.jspf"%>
                <hr>
                <c:if test="${not empty flash}">
                    <h2 class="flash">${flash}</h2>
                </c:if>
            </div>

            <div class="w3-card-4"> 
                <header class="w3-container w3-light-gray">
                    <h4>
                        Login to Hubbub&trade;
                        <img src="images/hubbub_logo_no-text.png" style="float: right; height: 25px">
                    </h4>
                </header>
                <div class="w3-container">
                    <form method="POST" action="main">
                        <input type="hidden" name="action" value="login"/>
                        <p>
                            <input class="w3-input" name="username" type="text" id="user"
                                   style="width: 100%" required/>
                            <label for="username">Username:</label>
                        </p>
                        <p>
                            <input class="w3-input" name="password" id="pass"
                                   type="password" style="width: 100%" required />
                            <label for="password">Password:</label>
                        </p>
                        <p>
                            <button class="w3-button w3-section w3-ripple"
                                    style="background-color:#92C4BE">
                                Make It So
                            </button>
                        </p>
                    </form>
                </div>
                <footer class="w3-container w3-light-gray"><br></footer>
            </div>
        </section>
    </body>
    <script type="text/javascript">
        document.getElementById("user").focus();
    </script>
</html>