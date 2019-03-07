/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Newsletter;
import DAO.NewsletterDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Ahmed Khan
 */
public class NewsletterCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = null;

        String newletterEmail = request.getParameter("addEmail2");

        if (newletterEmail != null && !newletterEmail.equals("")) {
            NewsletterDao news = new NewsletterDao("furniturestore");
            Newsletter newRecord = new Newsletter(newletterEmail);
            boolean isAdded = news.addToNewsletter(newRecord);

            if (isAdded != false) {

                forwardToJsp = "index.jsp";
                JOptionPane.showMessageDialog(null, "Success! , You Have Been Added");
                

                

            } else {

                String errorMessage = "Could not add you to the newsletter";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {

            String errorMessage = "field were missing. Please <a href='index.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }

}
