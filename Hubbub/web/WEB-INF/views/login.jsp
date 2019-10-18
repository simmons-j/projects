<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <title>Hubbub&trade; &raquo; Login</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=join">Sign me up!</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Login to Hubbub&trade;</h1>
            <form method="POST" action="main">
                <input type="hidden" name="action" value="login"/>
                
                <span style="display:inline-block; width:6em;"> 
                    Username:
                </span> 
                <input 
                    type="text" 
                    name="username" 
                    placeholder="username"
                    required/>
                <br><br>
                
                <span style="display:inline-block; width:6em;">
                    Password:
                </span> 
                <input 
                    type="password" 
                    name="password" 
                    placeholder="password" 
                    required/>
                <br><br>
                
                <input 
                    class="hbutton" 
                    type="submit" 
                    name="Login" 
                    value="Login"/>
            </form>
        </div>
    </body>
</html>
