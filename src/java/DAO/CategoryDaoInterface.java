/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Category;
import java.util.ArrayList;

/**
 *
 * @author D00197085
 */
public interface CategoryDaoInterface {

    public ArrayList<Category> getListOfCategories();
    
    //add a category to the database
    //returns true if category added and false if not
    public boolean addCategory(Category c);
    
    //find first user with that user name
    public Category findCategoryByCategoryName(String cName);

    //delete a category from the database.
    //returns true if deleted , false if not
    public boolean deleteCategory(Category c);

}
