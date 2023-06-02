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
public class Accessory {
    private int accessory_id;
    private String name;
    private float price;
    private int quantity;
    private String description;
    private String email_shop_staff;
    private int cate_id;
    private String email_platform_staff;
    

    public Accessory() {
    }

    public Accessory(int accessory_id, String name, float price, int quantity, String description, String email_shop_staff, int cate_id, String email_platform_staff) {
        this.accessory_id = accessory_id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.email_shop_staff = email_shop_staff;
        this.cate_id = cate_id;
        this.email_platform_staff = email_platform_staff;
    }

    public int getAccessory_id() {
        return accessory_id;
    }

    public void setAccessory_id(int accessory_id) {
        this.accessory_id = accessory_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

}
