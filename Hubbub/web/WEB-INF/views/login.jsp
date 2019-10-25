<!-- Day 1 Homework
1) Implement the login feature. 
(Clicking the I'm a Bub link on the homepage should navigate to main?action=login.)
- The login view should display a form requesting two fields: a username text field and a password 
password field.
- The submit button should 
    - POST the form to main?action=login and 
    - return the user to the login view if:
        - the submitted fields are invalid 
            or ||
        - if the submitted username and password values do not match one of the users created in the 
        StartupListener. 
      * Use the message "Access Denied" in these scenarios.
- A successful login should put the matching User domain object into session scope and redirect the 
browser to main?action=timeline.
- It should not be possible to access the login view if the user is already logged-in.
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <title>Hubbub&trade; &raquo; Login</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Hubbub&trade; Home</a>
            <a class="w3-bar-item w3-button" href="main?action=join">Sign me up!</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Login to Hubbub&trade;</h1>
            <section class="w3-card-4 w3-container w3-light-gray">
                <form method="POST" action="main">
                    <input type="hidden" name="action" value="login"/>
                    <p style="font-weight: bold;">Enter your username and password</p>
                    &nbsp;&nbsp;&nbsp;
                    <label for="username" style="display:inline-block; width:6em;"> 
                        Username:
                    </label> 
                    <input 
                        type="text" 
                        id="username"
                        name="username" 
                        placeholder=" username"
                        required/>
                    <br><br>
                    &nbsp;&nbsp;&nbsp;
                    <label for="password" style="display:inline-block; width:6em;">
                        Password:
                    </label> 
                    <input 
                        type="password"
                        id="password"
                        name="password" 
                        placeholder=" password"
                        required/>
                    <br><br>
                    <input class="hbutton" type="submit" name="Login" value="Login"/>
                </form>
                <br>
            </section>
        </div>
    </body>
    <script type="text/javascript">
        document.getElementById("username").focus();
    </script>
</html>
