/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ACE
 */
public class Order_Detail_Bird {
    private int order_detail_id_B;
    private int quantity;
    private float price;
    private int order_id;
    private int bird_id;

    public Order_Detail_Bird() {
    }

    public Order_Detail_Bird(int order_detail_id_B, int quantity, float price, int order_id, int bird_id) {
        this.order_detail_id_B = order_detail_id_B;
        this.quantity = quantity;
        this.price = price;
        this.order_id = order_id;
        this.bird_id = bird_id;
    }

    public int getOrder_detail_id_B() {
        return order_detail_id_B;
    }

    public void setOrder_detail_id_B(int order_detail_id_B) {
        this.order_detail_id_B = order_detail_id_B;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getBird_id() {
        return bird_id;
    }

    public void setBird_id(int bird_id) {
        this.bird_id = bird_id;
    }

    @Override
    public String toString() {
        return "Order_Detail_Bird{" + "order_detail_id_B=" + order_detail_id_B + ", quantity=" + quantity + ", price=" + price + ", order_id=" + order_id + ", bird_id=" + bird_id + '}';
    }
    
    
}
