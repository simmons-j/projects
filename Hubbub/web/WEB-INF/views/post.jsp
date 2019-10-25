<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <title>Hubbub&trade; &raquo; Post</title>
        <%@include file="/WEB-INF/jspf/w3csshead.jspf"%>
    </head>
    <body>
        <div id="navbar" class="w3-bar" style="background-color:#92C4BE">
            <a class="w3-bar-item w3-button" href="main?action=timeline">Hubbub&trade; Home</a>
            <a class="w3-bar-item w3-button" href="main?action=logout">Logout</a>
        </div>
        <section class="w3-card-4" style="margin-bottom:24px">
            <header>
                <div id="flex-container" class="w3-container w3-light-gray">
                    <h4>Add your blurb&trade;</h4>
                    <div id="main" style="color:#8F3049">
                        <form method="POST" action="main">
                            <input type="hidden" name="action" value="post"/>
                            <input class="hbutton" type="submit" name="action" value="Post"/>
                        </form>
                    </div>
                </div>
            </header>
            <div class="w3-container">
                <form method="POST" action="main">
                    <p>
                    <textarea 
                        style="width: 100%" 
                        id="content"
                        wrap="soft" 
                        spellcheck="true" 
                        maxlength="150" 
                        title="This is where you type something.">
                    </textarea>
                    </p>
                </form>
            </div>
            <footer class="w3-container" style="background-color:#E2DDD2">
                <p>Character count: &nbsp;<span id=""charcount"></span></p>
            </footer>
        </section>
    </body>
    <script type="text/javascript">
        document.getElementById("content").focus;
        function charcountupdate(str) {
            var lng = str.length;
            document.getElementById("charcount").innerHTML = 140 - lng;
        }
        charcountupdate("");
    </script>
</html>
