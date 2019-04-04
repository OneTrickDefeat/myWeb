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
public class UserAddress {
    
    private int userAddressId, addressId;
    private String email;
    private boolean defaultAddress; 

    public UserAddress() {
    }

    public UserAddress(int userAddressId, int addressId, String email, boolean defaultAddress) {
        this.userAddressId = userAddressId;
        this.addressId = addressId;
        this.email = email;
        this.defaultAddress = defaultAddress;
    }

    public UserAddress(int addressId, String email, boolean defaultAddress) {
        this.addressId = addressId;
        this.email = email;
        this.defaultAddress = defaultAddress;
    }
    
    public UserAddress(int addressId, String email) {
        this.addressId = addressId;
        this.email = email;
    }

    public int getUserAddressId() {
        return userAddressId;
    }

    public void setUserAddressId(int userAddressId) {
        this.userAddressId = userAddressId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(boolean defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.addressId;
        hash = 53 * hash + Objects.hashCode(this.email);
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
        final UserAddress other = (UserAddress) obj;
        if (this.addressId != other.addressId) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "UserAddress{" + "userAddressId=" + userAddressId + ", addressId=" + addressId + ", email=" + email + ", defaultAddress=" + defaultAddress + '}';
    }
    
    
}
