/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Category;
import Business.Product;
import DAO.CategoryDao;
import DAO.ProductDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class AddProductCommand implements Command {

   

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
     String forwardToJsp = null;

        String name = request.getParameter("productName");
        String colour = request.getParameter("colour");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        int categoryOption = Integer.parseInt(request.getParameter("categoryOption"));
        boolean added = false;
        String img = "blank";
   
        if (name != null && !name.equals("") ) {
           
            ProductDao pDao = new ProductDao("furniturestore");

            Product toAdd = new Product (categoryOption, quantity, name, colour, img, description, price);
            added = pDao.addProduct(toAdd);

            if (added != false) {
                //category was successfully added , return them to the same screen
                forwardToJsp = "addProduct.jsp";
            } else {
                // The user couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "Category couldn't be added to the database at this time"
                        + "Please <a href='addCategory.jsp'>go back</a> and try again.<br/>Try a different Category Name!";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='addCategory.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }
    
}
