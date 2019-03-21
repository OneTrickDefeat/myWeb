/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Newsletter;
import org.junit.AfterClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Tom
 */
public class NewsletterDaoTest {
    
    public NewsletterDaoTest() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of addToNewsletter method, of class NewsletterDao.
     */
    @Test
    public void testAddToNewsletter() {
        System.out.println("addToNewsletter");
        Newsletter n = new Newsletter("test@test.com");
        NewsletterDao instance = new NewsletterDao("furniturestoretest");
        boolean expResult = true;
        boolean result = instance.addToNewsletter(n);
        assertFalse(result);
        
        if(!result){
            System.out.println("result successful"); 
            assertEquals(result,false);
        }
        
    }

    /**
     * Test of findNewsletterEmails method, of class NewsletterDao.
     */
    @Test
    public void testFindNewsletterEmails() {
        System.out.println("findNewsletterEmails");
        String email = "test@test.com";
        NewsletterDao instance = new NewsletterDao("furniturestoretest");
        Newsletter found = new Newsletter(3,"test@test.com");
        Newsletter expResult = found;
        Newsletter result = instance.findNewsletterEmails(email);
        assertEquals(expResult, result);
       
    }
    
}
