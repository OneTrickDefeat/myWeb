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

                String newsletter = "Success! You have been Added";
                HttpSession session = request.getSession();
                session.setAttribute("newsletter", newsletter);

                forwardToJsp = "index.jsp";

            } else {

                String newsletter = "ERROR! Duplicate Entry";
                HttpSession session = request.getSession();
                session.setAttribute("newsletter", newsletter);
                forwardToJsp = "index.jsp";
            }
        } else {

            String newsletter = "Field Was Missing!!";
            HttpSession session = request.getSession();
            session.setAttribute("newsletter", newsletter);
            forwardToJsp = "index.jsp";
        }

        return forwardToJsp;
    }

}
