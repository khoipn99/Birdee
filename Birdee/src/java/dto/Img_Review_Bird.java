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
public class Img_Review_Bird {
    private int img_id_B;
    private String email_customer;
    private int order_detail_id_B;
    private String url;

    public Img_Review_Bird() {
    }

    public Img_Review_Bird(int img_id_B, String email_customer, int order_detail_id_B, String url) {
        this.img_id_B = img_id_B;
        this.email_customer = email_customer;
        this.order_detail_id_B = order_detail_id_B;
        this.url = url;
    }

    public int getImg_id_B() {
        return img_id_B;
    }

    public void setImg_id_B(int img_id_B) {
        this.img_id_B = img_id_B;
    }

    public String getEmail_customer() {
        return email_customer;
    }

    public void setEmail_customer(String email_customer) {
        this.email_customer = email_customer;
    }

    public int getOrder_detail_id_B() {
        return order_detail_id_B;
    }

    public void setOrder_detail_id_B(int order_detail_id_B) {
        this.order_detail_id_B = order_detail_id_B;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
