/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.Objects;

/**
 *
 * @author D00197085
 */
public class OrderProduct {

    String transactionId;
    private int productId, quantity;

    public OrderProduct() {
    }

    public OrderProduct(String transactionId, int productId, int quantity) {
        this.transactionId = transactionId;
        this.productId = productId;
        this.quantity = quantity;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public int getproductId() {
        return productId;
    }

    public void setproductId(int orderId) {
        this.productId = orderId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.transactionId);
        hash = 97 * hash + this.productId;
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
        final OrderProduct other = (OrderProduct) obj;
        if (this.productId != other.productId) {
            return false;
        }
        if (!Objects.equals(this.transactionId, other.transactionId)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "OrderProduct{" + "transactionId=" + transactionId + ", orderId=" + productId + ", quantity=" + quantity + '}';
    }

    
}
