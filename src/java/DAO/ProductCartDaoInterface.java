/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;

/**
 *
 * @author D00197085
 */
public interface ProductCartDaoInterface {
    
    public void addProductToCartByPID(int productID);
    
    public Product getProductByProductID(int productID);
    
    public void addToCart(Product product);
    
    public void removeProductByPID(int productID);
 
}
