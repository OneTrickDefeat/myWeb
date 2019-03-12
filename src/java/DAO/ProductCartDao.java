/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Product;
import Business.ProductCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00197085
 */
public class ProductCartDao extends Dao implements ProductCartDaoInterface {

    public ProductCartDao(String databaseName) {
        super(databaseName);
    }

    List<Product> cartItems = new ArrayList<Product>();

    public List getItemsByCartId(int cartID) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductCart> producCartList = new ArrayList();

        if (cartID > 0) {
            try {

                con = this.getConnection();

                String query = "SELECT productID, cartID, quantity FROM productcart "
                        + "WHERE cartID = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, cartID);
                rs = ps.executeQuery();

                while (rs.next()) {

                    int productID = rs.getInt("productID");
                    int userCartID = rs.getInt("cartID");
                    int quantity = rs.getInt("quantity");

                    producCartList.add(new ProductCart(userCartID, productID, quantity));

                }

            } catch (SQLException e) {
                System.err.println("\tA problem occurred during the getItemsByCartId method:");
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
                    System.err.println("A problem occurred when closing down the getItemsByCartId method:\n" + e.getMessage());
                }
            }
        }

        return producCartList;

    }

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
        
        ProductCart productCart = getProductByCartIdAndProductId(productID, cartID);
        if(productCart != null){
            
        }

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
    public boolean removeProductByPID(int productID, int cartID) {
        int result = 0;
        Connection con = null;
        PreparedStatement ps = null;
        boolean confirmation = false;
        try {

            con = this.getConnection();
            String query = "DELETE FROM productcart "
                    + "WHERE cartID = ? "
                    + "AND productID = ? ";
            ps = con.prepareStatement(query);
            ps.setInt(1, cartID);
            ps.setInt(2, productID);
            
            result = ps.executeUpdate();
            if(result == 1){
                confirmation = true;
            } 

        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the removeProductByPID method:");
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
                System.err.println("A problem occurred when closing down the removeProductByPID method:\n" + e.getMessage());
            }
        }

        return confirmation;
      }

    @Override
    public ProductCart getProductByCartIdAndProductId(int productID, int cartID) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ProductCart productCart = null;

        try {
            con = this.getConnection();
            String query = "SELECT * FROM productcart "
                    + "WHERE productId = ? AND cartId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, cartID);
            rs = ps.executeQuery();

            //if data was found create a new productCart object
            if (rs.next()) {
                int foundCartID = rs.getInt("cartID");
                int foundProductID = rs.getInt("productID");
                int foundQuantity = rs.getInt("quantity");

                productCart = new ProductCart(foundCartID, foundProductID, foundQuantity);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the getProductByCartIdAndProductId method:");
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
                System.err.println("A problem occurred when closing down the getProductByCartIdAndProductId method:\n" + e.getMessage());
            }
        }
        return productCart;     // productCart may be null  
    }
    
//    public static void main(String[] args) {
//        ProductCartDao pa = new ProductCartDao("furniturestore");
//        System.out.println(pa.getProductByCartIdAndProductId(9, 1));

    //}

    @Override
    public boolean updateQuantity(int cartID, int productID, int quantity) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean updated = false;
        try {
            con = this.getConnection();
            String query = "UPDATE productcart "
                    + "SET quantity = ? "
                    + "WHERE cartID = ? AND productID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, cartID);
            ps.setInt(3, productID);
            
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected != 0){
                updated = true;
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the updateQuantity method:");
            System.err.println("\t" + e.getMessage());
            updated = false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the updateQuantity method:\n" + e.getMessage());
            }
        }
        
        return updated;
    }

}
