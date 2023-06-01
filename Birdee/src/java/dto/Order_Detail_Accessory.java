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
public class Order_Detail_Accessory {
    private int order_detail_id_A;
    private int quantity;
    private float order_price;
    private int order_id;
    private int accessory_id;

    public Order_Detail_Accessory() {
    }

    public Order_Detail_Accessory(int order_detail_id_A, int quantity, float order_price, int order_id, int accessory_id) {
        this.order_detail_id_A = order_detail_id_A;
        this.quantity = quantity;
        this.order_price = order_price;
        this.order_id = order_id;
        this.accessory_id = accessory_id;
    }

    public int getOrder_detail_id_A() {
        return order_detail_id_A;
    }

    public void setOrder_detail_id_A(int order_detail_id_A) {
        this.order_detail_id_A = order_detail_id_A;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getOrder_price() {
        return order_price;
    }

    public void setOrder_price(float order_price) {
        this.order_price = order_price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getAccessory_id() {
        return accessory_id;
    }

    public void setAccessory_id(int accessory_id) {
        this.accessory_id = accessory_id;
    }
    
}
