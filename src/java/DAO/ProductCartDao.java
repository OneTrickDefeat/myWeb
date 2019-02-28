/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author D00197085
 */
public class ProductCartDao extends Dao implements ProductCartDaoInterface {

    public ProductCartDao(String databaseName) {
        super(databaseName);
    }
    
    List<Product> cartItems = new ArrayList<Product>();

    @Override
    public void addProductToCartByPID(int productID) {
        Connection con = null;
        PreparedStatement ps = null;
        Product product = getProductByProductID(productID);
        if (product != null){
//           try {
//               con = this.getConnection();
//               
//               String query = "INSERT";
//           } 
            
        }  
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product getProductByProductID(int productID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void addToCart(Product product) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeProductByPID(int productID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
