/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;
import Business.Category;

import DAO.CategoryDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Tom
 */
public class DeleteCategoryCommand implements Command {

  

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
    String forwardToJsp = null;

        String catName = request.getParameter("categoryName");
        
   
        boolean deleted = false;
        

        if (catName != null && !catName.equals("") ) {
           
            CategoryDao cDao = new CategoryDao("furniturestore");

            Category toDelete = new Category (catName);
            deleted = cDao.deleteCategory(toDelete);
            
            

            if (deleted != false) {
                //category was successfully added , return them to the same screen
                forwardToJsp = "deleteCategory.jsp";
            } else {
                // The user couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "Category couldn't be deleted from the database at this time"
                        + "Please <a href='deleteCategory.jsp'>go back</a> and try again.<br/>Try a different Category Name!";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='deleteCategory.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }
    
}
