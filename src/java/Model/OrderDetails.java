/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class OrderDetails {
    private int oderDetailsID;
    private Order order;
    private Product product;
    private int quantity;
    private StatusOrder statusOrder;
    private int rate;
    private String comment;
    private boolean isRated;

    public OrderDetails() {
    }

    public OrderDetails(int oderDetailsID, Order order, Product product, int quantity) {
        this.oderDetailsID = oderDetailsID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
    }

    public OrderDetails(int oderDetailsID, Order order, Product product, int quantity, int rate, String comment) {
        this.oderDetailsID = oderDetailsID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.rate = rate;
        this.comment = comment;
    }

    public OrderDetails(int oderDetailsID, Order order, Product product, int quantity, StatusOrder statusOrder, int rate, String comment, boolean isRated) {
        this.oderDetailsID = oderDetailsID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.statusOrder = statusOrder;
        this.rate = rate;
        this.comment = comment;
        this.isRated = isRated;
    }

    public StatusOrder getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(StatusOrder statusOrder) {
        this.statusOrder = statusOrder;
    }

    public boolean isIsRated() {
        return isRated;
    }

    public void setIsRated(boolean isRated) {
        this.isRated = isRated;
    }

    public int getOderDetailsID() {
        return oderDetailsID;
    }

    public void setOderDetailsID(int oderDetailsID) {
        this.oderDetailsID = oderDetailsID;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

   
    
}
