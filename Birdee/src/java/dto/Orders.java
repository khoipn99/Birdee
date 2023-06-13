/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author ACE
 */
public class Orders {
    private int order_id;
    private String address;
    private int status_id;
    private int shipping_id;
    private int payment_id;
    private String email_customer;
    private Date order_date;

    public Orders() {
    }

    public Orders(int order_id, String address, int status_id, int shipping_id, int payment_id, String email_customer, Date order_date) {
        this.order_id = order_id;
        this.address = address;
        this.status_id = status_id;
        this.shipping_id = shipping_id;
        this.payment_id = payment_id;
        this.email_customer = email_customer;
        this.order_date = order_date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public int getShipping_id() {
        return shipping_id;
    }

    public void setShipping_id(int shipping_id) {
        this.shipping_id = shipping_id;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getEmail_customer() {
        return email_customer;
    }

    public void setEmail_customer(String email_customer) {
        this.email_customer = email_customer;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    @Override
    public String toString() {
        return "Orders{" + "order_id=" + order_id + ", address=" + address + ", status_id=" + status_id + ", shipping_id=" + shipping_id + ", payment_id=" + payment_id + ", email_customer=" + email_customer + ", order_date=" + order_date + '}';
    }
    
    
}
