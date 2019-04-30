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
import DAO.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class UpdateUserCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        String email = loggedInUser.getUsername();
        String password = request.getParameter("password");
        String first = request.getParameter("firstName");
        String last = request.getParameter("lastName");
        int houseNo = Integer.parseInt(request.getParameter("houseNo"));
        String streetLine1 = request.getParameter("streetLine1");
        String streetLine2 = request.getParameter("streetLine2");
        String town = request.getParameter("town");
        String county = request.getParameter("county");
        String postCode = request.getParameter("postCode");
        String country = request.getParameter("country");
        Address newAddress = new Address(houseNo, streetLine1, streetLine2, 
            town, county, country, postCode);

        if (email != null && !email.equals("") && password != null && 
                !password.equals("") && first != null && !first.equals("")) {
            UserDao uDao = new UserDao("furniturestore");
            User toUpdate = new User(email, password, first, last);
            boolean updated = uDao.updateUser(toUpdate);

            //1.check does new addres exist inside address table
            //establish connection to AddressDao and create refference to Address class
            AddressDao aDao = new AddressDao("furniturestore");
            Address oldAddress = aDao.findAddressByNoLineTown(houseNo, streetLine1, town);
            //establish connection to UserAddress table
            UserAddressDao uAddressDao = new UserAddressDao("furniturestore");
            //2.if it does not exist create new record inside address table
            //check is oldAddress null or not           
            if(oldAddress == null){
                boolean addAddressConfirmation = aDao.addNewAddress(newAddress);
                //if new record was created
                if(addAddressConfirmation){
                    //3.change default address for current user to false
                    uAddressDao.updateDefaultUserAddress(email);
                    //get new added address id
                    int newAddressId = aDao.findAddressId(houseNo, streetLine1, town);
                    Address updatedAddress = aDao.findAddressByID(newAddressId);
                    //4.bind new address to the user
                    uAddressDao.addNewAddress(newAddressId, email);
                    //store updated address to session
                    session = request.getSession();
                    session.setAttribute("loggedInUserAddress", updatedAddress);
                }
            } else {
                //5.if address exist change deafult address for current user to false
                uAddressDao.updateDefaultUserAddress(email);
                //get new added address id
                int oldAddressId = aDao.findAddressId(houseNo, streetLine1, town);               
                //6.bind address to the user
                uAddressDao.changeDefaultAddress(oldAddressId, email);
                //store updated address to session
                session = request.getSession();
                session.setAttribute("loggedInUserAddress", oldAddress);
            }
 
            if (updated != false) {
                // Registration was successful, log the user in!
                User u = uDao.findUserByEmailPassword(email, password);

                session = request.getSession();
                session.setAttribute("loggedInUser", u);

                forwardToJsp = "index.jsp";
            } else {
                // The user couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "User couldn't be added to the database at this time"
                        + "Please <a href='myAccount.jsp'>go back</a> and try again.<br/>Try a different username!";
                session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='myAccount.jsp'>go back</a> and try again.";
            session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }

}
