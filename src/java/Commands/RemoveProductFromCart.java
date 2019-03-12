/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Cart;
import DAO.ProductCartDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00197085
 */
public class RemoveProductFromCart implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = null;
        HttpSession session = request.getSession();
        Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");

        int cartID = loggedInUserCart.getCartID();
        int productID = Integer.parseInt(request.getParameter("productID"));

        if (cartID > 0 && productID > 0) {
            ProductCartDao pcDao = new ProductCartDao("furniturestore");
            if (pcDao.removeProductByPID(productID, cartID)) {
                forwardToJsp = "viewCart.jsp";
            } else {
                //user input did not match any product title
                //send the user to error page and inform of this
                String errorMessage = "No products was deleted from your cart."
                        + " Please try again.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // The product title was missing
            // Send the user to the error page and inform them of this
            String errorMessage = "Your product title was missing. Please try again.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }
}
