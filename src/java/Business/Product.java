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
public class Product {
    private int productId, catId, stockQuantity;
    private String name, colour, image, description;
    private double price;

    public Product() {
    }

    public Product(int productId, String name) {
        this.productId = productId;
        this.name = name;
    }
    

    public Product(int productId, int catId, int stockQuantity, String name, String colour, String image, String description, double price) {
        this.productId = productId;
        this.catId = catId;
        this.stockQuantity = stockQuantity;
        this.name = name;
        this.colour = colour;
        this.image = image;
        this.description = description;
        this.price = price;
    }
    
    public Product(int catId, int stockQuantity, String name, String colour, String image, String description, double price) {
        this.catId = catId;
        this.stockQuantity = stockQuantity;
        this.name = name;
        this.colour = colour;
        this.image = image;
        this.description = description;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public int getCatId() {
        return catId;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public String getName() {
        return name;
    }

    public String getColour() {
        return colour;
    }

    public String getImage() {
        return image;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + this.productId;
        hash = 89 * hash + Objects.hashCode(this.name);
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
        final Product other = (Product) obj;
        if (this.productId != other.productId) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", catId=" + catId + ", stockQuantity=" + stockQuantity + ", name=" + name + ", colour=" + colour + ", image=" + image + ", description=" + description + ", price=" + price + '}';
    }
    
    
}
