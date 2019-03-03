/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Cart;

/**
 *
 * @author Audrius
 */
public interface CartDaoInterface {
    
    public Cart findCartByEmail(String email);
    public boolean createNewCart(String email);
    
}
