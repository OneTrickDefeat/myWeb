/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Category;
import Business.Product;
import Business.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Audrius
 */
public class ProductDao extends Dao implements ProductDaoInterface {

    public ProductDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public ArrayList<Product> selectProductsContainingString(String searchText, int catID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList();

        try {
            con = getConnection();

            if (catID < 1) {
                String query = "SELECT * FROM product WHERE name LIKE ?";
                ps = con.prepareStatement(query);
                ps.setString(1, "%" + searchText + "%");
            } else {
                String query = "SELECT * FROM product WHERE name LIKE ? AND catId = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, "%" + searchText + "%");
                ps.setInt(2, catID);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("productId"),
                        rs.getInt("catId"), rs.getInt("stockQuantity"),
                        rs.getString("name"), rs.getString("colour"),
                        rs.getString("image"), rs.getString("description"),
                        rs.getDouble("price"));
                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the selectProductsContainingString() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the selectProductsContainingString() method: " + e.getMessage());
            }
        }
        return products;
    }

    @Override
    public boolean addProduct(Product c) {
        Connection con = null;
        PreparedStatement ps = null;
        if (findProductByProductName(c.getName()) == null) {
            try {
                con = this.getConnection();

                //method to check does this product already exist in ProductCart table
                //if it does call another method called increaseQuantity() by 1
                
                String query = "INSERT INTO product( catId, name, colour, price , stockQuantity , description) VALUES ( ? , ? , ? , ? , ? , ?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, c.getCatId());
                ps.setString(2, c.getName());
                ps.setString(3, c.getColour());
                ps.setDouble(4, c.getPrice());
                ps.setInt(5, c.getStockQuantity());
                ps.setString(6, c.getDescription());

                ps.execute();
            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the addProduct method:");
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
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Product findProductByProductName(String pName) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Product p = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM product WHERE name = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, pName);

            rs = ps.executeQuery();
            if (rs.next()) {
                int productId = rs.getInt("productId");
                String name = rs.getString("name");

                p = new Product(productId, name);
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

    @Override
    public Product findProductByProductId(int pId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Product p = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM product WHERE productId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, pId);

            rs = ps.executeQuery();
            if (rs.next()) {
                int productId = rs.getInt("productId");
                String name = rs.getString("name");
                String colour = rs.getString("colour");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("stockQuantity");
                String description = rs.getString("description");
                int catId = rs.getInt("catId");
                String image = rs.getString("image");

                p = new Product(productId, catId, quantity, name, colour, image, description, price);
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

    @Override
    public List<Product> findProductsByCategoryId(int cID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> p = new ArrayList();
        try {
            con = this.getConnection();

            String query = "SELECT * FROM product WHERE catId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, cID);

            rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String name = rs.getString("name");
                String colour = rs.getString("colour");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("stockQuantity");
                String description = rs.getString("description");
                int catId = rs.getInt("catId");
                String image = rs.getString("image");
                
                p.add(new Product(productId, catId, quantity, name, colour, image, description, price));
                
            }

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the findProductByCategotyId method:");
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
                System.err.println("A problem occurred when closing down the findProductByCategotyId method:\n" + e.getMessage());
            }
        }
        
        return p;
    }

    @Override
    public void increaseProductQuantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean updateProductDetails(int pId, String pName, String pColour, double price, int pQuantity, String pDescription) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean confirmation = false;
        
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM product WHERE productId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, pId);
            rs = ps.executeQuery();
            
            if(rs.next()){
                String queryUpdate = "UPDATE product SET "
                        + "name = ? "
                        + "colour = ? "
                        + "price = ? "
                        + "stockQuantity = ? "
                        + "description = ? "
                        + "WHERE productId = ?";
                ps = con.prepareStatement(queryUpdate);
                ps.setString(1, pName);
                ps.setString(2, pColour);
                ps.setDouble(3, price);
                ps.setInt(4, pQuantity);
                ps.setString(5, pDescription);
                ps.setInt(6, pId);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected != 0) {
                        confirmation = true;
                }
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the updateProductDetails method:");
            System.err.println("\t" + e.getMessage());
            confirmation = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the updateProductDetails method:\n" + e.getMessage());
            }
        }
        return confirmation;
    }

}
