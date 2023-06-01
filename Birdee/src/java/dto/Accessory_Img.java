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
public class Accessory_Img {
    private int A_img_id;
    private int accessory_id;
    private String url;
    private boolean is_main_img;

    public Accessory_Img() {
    }

    public Accessory_Img(int A_img_id, int accessory_id, String url, boolean is_main_img) {
        this.A_img_id = A_img_id;
        this.accessory_id = accessory_id;
        this.url = url;
        this.is_main_img = is_main_img;
    }

    public int getA_img_id() {
        return A_img_id;
    }

    public void setA_img_id(int A_img_id) {
        this.A_img_id = A_img_id;
    }

    public int getAccessory_id() {
        return accessory_id;
    }

    public void setAccessory_id(int accessory_id) {
        this.accessory_id = accessory_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isIs_main_img() {
        return is_main_img;
    }

    public void setIs_main_img(boolean is_main_img) {
        this.is_main_img = is_main_img;
    }
    
    
}
