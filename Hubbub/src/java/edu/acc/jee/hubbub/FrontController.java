package edu.acc.jee.hubbub;

import edu.acc.jee.hubbub.domain.DataService;
import edu.acc.jee.hubbub.domain.Post;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
    private String actionDefault;
    private String viewDir;
    private String viewType;
    private String redirectTag;
    private int pageSize;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action"), destination = actionDefault;
        if (action == null) action = actionDefault;
        switch (action) {
            default:
            case "guest": destination = guest(request); break;
            case "login": destination = login(request); break;
            case "logout": destination = logout(request); break;
            //case "join": destination = join(request); break;
            //case "timeline": destination = timeline(request); break;
            //case "post": destination = post(request); break;
        }
        
        String view;
        if (destination.startsWith(redirectTag)) {
            view = destination.substring(redirectTag.length());
            response.sendRedirect("main?action=" + view);
        }
        else {
            view = viewDir + '/' + destination + viewType;
            request.getRequestDispatcher(view).forward(request, response);
        }
    }

// Added logout 10.18.2019 -james
// Logout invalidates the current session and redirects to the login page 
    private String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect.login";
    }

// START OF CODE INSERTED FROM edu.caa.java3.login.FrontController.java    
    // Start of the login request
    private String login(HttpServletRequest request) {
    // If user is already logged in, they are redirected to the guest timeline
        if (request.getSession().getAttribute("user") != null)
            return "redirect:guest";
        
    // Redirect improper request methods to login
        if (request.getMethod().equalsIgnoreCase("GET"))
            return "login";

    // Validate the login form fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(username, password);
        Set<String> errors = UserValidator.validate(user);
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            return "login";
        }
        
        // form is valid so authenticate the user
        String validUsername = this.getServletContext().getInitParameter("validUsername");
        String validPassword = this.getServletContext().getInitParameter("validPassword");
        /*String validId = this.getServletContext().getInitParameter("validId");*/
        if (!UserAuthenticator.authenticate(user, validUsername, validPassword/*, validId*/)) {
            request.setAttribute("flash", "Access Denied");
            return "login";
        }
        
        // if we get here, user is legit so add to session and forward to the timeline view
        request.getSession().setAttribute("user", user);
        return "timeline";
    }
// END OF CODE INSERTED FROM edu.caa.java3.login.FrontController.java

    @Override
    public void init() {
        ServletContext ctx = this.getServletContext();
        actionDefault = ctx.getInitParameter("action.default");
        viewDir = ctx.getInitParameter("view.dir");
        viewType = ctx.getInitParameter("view.type");
        redirectTag = ctx.getInitParameter("redirect.tag");
        pageSize = Integer.parseInt(ctx.getInitParameter("page.size"));
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String guest(HttpServletRequest request) {
        List<Post> posts = getDataService().findPostsByPage(0, pageSize);
        request.setAttribute("posts", posts);
        return "guest";
    }

    @SuppressWarnings("unchecked")
    private DataService getDataService() {
        return (DataService)this.getServletContext().getAttribute("dao");
    }

}
