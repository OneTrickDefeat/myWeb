/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
        if (product != null) {
            //   try {
//          	productCartID       cartID      productID       quantity
//                                  int cartId  int productId   int quantity
//               con = this.getConnection();
//               
//               String query = "INSERT INTO productcart (cartID, productID, quantity) "
//                       + "VALUES (?, ?, ?)";
//               ps = con.prepareStatement(query);
//               ps.setString(1, product.);
            //  } 

        }

        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product getProductByProductID(int productID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int addToCart(int cartID, int productID, int quantity) {

        int result = 0;
        Connection con = null;
        PreparedStatement ps = null;

        try {

            con = this.getConnection();
            String query = "INSERT INTO productcart (cartID, productID, quantity) "
                    + "VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            result = ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addToCart method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the addProduct method:\n" + e.getMessage());
            }
        }

        return result;
    }

    @Override
    public void removeProductByPID(int productID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static void main(String[] args) {
        CartDao cDao = new CartDao("furniturestore");

    }

}
