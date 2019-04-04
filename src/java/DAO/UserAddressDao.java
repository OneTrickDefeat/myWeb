/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.UserAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Audrius
 */
public class UserAddressDao extends Dao implements UserAddressDaoInterface{
    
    public UserAddressDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public boolean addNewAddress(int addressID, String email) {
        Connection con = null;
        PreparedStatement ps = null;
        
        UserAddressDao userAddressDao = new UserAddressDao("furniturestore");
        UserAddress uAddress = userAddressDao.findAddressByEmailAndID(addressID, email);
        
        if(uAddress == null){
            try {
                con = this.getConnection();
                String query = "INSERT INTO useraddress (email, addressId, defaultAddress) "
                        + "VALUES (?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, email);
                ps.setInt(2, addressID);
                ps.setBoolean(3, true);
                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addNewAddress method:");
                System.err.println("\t" + e.getMessage());
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        freeConnection(con);
                    }
                } catch (SQLException e) {
                    System.err.println("A problem occurred when closing down the addNewAddress method:\n" + e.getMessage());
                }
            } 
            return true;
        } else {
            return false;
        }
    }

    @Override
    public UserAddress findAddressByEmailAndID(int addressID, String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserAddress userAddress = null;
        
        try {
            con = this.getConnection();
            String query = "SELECT * FROM useraddress "
                    + "WHERE addressId = ? AND email = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, addressID); 
            ps.setString(2, email);
            rs = ps.executeQuery();
            if(rs.next()){
                userAddress = new UserAddress(rs.getInt("addressId"), rs.getString("email"));
            }          
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the doesProductCartRowExist method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the doesProductCartRowExist method:\n" + e.getMessage());
            }
        }
        return userAddress;
    }
    
    @Override
    public UserAddress retrieveDefaultUseraddress(String email){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserAddress uAddress = null;
        try {
            con = this.getConnection();
            String query = "SELECT * FROM useraddress "
                    + "WHERE email = ? AND defaultAddress = true";
            ps = con.prepareStatement(query);
            ps.setString(1, email); 
            rs = ps.executeQuery();
            if(rs.next()){
                uAddress = new UserAddress(rs.getInt("addressId"), rs.getString("email"), rs.getBoolean("defaultAddress"));
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the doesProductCartRowExist method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the doesProductCartRowExist method:\n" + e.getMessage());
            }
        }
        return uAddress;
    }
    
    //with email passeed we want to change all address related to it to false
    public boolean updateDefaultUserAddress(String email){
        Connection con = null;
        PreparedStatement ps = null;
        boolean confirmation = false;
        try {
            con = this.getConnection();
            String query = "UPDATE useraddress SET defaultAddress = false "
                    + "WHERE email = ? AND defaultAddress = true";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            int updateCount = ps.executeUpdate();
            if(updateCount == 1){
                confirmation = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the updatedefaultUserAddress method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the updatedefaultUserAddress method:\n" + e.getMessage());
            }
        }
        return confirmation;
    }
    
}
