/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Tom
 */
public class CategoryDao extends Dao implements CategoryDaoInterface {

    public CategoryDao(String databaseName) {
        super(databaseName);
    }

    public String findCategoryNameByCategoryID(int cID){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String catName = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM category WHERE catID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, cID);
            rs = ps.executeQuery();
            
            while(rs.next()){
                catName = rs.getString("catName");
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findCategoryByCategoryID method:");
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
                System.err.println("A problem occurred when closing down the findCategoryByCategoryID method:\n" + e.getMessage());
            }
        }
        return catName;
    }
    
    @Override
    public boolean addCategory(Category c) {
    Connection con = null;
        PreparedStatement ps = null;
        if (findCategoryByCategoryName(c.getCatName()) == null) {
            try {
                con = this.getConnection();

                
                String query = "INSERT INTO category( catName) VALUES ( ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, c.getCatName());
              

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addCategory method:");
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
                    System.err.println("A problem occurred when closing down the addCategory method:\n" + e.getMessage());
                }
            }
            return true;
        } else {
            return false;
        } 
    }

    @Override
    public Category findCategoryByCategoryName(String cName) {
      Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Category c = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM category WHERE catName = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, cName);

            rs = ps.executeQuery();
            if (rs.next()) {
                int catId = rs.getInt("catId");
                String catName = rs.getString("catName");
                
                c = new Category(catId, catName);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findCategoryByCategoryName method:");
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
                System.err.println("A problem occurred when closing down the findCategoryByCategoryName method:\n" + e.getMessage());
            }
        }
        return c;     // c may be null  
 
    }

    @Override
    public boolean deleteCategory(Category c) {
    Connection con = null;
        PreparedStatement ps = null;
        if (findCategoryByCategoryName(c.getCatName()) != null) {
            try {
                con = this.getConnection();

                
                String query = "DELETE FROM category WHERE catName = (?)";
                ps = con.prepareStatement(query);
                ps.setString(1, c.getCatName());
              

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the deleteCategory method:");
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
                    System.err.println("A problem occurred when closing down the deleteCategory method:\n" + e.getMessage());
                }
            }
            return true;
        } else {
            return false;
        } 
    }
    @Override
    public ArrayList<Category> getListOfCategories() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Category> list = new ArrayList();
        Category c = null;
        
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM category";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()){
                c = new Category(rs.getInt("catId"), rs.getString("catName"));
                list.add(c);
            }   
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the getAllStock method:");
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
                System.err.println("A problem occurred when closing down the getListOfCategories() method:\n" + e.getMessage());
            }
        }
        return list;
    }
    
}
