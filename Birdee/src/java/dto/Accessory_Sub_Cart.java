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
public class Accessory_Sub_Cart {
    private int cart_id;
    private int accessory_id;
    private int cate_id;
    private int quantity;

    public Accessory_Sub_Cart() {
    }

    public Accessory_Sub_Cart(int cart_id, int accessory_id, int cate_id, int quantity) {
        this.cart_id = cart_id;
        this.accessory_id = accessory_id;
        this.cate_id = cate_id;
        this.quantity = quantity;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getAccessory_id() {
        return accessory_id;
    }

    public void setAccessory_id(int accessory_id) {
        this.accessory_id = accessory_id;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
