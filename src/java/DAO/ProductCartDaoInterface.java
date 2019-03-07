/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import Business.ProductCart;

/**
 *
 * @author D00197085
 */
public interface ProductCartDaoInterface {
    
    public void addProductToCartByPID(int productID);
    
    public Product getProductByProductID(int productID);
    
    public int addToCart(int cartID, int productID, int quantity);
    
    public void removeProductByPID(int productID);
    
    public ProductCart getProductByCartIdAndProductId(int productID, int cartID);
 
}
