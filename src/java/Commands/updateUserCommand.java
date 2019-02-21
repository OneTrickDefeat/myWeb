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
public class updateUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        String email = loggedInUser.getUsername();
        String password = request.getParameter("password");
        String first = request.getParameter("firstname");
        String last = request.getParameter("lastname");

        if (email != null && !email.equals("") && password != null && !password.equals("") && first != null && !first.equals("")) {
            UserDao uDao = new UserDao("furniturestore");
            User toUpdate = new User(email, password, first, last);
            boolean updated = uDao.updateUser(toUpdate);

            if (updated != false) {
                // Registration was successful, log the user in!
                User u = uDao.findUserByEmailPassword(email, password);

                session = request.getSession();
                session.setAttribute("loggedInUser", u);

                forwardToJsp = "index.jsp";
            } else {
                // The user couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "User couldn't be added to the database at this time"
                        + "Please <a href='register.jsp'>go back</a> and try again.<br/>Try a different username!";
                session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='register.jsp'>go back</a> and try again.";
            session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }

}
