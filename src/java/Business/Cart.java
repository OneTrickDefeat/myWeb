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
public class Cart {
    
    private int cartID;
    private String email;
    private Date latUpdate;

    public Cart() {
    }

    public Cart(int cartID, String email, Date latUpdate) {
        this.cartID = cartID;
        this.email = email;
        this.latUpdate = latUpdate;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getLatUpdate() {
        return latUpdate;
    }

    public void setLatUpdate(Date latUpdate) {
        this.latUpdate = latUpdate;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 79 * hash + this.cartID;
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
        final Cart other = (Cart) obj;
        if (this.cartID != other.cartID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", email=" + email + ", latUpdate=" + latUpdate + '}';
    }
    
    
}
