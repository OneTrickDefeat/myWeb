/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.Objects;

/**
 *
 * @author Audrius
 */
public class Address {
    
    private int addressId, houseNo;
    private String streetLine1, streetLine2, town, county, country, postcode;

    public Address() {
    }

    public Address(int houseNo, String streetLine1, String streetLine2, String town, String county, String country, String postcode) {
        this.houseNo = houseNo;
        this.streetLine1 = streetLine1;
        this.streetLine2 = streetLine2;
        this.town = town;
        this.county = county;
        this.country = country;
        this.postcode = postcode;
    }

    public Address(int houseNo, String streetLine1, String town) {
        this.houseNo = houseNo;
        this.streetLine1 = streetLine1;
        this.town = town;
    }
    
    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getHouseNo() {
        return houseNo;
    }

    public void setHouseNo(int houseNo) {
        this.houseNo = houseNo;
    }

    public String getStreetLine1() {
        return streetLine1;
    }

    public void setStreetLine1(String streetLine1) {
        this.streetLine1 = streetLine1;
    }

    public String getStreetLine2() {
        return streetLine2;
    }

    public void setStreetLine2(String streetLine2) {
        this.streetLine2 = streetLine2;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }


    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + this.addressId;
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
        final Address other = (Address) obj;
        if (this.houseNo != other.houseNo) {
            return false;
        }
        if (!Objects.equals(this.streetLine1, other.streetLine1)) {
            return false;
        }
        if (!Objects.equals(this.town, other.town)) {
            return false;
        }
        return true;
    }

    

    @Override
    public String toString() {
        return "Address{" + "addressId=" + addressId + ", houseNo=" + houseNo + ", streetLine1=" + streetLine1 + ", streetLine2=" + streetLine2 + ", town=" + town + ", county=" + county + ", country=" + country + ", postcode=" + postcode + '}';
    }
    
    
    
}
