/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import java.util.ArrayList;

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
    
}
