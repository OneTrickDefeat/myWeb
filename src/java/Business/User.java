/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.Objects;

/**
 *
 * @author Tom
 */

// * Based on Users table
// *      create table if not exists users
//        (
//            username varchar(20) not null,
//            password varchar(10) not null,
//            firstName varchar(20),
//            lastName varchar(30),
//            isAdmin boolean not null default FALSE,
//            PRIMARY KEY (username)
//        );
// */

public class User implements Comparable<User>
{
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private boolean isAdmin;

    public User(String email, String password, String firstName, String lastName) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    public User(String email, String password, String firstName, String lastName, boolean isAdmin) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isAdmin = isAdmin;
    }
       
    public String getUsername()
    {
        return email;
    }

    public String getPassword()
    {
        return password;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public boolean isAdmin()
    {
        return isAdmin;
    }

    @Override
    public String toString()
    {
        return "User{" + "email=" + email + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", isAdmin=" + isAdmin + '}';
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.email);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        return true;
    }
    
    @Override
    public int compareTo(User u)
    {
        return this.email.compareTo(u.email);
    }
}
