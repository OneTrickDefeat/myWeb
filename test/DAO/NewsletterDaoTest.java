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
import org.junit.BeforeClass;

/**
 *
 * @author Tom
 */
public class NewsletterDaoTest {

    private NewsletterDao nDao;

    public NewsletterDaoTest() {
        nDao = new NewsletterDao("furniturestoretest");
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
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
        boolean result = nDao.addToNewsletter(n);
        assertTrue(result);

        if (result) {
            System.out.println("result successful");
            boolean deleteTheRow = nDao.deleteFromNewsletter(n);
            assertEquals(deleteTheRow, true);
        }

    }

    /**
     * Test of findNewsletterEmails method, of class NewsletterDao.
     */
    @Test
    public void testFindNewsletterEmails() {
        System.out.println("findNewsletterEmails");
        String email = "ahmed.khan11@gmail.com";
        NewsletterDao instance = new NewsletterDao("furniturestoretest");
        Newsletter found = new Newsletter(29, "ahmed.khan11@gmail.com");
        Newsletter expResult = found;
        Newsletter result = instance.findNewsletterEmails(email);
        assertEquals(expResult, result);

    }

}
