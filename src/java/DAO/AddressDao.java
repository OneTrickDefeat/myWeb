/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Audrius
 */
public class AddressDao extends Dao implements AddressDaoInterface{
    
    public AddressDao(String databaseName) {
        super(databaseName);
    }

    public boolean addNewAddress(Address newAddress) {
        
        Connection con = null;
        PreparedStatement ps = null;
        
//        if(){
//            
//        }
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
