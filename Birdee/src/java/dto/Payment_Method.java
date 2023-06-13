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
public class Payment_Method {
    private int payment_id;
    private String payment_name;

    public Payment_Method() {
    }

    public Payment_Method(int payment_id, String payment_name) {
        this.payment_id = payment_id;
        this.payment_name = payment_name;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getPayment_name() {
        return payment_name;
    }

    public void setPayment_name(String payment_name) {
        this.payment_name = payment_name;
    }

    @Override
    public String toString() {
        return "Payment_Method{" + "payment_id=" + payment_id + ", payment_name=" + payment_name + '}';
    }
    
    
}
