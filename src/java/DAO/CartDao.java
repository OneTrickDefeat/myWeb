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

            if (rs.next()) {
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
        boolean confirmation = false;
        
        //check does cart already exist with related email
        if (findCartByEmail(email) == null && email != null && email.equals("")) {
            try {
                con = this.getConnection();
                String query = "INSERT INTO cart (email) VALUES (?)";
                ps = con.prepareStatement(query);
                ps.setString(1, email);
                // Because this is CHANGING the database, use the executeUpdate method
                int rowsInserted = ps.executeUpdate();

                // Find out what the id generated for this entry was
                //ResultSet generatedKeys = ps.getGeneratedKeys();

                if (rowsInserted == 1) {
                    confirmation = true;
                }
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the createNewCart method:");
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
                    System.err.println("A problem occurred when closing down the createNewCart method:\n" + e.getMessage());
                }
            }
        }
        return confirmation;
    }
    
    @Override
    public boolean deleteCart(String email){
        Connection con = null;
        PreparedStatement ps = null;
        boolean removed = false;
        try {
            con = this.getConnection();
            
            String query = "DELETE FROM cart WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected != 0){
                removed = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the deleteCart method:");
            System.err.println("\t" + e.getMessage());
            removed = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the deleteCart method:\n" + e.getMessage());
            }
        }
        return removed;
    }
    
    public static void main(String[] args) {
        CartDao cDao = new CartDao("furniturestore");
        int id = cDao.findCartByEmail("audrius@gmail.com").getCartID();
        System.out.println(id);
    }
    
}
