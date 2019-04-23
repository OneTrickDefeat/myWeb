/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Newsletter;
import Business.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Ahmed Khan
 */
public class NewsletterDao extends Dao implements NewsletterDaoInterface {

    public NewsletterDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public boolean addToNewsletter(Newsletter n) {
        Connection con = null;
        PreparedStatement ps = null;
        if (findNewsletterEmails(n.getEmail()) == null) {
            try {
                con = this.getConnection();

                String query = "INSERT INTO newsletter(email) VALUES (?)";
                ps = con.prepareStatement(query);
                ps.setString(1, n.getEmail());

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addToNewsletter method:");
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
                    System.err.println("A problem occurred when closing down the addToNewsletter method:\n" + e.getMessage());
                }
            }
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Newsletter findNewsletterEmails(String email) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Newsletter c = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM newsletter WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String email2 = rs.getString("email");

                c = new Newsletter(id, email2);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findNewsletterEmails method:");
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
                System.err.println("A problem occurred when closing down the findNewsletterEmails method:\n" + e.getMessage());
            }
        }
        return c;

    }
    
    
    
    @Override
    public boolean deleteFromNewsletter(Newsletter n) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean deleted = false;
        try {
            con = this.getConnection();

            String query = "DELETE FROM newsletter WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, n.getEmail());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                deleted = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the deleteFromNewsletter method:");
            System.err.println("\t" + e.getMessage());
            deleted = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the deleteFromNewsletter method:\n" + e.getMessage());
            }
        }
        return deleted;
    }
}
