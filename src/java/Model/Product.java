/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class Product {

    private int productId;
    private String name;
    private double price;
    private int quantity;
    private boolean status;
    private Type classType;
    private String classValue;
    private Date createDate;
    private Product parent;
    private Category category;
    private boolean isParent;
    private String description;
    private ArrayList<ImageProduct> images;
    private ArrayList<Product> children = new ArrayList<>();

    public Product() {
    }

    public Product(int productId, String name, double price, int quantity, boolean status, Type classType, String classValue, Product productParent, Category category, boolean isParent, String description) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.classType = classType;
        this.classValue = classValue;
        this.parent = productParent;
        this.category = category;
        this.isParent = isParent;
        this.description = description;
    }

    public Product(int productId, String name, double price, int quantity, boolean status, Type classType, String classValue, Date createDate, Product productParent, Category category, boolean isParent, String description) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.classType = classType;
        this.classValue = classValue;
        this.createDate = createDate;
        this.parent = productParent;
        this.category = category;
        this.isParent = isParent;
        this.description = description;
    }

    public Product(int productId, String name, double price, int quantity, boolean status, Type classType, String classValue, Date createDate, Product parent, Category category, boolean isParent, String description, ArrayList<ImageProduct> images) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.classType = classType;
        this.classValue = classValue;
        this.createDate = createDate;
        this.parent = parent;
        this.category = category;
        this.isParent = isParent;
        this.description = description;
        this.images = images;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Type getClassType() {
        return classType;
    }

    public void setClassType(Type classType) {
        this.classType = classType;
    }

    public String getClassValue() {
        return classValue;
    }

    public void setClassValue(String classValue) {
        this.classValue = classValue;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Product getParent() {
        return parent;
    }

    public void setParent(Product parent) {
        this.parent = parent;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isIsParent() {
        return isParent;
    }

    public void setIsParent(boolean isParent) {
        this.isParent = isParent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<ImageProduct> getImages() {
        return images;
    }

    public void setImages(ArrayList<ImageProduct> images) {
        this.images = images;
    }

    public ArrayList<Product> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<Product> children) {
        this.children = children;
    }

    

}
