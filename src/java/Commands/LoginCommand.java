/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.User;
import DAO.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class LoginCommand implements Command {

    //@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        // Get the username and password information that the user
        // entered into the form on the previous page
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if(email != null && password != null && !email.equals("") && !password.equals(""))
        {
            UserDao uDao = new UserDao("furniturestore");  //change name of DB
            
            User u = uDao.findUserByEmailPassword(email, password);
            // If a user was found, then there is a user with this username and password
            // so we can log them in
            if(u!= null){
                // Put the user in the session 
                // (we can use this to track if the user has logged in -
                // if it's there, they they have completed this process
                // if it's not, then they haven't)
                
                 //CALL CART DAO TO CHECK FOR CART WITH USERS EMAIL
                 // SET IN SESSION IF PRESENT
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", u);
                forwardToJsp = "index.jsp";
            }
            else{
                // The username and/or password didn't match someone in the database
                // Send the user to the error page and inform them of this
                
                
                String errorMessage = "No user found matching those details."
                        + "Please <a href='login.jsp'>go back</a> and try again.";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        }
        else{
            // The username and/or password was missing
            // Send the user to the error page and inform them of this
            String errorMessage = "Your username and/or password was missing. Please <a href='login.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
}
