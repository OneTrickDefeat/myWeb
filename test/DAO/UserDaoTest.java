/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.User;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author D00197085
 */
public class UserDaoTest {
    
    //creating connection to dummy database
    private UserDao uDao;
    
    public UserDaoTest() {
        uDao = new UserDao("furniturestoretest");
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of findUserByEmailPassword method, of class UserDao.
     */
    @Test
    public void testFindUserByEmailPassword() {
        System.out.println("findUserByEmailPassword");
        String email = "audrius@gmail.com";
        String pword = "password";
        User expResult = new User("audrius@gmail.com", "$2a$12$LQOo75r2y0amxd1mksKMgu/6./DsktqMSEObTq8hVdwYVA5XixFi2", 
                "audrius", "senkus");
        User result = uDao.findUserByEmailPassword(email, pword);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of findUserByEmailPassword method, of class UserDao.(Where no 
     * match found).
     * 
     */
    @Test
    public void testFindUserByEmailPassword_NoUserFound() {
        System.out.println("findUserByEmailPassword_NoUserFound");
        String email = "nouser@gmail.com";
        String pword = "empty";
        User expResult = null;
        User result = uDao.findUserByEmailPassword(email, pword);
        assertEquals(expResult, result);
    }

    /**
     * Test of findUserByEmailPassword method, of class UserDao.(Where no 
     * match found).
     * 
     */
    @Test
    public void testFindUserByEmailPassword_NoDetailsPassed() {
        System.out.println("findUserByEmailPassword_NoDetailsPassed");
        String email = "";
        String pword = "";
        User expResult = null;
        User result = uDao.findUserByEmailPassword(email, pword);
        assertEquals(expResult, result);
    }

    /**
     * Test of findUserByUsername method, of class UserDao.
     */
    @Test
    public void testFindUserByUsername() {
        System.out.println("findUserByUsername");
        String uname = "audrius@gmail.com";
        User expResult = new User("audrius@gmail.com", "$2a$12$LQOo75r2y0amxd1mksKMgu/6./DsktqMSEObTq8hVdwYVA5XixFi2", 
                "audrius", "senkus");
        User result = uDao.findUserByUsername(uname);
        assertEquals(expResult, result);
    }

    /**
     * Test of findUserByUsername method, of class UserDao. 
     * (Where no match found)
     */
    @Test
    public void testFindUserByUsername_NoMatchFound() {
        System.out.println("findUserByUsername_NoMatchFound");
        String uname = "noMatch@gmail.com";
        User expResult = null;
        User result = uDao.findUserByUsername(uname);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of findUserByUsername method, of class UserDao. 
     * (Where no username passed)
     */
    @Test
    public void testFindUserByUsername_NoUsernamePassed() {
        System.out.println("findUserByUsername_NoUsernamePassed");
        String uname = "";
        User expResult = null;
        User result = uDao.findUserByUsername(uname);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of checkIfUserIsAdmin method, of class UserDao.
     */
    @Test
    public void testCheckIfUserIsAdmin() {
        System.out.println("checkIfUserIsAdmin");
        String uname = "audrius@gmail.com";
        boolean expResult = true;
        boolean result = uDao.checkIfUserIsAdmin(uname);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of checkIfUserIsAdmin method, of class UserDao.
     * (User are not admin)
     */
    @Test
    public void testCheckIfUserIsAdmin_NotAdmin() {
        System.out.println("checkIfUserIsAdmin_NotAdmin");
        String uname = "test@gmail.com";
        boolean expResult = false;
        boolean result = uDao.checkIfUserIsAdmin(uname);
        assertEquals(expResult, result);
    }

    /**
     * Test of addUser method, of class UserDao.
     */
    @Test
    public void testAddUser() {
        System.out.println("addUser");
        User u = new User("testEmail@gmail.com", "password", "testFirstName", 
                        "testLastName");
        boolean result = uDao.addUser(u);
        assertTrue(result);
        
        if(result) {
            System.out.println("Method returned appropriately, confirming "
                    + "database changed by trying to remove what was added");
            boolean rowDeleted = uDao.removeUser(u);
            assertEquals(rowDeleted, true);
        }
    }
    
    /**
     * Test of addUser method, of class UserDao.
     * (Where user already exist, and cant be added)
     */
    @Test
    public void testAddUser_UserExist() {
        System.out.println("addUser_UserAlreadyExist");
        User u = new User("audrius@gmail.com", "password", "audrius", 
                        "senkus");
        boolean expResult = false;
        boolean result = uDao.addUser(u);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of updateUser method, of class UserDao.
     */
    @Test
    public void testUpdateUser() {
        System.out.println("updateUser");
        User u = new User("audrius@gmail.com", "password", "TestAudrius", 
                        "TestSenkus");
        boolean expResult = true;
        boolean result = uDao.updateUser(u);
        assertEquals(expResult, result);
    }
    
    /**
     * Test of updateUser method, of class UserDao.
     * (No user exist with such a email)
     */
    @Test
    public void testUpdateUser_NoEmailFound() {
        System.out.println("updateUser");
        User u = new User("testNoExist@gmail.com", "password", "TestAudrius", 
                        "TestSenkus");
        boolean expResult = false;
        boolean result = uDao.updateUser(u);
        assertEquals(expResult, result);
    }

    /**
     * Test of updateUserPassword method, of class UserDao.
     */
    @Test
    public void testUpdateUserPassword() {
        System.out.println("updateUserPassword");
        String oldPassword = "password";
        String newPassword = "password1";
        String email = "audrius@gmail.com";
        int expResult = 1;
        int result = uDao.updateUserPassword(oldPassword, newPassword, email);
        assertTrue(expResult == result);
        
        if(expResult == result) {
            System.out.println("Method returned appropriately, confirming "
                    + "database changed by trying to remove what was added");
            int rowUpdated = uDao.updateUserPassword(newPassword, oldPassword, email);
            assertEquals(rowUpdated, 1);
        }
        
    }
    
}
