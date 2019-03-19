/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Category;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Tom
 */
public class CategoryDaoTest {
    
    public CategoryDaoTest() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of addCategory method, of class CategoryDao.
     */
    @Test
    public void testAddCategory() {
        System.out.println("addCategory");
        Category c = new Category("test");
        CategoryDao instance = new CategoryDao("furniturestoretest");
        boolean expResult = true;
        boolean result = instance.addCategory(c);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of findCategoryByCategoryName method, of class CategoryDao.
     */
    @Test
    public void testFindCategoryByCategoryName() {
        System.out.println("findCategoryByCategoryName");
        String cName = "Bedroom";
        CategoryDao instance = new CategoryDao("furniturestoretest");
        Category found = new Category(1,"Bedroom");
        Category expResult = found;
        Category result = instance.findCategoryByCategoryName(cName);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of deleteCategory method, of class CategoryDao.
     */
    @Test
    public void testDeleteCategory() {
        System.out.println("deleteCategory");
        Category c = new Category("test");
        CategoryDao instance = new CategoryDao("furniturestoretest");
        boolean expResult = true;
        boolean result = instance.deleteCategory(c);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getListOfCategories method, of class CategoryDao.
     */
    @Test
    public void testGetListOfCategories() {
        System.out.println("getListOfCategories");
        CategoryDao instance = new CategoryDao("furniturestoretest");
        int numOfCategories = 6;
       
        ArrayList<Category> result = instance.getListOfCategories();
        assertEquals(numOfCategories, result.size());
        
    }
    
}
