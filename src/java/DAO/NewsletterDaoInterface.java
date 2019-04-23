/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Business.Newsletter;

/**
 *
 * @author Ahmed Khan
 */
public interface NewsletterDaoInterface {

    public boolean addToNewsletter(Newsletter n);

    public Newsletter findNewsletterEmails(String email);

    public boolean deleteFromNewsletter(Newsletter email);
}
