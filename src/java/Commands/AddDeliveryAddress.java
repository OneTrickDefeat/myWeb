/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Address;
import Business.User;
import DAO.AddressDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Audrius
 */
public class AddDeliveryAddress implements Command{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        String forwardToJsp = "";
        int houseNumber = Integer.parseInt(request.getParameter("houseNumber"));
        String streetLine1 = request.getParameter("streetLine1");
        String streetLine2 = request.getParameter("streetLine2");
        String town = request.getParameter("town");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        String postcode = request.getParameter("postcode");
        
        if(streetLine1 != null && !streetLine1.equals("") && 
                town != null && !town.equals("") && 
                county != null && !county.equals("") && 
                country != null && !country.equals("")){
            
            HttpSession session = request.getSession();
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            String email = loggedInUser.getUsername();
            AddressDao addressDao = new AddressDao("furniturestore");
            
            Address newAddress = new Address(houseNumber, streetLine1, streetLine2, 
                            town, county, country, postcode, email);
            
            boolean conformation = addressDao.addNewAddress(newAddress);
        }
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
