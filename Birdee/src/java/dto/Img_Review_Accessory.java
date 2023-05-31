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
public class Img_Review_Accessory {
    private int img_id_A;
    private String email_customer;
    private int order_detail_id_A;
    private String url;

    public Img_Review_Accessory() {
    }

    public Img_Review_Accessory(int img_id_A, String email_customer, int order_detail_id_A, String url) {
        this.img_id_A = img_id_A;
        this.email_customer = email_customer;
        this.order_detail_id_A = order_detail_id_A;
        this.url = url;
    }

    public int getImg_id_A() {
        return img_id_A;
    }

    public void setImg_id_A(int img_id_A) {
        this.img_id_A = img_id_A;
    }

    public String getEmail_customer() {
        return email_customer;
    }

    public void setEmail_customer(String email_customer) {
        this.email_customer = email_customer;
    }

    public int getOrder_detail_id_A() {
        return order_detail_id_A;
    }

    public void setOrder_detail_id_A(int order_detail_id_A) {
        this.order_detail_id_A = order_detail_id_A;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
