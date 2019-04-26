/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Audrius
 */
public interface ProductDaoInterface {
    
    
    
    public ArrayList<Product> selectProductsContainingString(String searchText, int catID);
    
    //add a product to the database
    //returns true if product added and false if not
    public boolean addProduct(Product c);
    
    //find first user with that user name
    public Product findProductByProductName(String pName);
    
    //find cart record by product id
    public Product findProductByProductId(int pId);
    
    //increase quantity by 1 for product in productCart table
    public void increaseProductQuantity();
    
    public List<Product> findProductsByCategoryId(int cID);
    public boolean updateProductDetails(int pId, String pName, String pColour, double price, 
        int pQuantity, String pDescription);
    
}
