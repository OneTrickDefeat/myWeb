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
public class AddCategoryCommand implements Command {

   

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
      String forwardToJsp = null;

        String catName = request.getParameter("categoryName");
        
   
        boolean added = false;
        

        if (catName != null && !catName.equals("") ) {
           
            CategoryDao cDao = new CategoryDao("furniturestore");

            Category toAdd = new Category (catName);
            added = cDao.addCategory(toAdd);
            
            //User toAdd = new User(username, password, first, last, adminLevel);
           // added = uDao.addUser(toAdd);

            if (added != false) {
                //category was successfully added , return them to the same screen
                forwardToJsp = "addCategory.jsp";
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
    

