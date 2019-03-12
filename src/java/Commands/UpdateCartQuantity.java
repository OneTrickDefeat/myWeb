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
public class UpdateCartQuantity implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");
        
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        int cartID = loggedInUserCart.getCartID();
        int productID = Integer.parseInt(request.getParameter("productID"));
            
        if(cartID > 0 && productID > 0){
            ProductCartDao pcDao = new ProductCartDao("furniturestore");
            boolean updated = pcDao.updateQuantity(cartID, productID, quantity);
            
            if(updated != false){
                forwardToJsp = "viewCart.jsp";
            } else {
                // The product couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "Product couldn't be updated at your cart at this time"
                        + "Please go back and try again.<br/>Try a different product";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing or incorrect."
                    + " Please go back and try again.";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
    
}
