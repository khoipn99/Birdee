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
public class Bird_Sub_Cart {
    private int cart_id;
    private int cate_id;
    private int quantity;
    private int bird_id;

    public Bird_Sub_Cart() {
    }
    
    public Bird_Sub_Cart(int cart_id, int cate_id, int quantity, int bird_id) {
        this.cart_id = cart_id;
        this.bird_id = bird_id;
        this.cate_id = cate_id;
        this.quantity = quantity;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getBird_id() {
        return bird_id;
    }

    public void setBird_id(int bird_id) {
        this.bird_id = bird_id;
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

    @Override
    public String toString() {
        return "Bird_Sub_Cart{" + "cart_id=" + cart_id + ", cate_id=" + cate_id + ", quantity=" + quantity + ", bird_id=" + bird_id + '}';
    }

    
    
    
}
