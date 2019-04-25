/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Cart;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Audrius
 */
public class CartDaoTest {
    
    private CartDao cDao;
    
    public CartDaoTest() {
        cDao = new CartDao("furniturestoretest");
    }
  
    /**
     * Test of findCartByEmail method, of class CartDao.
     */
    @Test
    public void testFindCartByEmail() throws ParseException {
        System.out.println("testFindCartByEmail");
        String email = "audrius@gmail.com";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date yourDate = sdf.parse("2019-03-27");
        Cart expResult = new Cart(1, "audrius@gmail.com", yourDate);
        Cart result = cDao.findCartByEmail(email);
        assertEquals(expResult, result);;
    }
    
    /**
     * Test of testFindCartByEmailWhenNoEmailFound method, of class CartDao. 
     * No email found
     */
    @Test
    public void testFindCartByEmailWhenNoEmailFound() throws ParseException {
        System.out.println("testFindCartByEmailWhenNoEmailFound");
        String email = "test123@gmail.com";
        Cart expResult = null;
        Cart result = cDao.findCartByEmail(email);
        assertEquals(expResult, result);;
    }

    /**
     * Test of testFindCartByEmailWhenNoEmailProvided method, of class CartDao. 
     * No email provided
     */
    @Test
    public void testFindCartByEmailWhenNoEmailProvided() throws ParseException {
        System.out.println("testFindCartByEmailWhenNoEmailProvided");
        String email = "";
        Cart expResult = null;
        Cart result = cDao.findCartByEmail(email);
        assertEquals(expResult, result);;
    }
    
    /**
     * Test of testCreateNewCartWhenCartAlreadyExist method, of class CartDao.
     * Cart already exist, cannot be created
     */
    @Test
    public void testCreateNewCartWhenCartAlreadyExist() {
        System.out.println("testCreateNewCartWhenCartAlreadyExist");
        String email = "audrius@gmail.com";
        boolean expResult = false;
        boolean result = cDao.createNewCart(email);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of testCreateNewCart method, of class CartDao.
     * Cart are not assigned to x email
     */
    @Test
    public void testCreateNewCart() {
        System.out.println("createNewCart");
        String email = "test@gmail.com";
        boolean result = cDao.createNewCart(email);
        //assertTrue(result);
        
        if(result){
            System.out.println("\"Method returned appropriately, confirming \"\n" +
            " + \"database changed by trying to remove what was added\"");
            boolean rowDeleted = cDao.deleteCart("test@gmail.com");
            assertEquals(rowDeleted, true);
        }       
    }
    
    /**
     * Test of testCreateNewCart_CartAlreadyExist method, of class CartDao.
     * Cart already created
     */
    @Test
    public void testCreateNewCart_CartAlreadyExist() {
        System.out.println("testCreateNewCart_CartAlreadyExist");
        String email = "audrius@gmail.com";
        boolean result = cDao.createNewCart(email);
        boolean expectedResult = false;
        assertEquals(result, expectedResult);         
    }
    
    /**
     * Test of testCreateNewCart_NoEmailProvided method, of class CartDao.
     * Email string is empty
     */
    @Test
    public void testCreateNewCart_NoEmailProvided() {
        System.out.println("testCreateNewCart_NoEmailProvided");
        String email = null;
        boolean result = cDao.createNewCart(email);
        boolean expectedResult = false;
        assertEquals(result, expectedResult);         
    }
    
}
