/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Address;

/**
 *
 * @author Audrius
 */
public interface AddressDaoInterface {
    
    public Address findAddressByNoLineTown(int houseNumber, String line1, String town);  
    public boolean addNewAddress(Address newAddress);
    public boolean deleteAddress(int houseNo, String town, String county);
    
}
