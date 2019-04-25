/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Product;
import DAO.ProductDao;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Audrius
 */
public class ChangeCategoryCommand implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        //get the category id value
        int catId = Integer.parseInt(request.getParameter("categoryOption"));
        
        if(catId > 0 && catId <= 6){
            ProductDao pDao = new ProductDao("furniturestore");
            List<Product> p = new ArrayList();
            
            p = pDao.findProductsByCategoryId(catId);
            
            //if any product was found, store it to session and display
            if(p != null){
               HttpSession session = request.getSession();
                session.setAttribute("foundProducts", p);
                forwardToJsp = "updateProducts.jsp"; 
            } else {
                //user input did not match any product title
                //send the user to error page and inform of this
                String errorMessage = "No products was found matching details provided."
                        + " Please try again.";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // The product title was missing
            // Send the user to the error page and inform them of this
            String errorMessage = "Your category id was missing or corrupted. "
                    + "Please try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
}
