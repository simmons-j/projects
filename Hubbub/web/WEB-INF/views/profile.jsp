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
            <a class="w3-bar-item w3-button" href="main?action=post">Add a Blurb&trade;</a>
            <a class="w3-bar-item w3-button" href="main?action=timeline">${user}'s Timeline</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Log Me Out</a>
        </div>
        <div class="w3-container">
            <%@include file="/WEB-INF/jspf/masthead.jspf"%>
            <h1>${user}'s Hubbub&trade; profile</h1>
        </div>
        <div class="w3-margin">
            <form method="POST" name="userProfile"><fieldset style="border: none">
            <!-- Avatar -->
                <section class="w3-card-4">
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
                                <input 
                                    class="greenbutton" 
                                    type="submit" 
                                    name="updateprofile" 
                                    value="Save"/>
                            
                        </div>
                    </header>
                    <div class="w3-container">
                            &nbsp;&nbsp;&nbsp;
                            <img 
                                src="images/silhouette-avatar.jpg" 
                                alt="default avatar" 
                                style="max-height: 200px; 
                                    margin: 5px 0px; 
                                    border-style: solid; 
                                    border-width: 1px;
                                    border-color: lightgray;"/>

                    </div>
                    <footer class="w3-container" style="background-color:#E2DDD2">
                        <p></p>
                    </footer>
                </section>

            <!-- Name -->
                <section  class="w3-card-4">
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
                                <input 
                                    class="greenbutton" 
                                    type="submit" 
                                    name="updateprofile" 
                                    value="Save"/>
                            </div>
                        </div>
                    </header>
                        <div class="w3-container" id="flex-container">
                                &nbsp;&nbsp;&nbsp;
                                <p style="display:inline-block; width:10em;"><label for="firstname">First Name:</label></p>
                                <input 
                                    type="text" 
                                    name="firstname" 
                                    placeholder=" Mary"
                                    title="Type your first name here"/>
                        </div>
                        <div class="w3-container" id="flex-container">
                                &nbsp;&nbsp;&nbsp;
                                <p style="display:inline-block; width:10em;"><label for="lastname">Last Name:</label></p>
                                <input 
                                    type="text" 
                                    name="lastname" 
                                    placeholder=" Poppins"
                                    title="Type your surname here"/>
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
                                    <input 
                                        class="greenbutton" 
                                        type="submit" 
                                        name="updateprofile" 
                                        value="Save"/>
                            </div>
                        </div>
                    </header>
                    <div class="w3-container" id="flex-container">
                            &nbsp;&nbsp;&nbsp;
                            <p style="display:inline-block; width:10em;"><label for="email">Bub&trade;'s Email:</label></p>
                            <input 
                                type="text" 
                                name="email" 
                                placeholder=" Email"
                                title="Put your email address in this field"/>
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
                                    <input 
                                        class="greenbutton" 
                                        type="submit" 
                                        name="updateprofile" 
                                        value="Save"/>
                            </div>
                        </div>
                    </header>
                    <div class="w3-container">
                            <p style="display:inline-block; width:10em"><label for="biography">${user}:</label></p>
                                <textarea 
                                id="bio"
                                spellcheck="true" 
                                maxlength="512"
                                onkeyup="charcountupdate(this.value)"
                                title="Keep it brief Bub. You are limited to 512 characters."
                                name="biography">
                                ${param.bio}
                                </textarea>
                                <br>
                                <small>
                                    Characters: <span id="charcount"></span> left
                                </small>
                        <script type="text/javascript">
                        document.getElementById("bio").focus();
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
            </fieldset>
            </form>
        </div>
    </body>
</html>
