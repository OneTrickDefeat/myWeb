/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.sql.Date;

/**
 *
 * @author Audrius
 */
public class ProductCart {

    private int cartId, productId, quantity;

    public ProductCart() {
    }

    public ProductCart(int cartId, int productId, int quantity) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
    }

    public ProductCart(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

//    public String getEmail() {
//        return email;
//    }
//    public void setEmail(String email) {
//        this.email = email;
//    }
//    public Date getLastUpdate() {
//        return lastUpdate;
//    }
//
//    public void setLastUpdate(Date lastUpdate) {
//        this.lastUpdate = lastUpdate;
//    }
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + this.cartId;
        hash = 23 * hash + this.productId;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProductCart other = (ProductCart) obj;
        if (this.cartId != other.cartId) {
            return false;
        }
        return this.productId == other.productId;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", productId=" + productId + ", quantity=" + quantity + '}';
    }
}
