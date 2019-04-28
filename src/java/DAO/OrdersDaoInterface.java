/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Orders;

/**
 *
 * @author Audrius
 */
public interface OrdersDaoInterface {
    
    //check does orded row exist for particular user
    public boolean doesOrderExist(String email, String transactionId);
    
    //create a new record with transactionId and email
    public boolean createNewOrder(String transactionId, String userEmailAddress);
    
    //find all orders by trans id
    public Orders findOrdersByTransactionId(String trans);
    
}
