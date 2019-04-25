/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Address;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Audrius
 */
public class AddressDaoTest {
    
    private AddressDao aDao;
    
    public AddressDaoTest() {
        aDao = new AddressDao("furniturestoretest");
    }

    /**
     * Test of findAddressByID method, of class AddressDao.
     */
    @Test
    public void testFindAddressByID() {
        System.out.println("findAddressByID");
        int id = 1; 
        Address expResult = new Address(26, "Vincent Avenue", null, "Dundalk", "Louth", 
                "Ireland", "0000");
        Address result = aDao.findAddressByID(id);
        assertEquals(expResult, result);
    }

    /**
     * Test of testFindAddressByID_NoAddressFound method, of class AddressDao.
     * Address was not found
     */
    @Test
    public void testFindAddressByID_NoAddressFound() {
        System.out.println("testFindAddressByID_NoAddressFound");
        int id = 0; 
        Address expResult = null;
        Address result = aDao.findAddressByID(id);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of findAddressId method, of class AddressDao.
     */
    @Test
    public void testFindAddressId() {
        System.out.println("findAddressId");
        int houseNo = 26;
        String line1 = "Vincent Avenue";
        String town = "Dundalk";
        int expResult = 1;
        int result = aDao.findAddressId(houseNo, line1, town);
        assertEquals(expResult, result);
    }

    /**
     * Test of testFindAddressId_NoIdFound method, of class AddressDao.
     */
    @Test
    public void testFindAddressId_NoIdFound() {
        System.out.println("testFindAddressId_NoIdFound");
        int houseNo = 3;
        String line1 = "No Line";
        String town = "No Town";
        int expResult = 0;
        int result = aDao.findAddressId(houseNo, line1, town);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of addNewAddress method, of class AddressDao.
     */
    @Test
    public void testAddNewAddress() {
        System.out.println("addNewAddress");
        Address newAddress = new Address(33, "line1", "line2", "town", 
                "county", "country", "postCode");
        boolean expResult = true;
        boolean result = aDao.addNewAddress(newAddress);
        
        if(result){
            System.out.println("\"Method returned appropriately, confirming \"\n" +
            " + \"database changed by trying to remove what was added\"");
            boolean rowDeleted = aDao.deleteAddress(newAddress.getHouseNo(), 
                    newAddress.getTown(), newAddress.getCounty());
            assertEquals(rowDeleted, true);
        }
    }

    /**
     * Test of addNewAddress method, of class AddressDao.
     */
    @Test
    public void testAddNewAddress_AlreadyExist() {
        System.out.println("addNewAddress");
        Address newAddress = new Address(26, "Vincent Avenue", "Dundalk");
        boolean result = aDao.addNewAddress(newAddress);
        
        if(result){
            System.out.println("\"Method returned appropriately, confirming \"\n" +
            " + \"database changed by trying to remove what was added\"");
            boolean rowDeleted = aDao.deleteAddress(newAddress.getHouseNo(), 
                    newAddress.getTown(), newAddress.getCounty());
            assertEquals(rowDeleted, true);
        }
    }
    
    /**
     * Test of findAddressByNoLineTown method, of class AddressDao.
     */
    @Test
    public void testFindAddressByNoLineTown() {
        System.out.println("findAddressByNoLineTown");
        int houseNumber = 26;
        String line1 = "Vincent Avenue";
        String town = "Dundalk";
        Address expResult = new Address(26, "Vincent Avenue", null, "Dundalk", 
                "Louth", "Ireland", "0000");
        Address result = aDao.findAddressByNoLineTown(houseNumber, line1, town);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of findAddressByNoLineTown method, of class AddressDao.
     * No address details was found
     */
    @Test
    public void testFindAddressByNoLineTown_NoMatchesFound() {
        System.out.println("testFindAddressByNoLineTown_NoMatchesFound");
        int houseNumber = 1;
        String line1 = "NA";
        String town = "NA";
        Address expResult = null;
        Address result = aDao.findAddressByNoLineTown(houseNumber, line1, town);
        assertEquals(expResult, result);
    }
    
}
