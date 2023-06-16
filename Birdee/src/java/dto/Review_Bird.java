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
public class Review_Bird {
    private String email_customer;
    private int order_detail_id_B;
    private int rating;
    private String comment;
    private String email_platform_staff;

    public Review_Bird() {
    }

    public Review_Bird(String email_customer, int order_detail_id_B, int rating, String comment, String email_platform_staff) {
        this.email_customer = email_customer;
        this.order_detail_id_B = order_detail_id_B;
        this.rating = rating;
        this.comment = comment;
        this.email_platform_staff = email_platform_staff;
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getEmail_platform_staff() {
        return email_platform_staff;
    }

    public void setEmail_platform_staff(String email_platform_staff) {
        this.email_platform_staff = email_platform_staff;
    }

    @Override
    public String toString() {
        return "Review_Bird{" + "email_customer=" + email_customer + ", order_detail_id_B=" + order_detail_id_B + ", rating=" + rating + ", comment=" + comment + ", email_platform_staff=" + email_platform_staff + '}';
    }
    
    
    
}
