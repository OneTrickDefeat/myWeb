/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.UserAddress;

/**
 *
 * @author Audrius
 */
public interface UserAddressDaoInterface {
    
    public UserAddress retrieveDefaultUseraddress(String email);
    public boolean addNewAddress(int addressID, String email);
    public UserAddress findAddressByEmailAndID(int addressID, String email);
    public boolean changeDefaultAddress(int addressID, String email);
    
}
