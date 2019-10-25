package edu.acc.jee.hubbub;

import edu.acc.jee.hubbub.domain.DataService;
import edu.acc.jee.hubbub.domain.Post;
import edu.acc.jee.hubbub.domain.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.GenericServlet;
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
            case "join": destination = join(request); break;
            case "login": destination = login(request); break;
            case "profile": destination = profile(request); break;
            case "timeline": destination = timeline(request); break;
            
            case "logout": destination = logout(request); break;
            case "post": destination = post(request); break;
            case "updateprofile": doPost(request, response); break;
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


// Added User Profile 10.21.2016 - james
// User profile
    private String profile(HttpServletRequest request) {
    // If user is not logged in, they are redirected to login
        if (request.getSession().getAttribute("user") != null)
            return "redirect:login";
        return "profile";
    }

// Guest timeline
    private String guest(HttpServletRequest request) {
        List<Post> posts = getDataService().findPostsByPage(0, pageSize);
        request.setAttribute("posts", posts);
        return "guest";
    }

// Added logout 10.18.2019 -james
// Logout invalidates the current session and redirects to the login page
/*
    Day 1 Homework
    4) Implement the logout feature.
    - Invalidate the session and redirect the user to the guest action.
*/
    private String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return redirectTag + "guest";
    }

// Added join 10.18.2019 -james
// Join
/*
    Day 1 Homework
    5) Implement the join feature.
    - Clicking the "Sign Me Up" link on the homepage should navigate to 
    main?action=join.
*/
    private String join(HttpServletRequest request) {
        if (loggedIn(request)) return redirectTag + "timeline";
        if (request.getMethod().equalsIgnoreCase("GET")) return "join";
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (password1 == null || password2 == null || !password1.equals(password2)) {
            request.setAttribute("flash", "Passwords do not match.");
            return "join";
        }
/*
        UserDTO dto = new UserDTO(username, password1);
        if (!dto.isValid()) {
            request.setAttribute("flash", "Username or Password is invalid.");
            return "join";
        }

        DataService dao = this.getDataService();
        if(dao.userExists(dto.getUsername())) {
            request.setAttribute("flash", "That username is unavailable.");
            return "join";
        }

        User user = dao.addUser(dto);
        request.getSession().setAttribute ... ;
    }
*/

// Timeline (user's timeline) 
    private String timeline(HttpServletRequest request) {
    // If user is not logged in, they are redirected to the guest timeline
        if (!loggedIn(request));
        return redirectTag + "guest";
    }
    
    private boolean loggedIn(HttpServletRequest request) {
        return getSessionUser(request) != null)
    }

    
// Post (users posting to hubbub) 
    private String post(HttpServletRequest request) {
        User user = this.getSessionUser(request);
        if (user == null) return redirectTag + "guest";
        if (request.getMethod().equalsIgnoreCase("GET")) return "post";
        String content = request.getParameter("content");
        if (content == null || content.length() < 1) {
            request.setAttribute("flash", "Your post was empty.");
            return "post";
        }
        if (content.length() > 140) {
            request.setAttribute("flash", "140 characters max, please.");
            return "post";
        }
        
        this.getDataService().addPost(content, user);
            return redirectTag + "timeline";
    }

// Login 
    private String login(HttpServletRequest request) {
    // If user is already logged in, they are redirected to their own timeline
        //if (request.getSession().getAttribute("user") != null)
            //return "redirect:timeline";
        if (loggedIn(request)) 
            return redirectTag + "timeline";
        
    // Redirect improper request methods to login
        if (request.getMethod().equalsIgnoreCase("GET"))
            return "login";
    //Must be a POST if we get here. Build a DTO and Validate
        UserDTO dto = new UserDTO(
            request.getParameter("username"),
            request.getParameter("password")
        );
        
        if (!dto.isValid()) {
            request.setAttribute("flash", "Access Denied!");
            return "login";
        }
    //DTO is valid
        DataService dao = this.getDataService();
        User user = dao.findUserByUserDTO(dto);
        if(user == null) {
            request.setAttribute("flash", "Access Denied!");
            return "login";
        }
    }
    
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

    @SuppressWarnings("unchecked")
    private DataService getDataService() {
        return (DataService)this.getServletContext().getAttribute("dao");
    }

}

    private Object getDataService() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
