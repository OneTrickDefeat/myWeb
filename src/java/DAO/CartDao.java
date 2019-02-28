/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Cart;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author D00197085
 */
public class CartDao extends Dao implements CartDaoInterface {

    public CartDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public Cart findCartByEmail(String email) {
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Cart cart = null;
        
        try {
            con = getConnection();
            String query = "SELECT * FROM cart WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            
            if(rs.next()){
                int cartID = rs.getInt("cartID");
                String cartEmail = rs.getString("email");
                Date lastUpdate = rs.getDate("lastUpdate");
                cart = new Cart(cartID, cartEmail, lastUpdate);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findCartByEmail method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the findCartByEmail method:\n" + e.getMessage());
            }
        }
        return cart;
    }

    @Override
    public boolean createNewCart(String email) {
        
        Connection con = null;
        PreparedStatement ps = null;
        
        //check does cart already exist with related email
//        if (findCartByEmail(email) == null) {
//            try {
//                con = this.getConnection();
//                String query = "INSERT INTO cart (email)";
//            }
//        }
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateCartEmail(String oldEmail) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
