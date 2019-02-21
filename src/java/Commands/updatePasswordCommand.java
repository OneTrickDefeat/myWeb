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
 * @author Ahmed Khan
 */
public class updatePasswordCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword != null && !newPassword.equals("") && oldPassword != null && !oldPassword.equals("") && confirmPassword != null && !confirmPassword.equals("")) {
            if (confirmPassword.equals(newPassword)) {
                HttpSession session = request.getSession();
                User loggedInUser = (User) session.getAttribute("loggedInUser");
                String email = loggedInUser.getUsername();

                UserDao userDao = new UserDao("furniturestore");
                int results = userDao.updateUserPassword(oldPassword, newPassword, email);
                if (results > 0) {

                    session.setAttribute("LoggedInUser", results);
                    forwardToJsp = "myAccount.jsp";

                } else {
                    String errorMessage = "One or more fields were Not Correct"
                            + "Please <a href='myAccount.jsp'>go back</a> and try again.<br/>";
                    session = request.getSession();
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
            } else {
                String errorMessage = "the passwords did not match"
                        + "Please <a href='myAccount.jsp'>go back</a> and try again.<br/>";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }

        } else { // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='register.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
            return forwardToJsp;
        }

        return forwardToJsp;

    }
}
