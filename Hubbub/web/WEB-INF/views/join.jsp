<!-- Day 1 Homework
5) Implement the join feature.
- Clicking the "Sign Me Up" link on the homepage should navigate to main?action=join.
- The join view should display a form requesting three fields: a username text field, a password1 
password field and a password2 password field.
- The submit button should POST the form to main?action=join and return the user to the join view 
if the submitted fields are invalid, if the submitted username is already taken, or if the two 
password fields do not match. Use a UserDTO instance for validation.
- For invalid form submission, show the rules that apply to the fields which were violated. For a 
duplicate username, say something about an unavailable username.
- A successful join should add a new User instance to the users list, put that object in session 
scope and then redirect the user to the timeline action.
- The join action should be inaccessible when there is already a logged-in user.
-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <title>Hubbub&trade; &raquo; Join</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=guest">Hubbub&trade; Home</a>
            <a class="w3-bar-item w3-button" href="main?action=login">I'm a Bub</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Join Hubbub&trade;</h1>

            <section class="w3-card-4 w3-container w3-light-gray">
                <form method="POST" action="main">
                    <input type="hidden" name="action" value="join"/>
                    <p style="font-weight: bold;">
                        What would you like your username and password to be?
                    </p>
                    &nbsp;&nbsp;&nbsp;
                    <label for="username" style="display:inline-block; width:10em;"> 
                        Username:
                    </label>
                    <input 
                        type="text"
                        id="username"
                        name="username" 
                        placeholder=" username"
                        title="must be 6-20 alpha-numeric characters"
                        required/>
                    <br><br>
                    &nbsp;&nbsp;&nbsp;
                    <label for="password1" style="display:inline-block; width:10em;"> 
                        Password:
                    </label>
                    <input 
                        type="password"
                        id="password1"
                        name="password1" 
                        placeholder=" enter a password"
                        title="must be 8-50 alpha-numeric characters"
                        required/>
                    <br><br>
                    &nbsp;&nbsp;&nbsp;
                    <label for="password2" style="display:inline-block; width:10em;"> 
                        Confirm Password:
                    </label>
                    <input type="password" 
                           name="password2"
                           placeholder=" re-enter password"
                           title="passwords must match"
                           required/>
                    <br><br>

                    <input class="hbutton" type="submit" value="Sign Up!"/>
                </form>
                <br>
            </section>
        </div>
    </body>
</html>