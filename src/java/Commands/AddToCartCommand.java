/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import DAO.ProductCartDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Audrius
 */
public class AddToCartCommand implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        int result = 0;
        //get values submited from viewProduct.jsp form
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productID = Integer.parseInt(request.getParameter("productID"));       
        int cartID = Integer.parseInt(request.getParameter("cartID"));

        //check was it passed and are not just empty fields
        if ((quantity > 0 || quantity <= 10) && cartID > 0 && productID > 0) {
            ProductCartDao pCartDao = new ProductCartDao("furniturestore");
            
            //checking does that item already exist inside productCart table
//            if(){
//                
//            }
            
            //create new ProductCart record
            result = pCartDao.addToCart(cartID, productID, quantity);

            //if result equals to 1, operations was comleted.
            //Otherwise let user to know
            if (result == 1) {
                //product was successfully added , return them to the cart screen
                forwardToJsp = "viewCart.jsp";
            } else {
                // The product couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "Product couldn't be added to your cart at this time"
                        + "Please go back and try again.<br/>Try a different product";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing or incorrect."
                    + " Please go back and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
    
    
    
}
