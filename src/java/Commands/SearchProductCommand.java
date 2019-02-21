/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Product;
import DAO.ProductDao;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Audrius
 */
public class SearchProductCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        
        //get the string for product
        String searchProduct = request.getParameter("product");		
        int category = Integer.parseInt(request.getParameter("searchOption"));
        
        if(searchProduct != null && !searchProduct.equals("")){
            ProductDao pDao = new ProductDao("furniturestore");
            ArrayList<Product> p = new ArrayList();
            
            p = pDao.selectProductsContainingString(searchProduct, category);
            
            //if any product was found, then we can stor it and display to user
            if(p != null) {
                HttpSession session = request.getSession();
                session.setAttribute("foundProducts", p);
                forwardToJsp = "displaySearchedProducts.jsp";
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
            String errorMessage = "Your product title was missing. Please try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
    
}
