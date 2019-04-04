/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Address;
import Business.User;
import DAO.AddressDao;
import DAO.UserAddressDao;
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
        //retrieve information from form inside addDeliveryAddress.jsp
        int houseNumber = Integer.parseInt(request.getParameter("houseNumber"));
        String streetLine1 = request.getParameter("streetLine1");
        String streetLine2 = request.getParameter("streetLine2");
        String town = request.getParameter("town");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        String postcode = request.getParameter("postcode");
        
        //validate is it not empty or null
        if(streetLine1 != null && !streetLine1.equals("") && 
                town != null && !town.equals("") && 
                county != null && !county.equals("") && 
                country != null && !country.equals("")){
            
            //declare all required class and DAO references 
            HttpSession session = request.getSession();
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            AddressDao addressDao = new AddressDao("furniturestore");
            UserAddressDao uAddressDao = new UserAddressDao("furniturestore");
            Address newAddress = new Address(houseNumber, streetLine1, streetLine2, 
                            town, county, country, postcode);
            
            //check does user passed adderss exit inside Address table
            Address tempAddress = addressDao.findAddressByNoLineTown(newAddress.getHouseNo(), 
                    newAddress.getStreetLine1(), newAddress.getTown());
            
            //if address do not exist create new record inside adderess and
            //userAddress table
            if(tempAddress == null){
                if(addressDao.addNewAddress(newAddress)){
                    //create new record inside userAddress table
                    //matching user email and address id
                    
                    int id = addressDao.findAddressId(houseNumber, streetLine1, town);
                    uAddressDao.updateDefaultUserAddress(loggedInUser.getUsername());
                    
                    //if it does exist get details from Address table and create new 
                    //record matching email and adderessID inside userAddress table
                    uAddressDao.addNewAddress(id, loggedInUser.getUsername());
                    session.setAttribute("loggedInUserAddress", newAddress);
                    forwardToJsp = "myAccount.jsp";
                }
            } else {
                //if it does exist get details from Address table and create new 
                //record matching email and adderessID inside userAddress table
                uAddressDao.updateDefaultUserAddress(loggedInUser.getUsername());
                uAddressDao.addNewAddress(addressDao.findAddressId(houseNumber, streetLine1, town), loggedInUser.getUsername());              
                session.setAttribute("loggedInUserAddress", newAddress);
                forwardToJsp = "myAccount.jsp";
            }          
        }
        return forwardToJsp;
    }
    
    
    
}
