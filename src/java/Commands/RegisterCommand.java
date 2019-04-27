/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Address;
import Business.Cart;
import Business.User;
import DAO.AddressDao;
import DAO.CartDao;
import DAO.UserAddressDao;
import DAO.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class RegisterCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;

        String email = request.getParameter("email");
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

        boolean adminLevel = false;

        if (email != null && !email.equals("") && password != null && !password.equals("") && first != null && !first.equals("")) {
            UserDao uDao = new UserDao("furniturestore");
            AddressDao aDao = new AddressDao("furniturestore");
            UserAddressDao userAddressDao = new UserAddressDao("furniturestore");
            Address address = null;
            //
            User toAdd = new User(email, password, first, last, adminLevel);
            boolean addedUser = uDao.addUser(toAdd);

//            
//            boolean addedAddress = aDao.addNewAddress(newAddress);
            if (addedUser != false) {
                // Registration was successful, log the user in!
                User u = uDao.findUserByEmailPassword(email, password);

                //check does this address exist already in address table
                Address foundAddress = aDao.findAddressByNoLineTown(houseNo,
                        streetLine1, town);
                //if address does not exist create new record and bind to the user
                if (foundAddress == null) {
                    address = new Address(houseNo, streetLine1, streetLine2,
                            town, county, postCode, country);
                    aDao.addNewAddress(address);
                    int addressId = aDao.findAddressId(houseNo, streetLine1, town);
                    userAddressDao.addNewAddress(addressId, u.getUsername()); 
                } else {
                    //if address does exist bind to the user
                    address = aDao.findAddressByNoLineTown(houseNo, streetLine1, town);
                    userAddressDao.addNewAddress(address.getAddressId(), email);
                }

                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", u);
                session.setAttribute("loggedInUserAddress", address);
                
                //create cart here
                CartDao cDao = new CartDao("furniturestore");
                cDao.createNewCart(email);
                Cart newCart = cDao.findCartByEmail(email);
                session.setAttribute("loggedInUserCart", newCart);
                forwardToJsp = "index.jsp";

                // CALL THE CART DAO TO CREATE A NEW CART USING THE USERS EMAIL.
            } else {
                // The user couldn't be added to the database
                // Send the user to the error page and inform them of this
                String errorMessage = "User couldn't be added to the database at this time"
                        + "Please <a href='register.jsp'>go back</a> and try again.<br/>Try a different username!";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // One or more fields were missing
            // Send the user to the error page and inform them of this
            String errorMessage = "One or more fields were missing. Please <a href='register.jsp'>go back</a> and try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }

}
