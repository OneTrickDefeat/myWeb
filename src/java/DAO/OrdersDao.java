/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Audrius
 */
public class OrdersDao extends Dao implements OrdersDaoInterface{

    //when using the OrdersDao the name of database must be provided
    public OrdersDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public boolean doesOrderExist(String email, String transactionId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean confirmation = false;
       
        try {
            con = this.getConnection();
            
            String query = "SELECT transactionId FROM orders WHERE email = ? AND "
                    + " transactionId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, transactionId);
            rs = ps.executeQuery();
            
            if(rs.next()){
                confirmation = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the doesOrderExistForEmail method:");
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
                System.err.println("A problem occurred when closing down the doesOrderExistForEmail method:\n" + e.getMessage());
            }
        }
        return confirmation;
    }

    @Override
    public boolean createNewOrder(String transactionId, String userEmailAddress) {
        
        Connection con = null;
        PreparedStatement ps = null;
        boolean confirmation = false;
        
        //check does order alrerady exist
        if(!doesOrderExist(userEmailAddress, transactionId)){
            try {
                con = this.getConnection();
                String query = "INSERT INTO orders (transactionId, email) "
                        + "VALUES (?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, transactionId);
                ps.setString(2, userEmailAddress);
                int insertedRows = ps.executeUpdate();
                if(insertedRows == 1){
                    confirmation = true;
                }
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the createNewOrder "
                        + "method:");
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
                    System.err.println("A problem occurred when closing down "
                            + "the createNewOrder method:\n" + e.getMessage());
                }
            }
        }
        return confirmation;
    }

    @Override
    public Orders findOrdersByTransactionId(String trans) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Orders o = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM orders WHERE transactionId = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, trans);

            rs = ps.executeQuery();
            if (rs.next()) {
                date productId = rs.getInt("productId");
                String name = rs.getString("email");
                

                o = new Orders(productId, catId, quantity, name, colour, image, description, price);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findProductByProductName method:");
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
                System.err.println("A problem occurred when closing down the findProductByProductName method:\n" + e.getMessage());
            }
        }
        return p;     // p may be null   
    }
    
}
