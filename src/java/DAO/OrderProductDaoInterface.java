/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.OrderProduct;
import java.util.List;

/**
 *
 * @author Audrius
 */
public interface OrderProductDaoInterface {
    
    //add a new record to OrderProductTable using transactionId, productId 
    // and quantity
    public boolean addNewRecord(int productId, String transactionId, int quantity);
    
    //check does order exist inside OrderProduct table matching productId and 
    //transactionId
    public boolean findOrderByProductIdAndTransactionId(int productId, String transactionId);
    
    //get order list matching transactionId
    public List<OrderProduct> getAllOrdersMacthingTransactionId(String transactionId);
}
