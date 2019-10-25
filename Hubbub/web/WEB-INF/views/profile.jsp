<%@page import="java.util.TimeZone"%>
<!-- Added Profile view on 10.21.2019 - james -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub&trade; &raquo; Profile</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=logout">Logout</a>
            <a class="w3-bar-item w3-button" href="main?action=profile">Timeline</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>Your Hubbub&trade; profile</h1>
        </div>
        <div class="w3-margin" style="margin-bottom:24px">
            
<!-- Avatar -->
        <section class="w3-card-4" style="margin-bottom:24px">
            <header>
                <div id="flex-container" class="w3-container w3-light-gray">
                    <h4>Avatar</h4>
                    <div id="main" style="color:#8F3049">
                        <small>
                            <em>
                                This is the image other users will see.
                                &nbsp;&nbsp;&nbsp;
                            </em>
                        </small>
                        <input class="hbutton" type="submit" name="updateprofile" value="Save"/>
                    </div>
                </div>
            </header>
            <div class="w3-container">
                <form method="POST">
                    &nbsp;&nbsp;&nbsp;
                    <img src="images/silhouette-avatar.jpg" 
                             alt="default avatar" 
                             style="max-height: 200px; 
                                    margin: 5px 0px; 
                                    border-style: solid; 
                                    border-width: 1px;
                                    border-color: lightgray;"/>
                    <input 
                        type="hidden" 
                        name="MAX_FILE_SIZE" 
                        value="3000"/>
                    <input
                        class="hbutton2"
                        type="file" 
                        accept="image/gif,image/jpeg"/>
                </form>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p></p>
            </footer>
        </section>

<!-- Name -->
        <section  class="w3-card-4" style="margin-bottom:24px">
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
                        <input class="hbutton" type="submit" name="updateprofile" value="Save"/>
                    </div>
                </div>
            </header>
            <div class="w3-container" style="display:inline-block; width:auto;">
                <form method="POST" action="main">
                    &nbsp;&nbsp;&nbsp;
                    <p style="display:inline-block; width:6em;">First Name:</p>
                    <input 
                        type="text" 
                        name="firstname" 
                        placeholder=" Mary"
                        title="Type your first name here"/>
                    <br>
                    &nbsp;&nbsp;&nbsp;
                    <p style="display:inline-block; width:6em;">Last Name:</p> 
                    <input 
                        type="text" 
                        name="lastname" 
                        placeholder=" Poppins"
                        title="Type your surname here"/>
                </form>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p></p>
            </footer>
        </section>

<!-- Email -->
        <section class="w3-card-4" style="margin-bottom:24px">
            <header>
                <div id="flex-container" class="w3-container w3-light-gray">
                    <h4>Email</h4>
                    <div id="main" style="color:#8F3049">
                        <form method="POST" action="main">
                            <input class="hbutton" type="submit" name="updateprofile" value="Save"/>
                        </form>
                    </div>
                </div>
            </header>
            <div class="w3-container">
                <form method="POST" action="main">
                    &nbsp;&nbsp;&nbsp;
                    <p style="display:inline-block; width:6em;">Spam Me!:</p>
                    <input 
                        type="email" 
                        name="email" 
                        placeholder=" email"
                        title="Put your email address in this field"/>
                </form>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p></p>
            </footer>
        </section>

<!-- Biography -->
        <section class="w3-card-4" style="margin-bottom:24px">
            <header>
                <div id="flex-container" class="w3-container w3-light-gray">
                    <h4>Biography</h4>
                    <div id="main" style="color:#8F3049">
                        <form method="POST" action="main">
                            <input class="hbutton" type="submit" name="updateprofile" value="Save"/>
                        </form>
                    </div>
                </div>
            </header>
            <div class="w3-container">
                <form method="POST" id="bio" action="main">
                    <p>
                    <textarea 
                        style="width: 100%" 
                        wrap="soft" 
                        spellcheck="true" 
                        maxlength="500" 
                        title="Tell us about yourself. Share your darkest secrets with everyone"
                        >
                    </textarea>
                    </p>
                </form>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p></p>
            </footer>
        </section>

<!-- Timezone -->
        <section class="w3-card-4" style="margin-bottom:24px">
            <header>
                <div id="flex-container" class="w3-container w3-light-gray">
                    <h4>Timezone</h4>
                </div>
            </header>
            <div class="w3-container">
                <p>&nbsp;&nbsp;&nbsp;Your time zone is currently:&nbsp;
                    <% 
                        String Zone = TimeZone.getTimeZone("GMT-8").getID();
                            out.print(Zone); 
                    %>
                </p>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p></p>
            </footer>
        </section>            

        </div>
    </body>
</html>
