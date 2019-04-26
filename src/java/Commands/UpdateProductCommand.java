/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Product;
import DAO.ProductDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Audrius
 */
public class UpdateProductCommand implements Command {

    public UpdateProductCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp;
        HttpSession session;
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productColour = request.getParameter("colour");
        double productPrice = Double.parseDouble(request.getParameter("price"));
        int productQuantity = Integer.parseInt(request.getParameter("quantity"));
        String productImage = request.getParameter("Image");
        String productDescription = request.getParameter("description");
        
        if(productName != null && !productName.equals("") && productColour != null 
                && !productColour.equals("") && productDescription != null && 
                !productDescription.equals("")){
            ProductDao pDao = new ProductDao("furniturestore");
            boolean confirmation = pDao.updateProductDetails(productId, productName, productColour, productPrice, productQuantity, productDescription);
            
            if(confirmation != false){
                Product product = pDao.findProductByProductName(productName);
                forwardToJsp = "viewProduct.jsp?prodId=" + product.getProductId();
            } else {
                //the product couldn't be found from database
                //send user to the error pgae and inform
                String errorMessage = "Product couldn't be found at this time"
                        + "Please try again.<br/>";
                session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please go back and try again.";
            session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
    
}
