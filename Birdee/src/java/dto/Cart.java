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
public class Cart {
    private String email_customer;
    private int cart_id;

    public Cart() {
    }

    public Cart(String email_customer, int cart_id) {
        this.email_customer = email_customer;
        this.cart_id = cart_id;
    }

    public String getEmail_customer() {
        return email_customer;
    }

    public void setEmail_customer(String email_customer) {
        this.email_customer = email_customer;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    @Override
    public String toString() {
        return "Cart{" + "email_customer=" + email_customer + ", cart_id=" + cart_id + '}';
    }
    
    
}
