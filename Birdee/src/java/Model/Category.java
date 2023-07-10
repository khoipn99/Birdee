/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class Category {
    
    private int categoryID;
    private String categoryName;
    private boolean status;
    private String description;
    private String image;

    public Category() {
    }

    public Category(int categoryID, String categoryName, boolean status, String description) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.status = status;
        this.description = description;
    }

    public Category(int categoryID, String categoryName, boolean status, String description, String image) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.status = status;
        this.description = description;
        this.image = image;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
