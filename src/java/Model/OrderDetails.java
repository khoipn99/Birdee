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
    private double rate;

    public OrderDetails() {
    }

    public OrderDetails(int oderDetailsID, Order order, Product product, int quantity) {
        this.oderDetailsID = oderDetailsID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
    }

    public OrderDetails(int oderDetailsID, Order order, Product product, int quantity, double rate) {
        this.oderDetailsID = oderDetailsID;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.rate = rate;
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
    
}
