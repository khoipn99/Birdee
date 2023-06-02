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
public class Bird {
    private int bird_id;
    private String bird_name;
    private Date dob;
    private boolean gender;
    private float height;
    private float weight;
    private String origin;
    private String description;
    private int quantity;
    private float price;
    private String email_shop_staff;
    private int cate_id;
    private String email_platform_staff; 

    public Bird() {
    }

    public Bird(int bird_id, String bird_name, Date dob, boolean gender, float height, float weight, String origin, String description, int quantity, float price, String email_shop_staff, int cate_id, String email_platform_staff) {
        this.bird_id = bird_id;
        this.bird_name = bird_name;
        this.dob = dob;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.origin = origin;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.email_shop_staff = email_shop_staff;
        this.cate_id = cate_id;
        this.email_platform_staff = email_platform_staff;
    }

    public int getBird_id() {
        return bird_id;
    }

    public void setBird_id(int bird_id) {
        this.bird_id = bird_id;
    }

    public String getBird_name() {
        return bird_name;
    }

    public void setBird_name(String bird_name) {
        this.bird_name = bird_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getEmail_shop_staff() {
        return email_shop_staff;
    }

    public void setEmail_shop_staff(String email_shop_staff) {
        this.email_shop_staff = email_shop_staff;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getEmail_platform_staff() {
        return email_platform_staff;
    }

    public void setEmail_platform_staff(String email_platform_staff) {
        this.email_platform_staff = email_platform_staff;
    }

    @Override
    public String toString() {
        return "Bird{" + "bird_id=" + bird_id + ", bird_name=" + bird_name + ", dob=" + dob + ", gender=" + gender + ", height=" + height + ", weight=" + weight + ", origin=" + origin + ", description=" + description + ", quantity=" + quantity + ", price=" + price + ", email_shop_staff=" + email_shop_staff + ", cate_id=" + cate_id + ", email_platform_staff=" + email_platform_staff + '}';
    }

 


    
        
}
