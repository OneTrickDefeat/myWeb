/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Audrius
 */
public class AddressDao extends Dao implements AddressDaoInterface {

    public AddressDao(String databaseName) {
        super(databaseName);
    }

    public Address findAddressByID(int id){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Address foundAddress = null;
        
        try {
            con = this.getConnection();
            String query = "SELECT * FROM address "
                    + "WHERE addressId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);;
            rs = ps.executeQuery();
            
            if(rs.next()){
                foundAddress = new Address(rs.getInt("houseNo"), rs.getString("streetLine1"), 
                    rs.getString("streetLine2"), rs.getString("town"), 
                    rs.getString("county"), rs.getString("country"), 
                    rs.getString("postcode"));
            }   
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findAddressId method:");
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
                System.err.println("A problem occurred when closing down the findAddressId method:\n" + e.getMessage());
            }
        }
        return foundAddress;
    }
    
    public int findAddressId(int houseNo, String line1, String town){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int foundAddressID = 0;
        
        try {
            con = this.getConnection();
            String query = "SELECT addressId FROM address "
                    + "WHERE houseNo = ? AND streetline1 = ? AND town = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, houseNo);
            ps.setString(2, line1);
            ps.setString(3, town);
            rs = ps.executeQuery();
            
            if(rs.next()){
                foundAddressID = rs.getInt("addressId");
            }   
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findAddressId method:");
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
                System.err.println("A problem occurred when closing down the findAddressId method:\n" + e.getMessage());
            }
        }
        return foundAddressID;
    }
    
    @Override
    public boolean addNewAddress(Address newAddress) {

        Connection con = null;
        PreparedStatement ps = null;
        boolean confirmation = false;
        //if statement checks does addres already exist inside address table
        if (findAddressByNoLineTown(newAddress.getHouseNo(), newAddress.getStreetLine1(),
                newAddress.getTown()) == null) {

            try {
                con = this.getConnection();

                String query = "INSERT INTO address (houseNo, streetline1, "
                        + "streetline2, town, county, country, postcode) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, newAddress.getHouseNo());
                ps.setString(2, newAddress.getStreetLine1());
                ps.setString(3, newAddress.getStreetLine2());
                ps.setString(4, newAddress.getTown());
                ps.setString(5, newAddress.getCounty());
                ps.setString(6, newAddress.getCountry());
                ps.setString(7, newAddress.getPostcode());

                int insertedRows = ps.executeUpdate();
                if(insertedRows == 1){
                    confirmation = true;
                }
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
            
        }

        return confirmation;
    }

    @Override
    public Address findAddressByNoLineTown(int houseNumber, String line1, String town) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Address foundAddress = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM address WHERE houseNo = ? "
                    + "AND streetLine1 = ? AND town = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, houseNumber);
            ps.setString(2, line1);
            ps.setString(3, town);
             
            rs = ps.executeQuery();
            
            if (rs.next()) {

                int houseNo = rs.getInt("houseNo");
                String streetLine1 = rs.getString("streetLine1");
                String streetLine2 = rs.getString("streetLine1");
                String newTown = rs.getString("town");
                String county = rs.getString("county");
                String country = rs.getString("country");
                String postcode = rs.getString("postcode");
                
                foundAddress = new Address(houseNo, streetLine1, streetLine2, 
                    newTown, county, country, postcode);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findAddressByNoLineTown method:");
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
                System.err.println("A problem occurred when closing down the findAddressByNoLineTown method:\n" + e.getMessage());
            }
        }
        return foundAddress;
    }

    @Override
    public boolean deleteAddress(int houseNo, String town, String county) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();

            String query = "DELETE FROM address WHERE houseNo = ? AND town = ? "
                    + "AND county = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, houseNo);
            ps.setString(2, town);
            ps.setString(3, county);
            
            int rowAffected = ps.executeUpdate();
            if (rowAffected == 1){
                removed = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the deleteAddress method:");
            System.err.println("\t" + e.getMessage());
            removed = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the deleteAddress method:\n" + e.getMessage());
            }
        }
        return removed;
    }
      
}
