<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <title>Hubbub&trade; &raquo; Join</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=login">I'm a Bub</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Join Hubbub&trade;</h1>
            <form method="POST" action="main">
                <input type="hidden" name="action" value="join"/>

                What would you like your username to be?
                <br>
                <span style="display:inline-block; width:6em;"> 
                    Username:
                </span>
                <input 
                    type="text" 
                    name="username" 
                    placeholder="must be 6-20 characters"
                    required/>

                <br>
                    Enter a Password
                <br>
                <span style="display:inline-block; width:6em;"> 
                    Password:
                </span>
                <input 
                    type="password" 
                    name="password1" 
                    placeholder="must be 8-50 characters" 
                    required/>
                <br><br>
                
                <span style="display:inline-block; width:6em;"> 
                    Confirm your Password:
                </span>
                <input type="password" 
                       name="password2" 
                       required/>
                <br><br>

                <input type="submit" value="Sign Up!"/>
            </form>
        </div>
    </body>
</html>