/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import java.util.ArrayList;
import java.util.List;
import org.junit.AfterClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Tom
 */
public class ProductDaoTest {
    
    public ProductDaoTest() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of selectProductsContainingString method, of class ProductDao.
     */
    @Test
    public void testSelectProductsContainingString() {
        System.out.println("selectProductsContainingString");
        String searchText = "l";
        int catID = 0;
        int numResults = 17;
        ProductDao instance = new ProductDao("furniturestoretest");
        
        ArrayList<Product> result = instance.selectProductsContainingString(searchText, catID);
        assertEquals(numResults, result.size());
        
    }

    /**
     * Test of addProduct method, of class ProductDao.
     */
    @Test
    public void testAddProduct() {
        System.out.println("addProduct");
        Product c = new Product ( 3, 1, "testname","testcolour","testimage","testdescription",99.99);
        ProductDao instance = new ProductDao("furniturestoretest");
        boolean expResult = true;
        boolean result = instance.addProduct(c);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of findProductByProductName method, of class ProductDao.
     */
    @Test
    public void testFindProductByProductName() {
        System.out.println("findProductByProductName");
        String pName = "testname";
        ProductDao instance = new ProductDao("furniturestoretest");
        Product found = new Product(38,3,1,"testname","testcolour","test.jpg","testdescription",99.99);
        Product expResult = found;
        Product result = instance.findProductByProductName(pName);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of findProductByProductId method, of class ProductDao.
     */
    @Test
    public void testFindProductByProductId() {
        System.out.println("findProductByProductId");
        int pId = 38;
        ProductDao instance = new ProductDao("furniturestoretest");
        Product found = new Product(38,3,1,"testname","testcolour","test.jpg","testdescription",99.99);
        Product expResult = found;
        Product result = instance.findProductByProductId(pId);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of findProductsByCategoryId method, of class ProductDao.
     */
    @Test
    public void testFindProductsByCategoryId() {
        System.out.println("findProductsByCategoryId");
        int cID = 1;
        int numProducts = 4;
        ProductDao instance = new ProductDao("furniturestoretest");
        
        List<Product> result = instance.findProductsByCategoryId(cID);
        assertEquals(numProducts, result.size());
       
    }

    /**
     * Test of increaseProductQuantity method, of class ProductDao.
     */
    @Test
    public void testIncreaseProductQuantity() {
        System.out.println("increaseProductQuantity");
        ProductDao instance = null;
        instance.increaseProductQuantity();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
