/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Audrius
 */
public class OrderProductDao extends Dao implements OrderProductDaoInterface{
    
    // When using the OrderProductDao you must supply the name of the database to access
    public OrderProductDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public boolean addNewRecord(int productId, String transactionId, int quantity) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean confirmation = false;
        
        if(findOrderByProductIdAndTransactionId(productId, transactionId)){
            try {
                con = this.getConnection();
                String query = "INSERT INTO orderProduct (productId, transactionId, "
                        + "quantity) VALUES (?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, productId);
                ps.setString(2, transactionId);
                ps.setInt(3, quantity);
                int insertedRows = ps.executeUpdate();
                
                if(insertedRows == 1){
                    confirmation = true;
                }
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addNewRecord "
                        + " method:");
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
                            + "the addNewRecord method:\n" + e.getMessage());
                }
            }
        }
        return confirmation;
    }

    @Override
    public boolean findOrderByProductIdAndTransactionId(int productId, String transactionId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean confirmation = false;
        
        try {
            con = this.getConnection();
            String query = "SELECT * FROM orderProduct WHERE productId = ? AND "
                    + "transactionId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setString(2, transactionId);
            rs = ps.executeQuery();
            
            if(rs.next()){
                confirmation = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the "
                    + "findOrderByProductIdAndTransactionId method:");
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
                System.err.println("A problem occurred when closing down the "
                        + "findOrderByProductIdAndTransactionId method:\n" + e.getMessage());
            }
        }
        return confirmation;
    }
    
}
