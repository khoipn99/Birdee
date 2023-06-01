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
public class Bird_Img {
    private int B_img_id;
    private int bird_id;
    private String url;
    private boolean is_main_img;

    public Bird_Img() {
    }

    public Bird_Img(int B_img_id, int bird_id, String url, boolean is_main_img) {
        this.B_img_id = B_img_id;
        this.bird_id = bird_id;
        this.url = url;
        this.is_main_img = is_main_img;
    }

    public int getB_img_id() {
        return B_img_id;
    }

    public void setB_img_id(int B_img_id) {
        this.B_img_id = B_img_id;
    }

    public int getBird_id() {
        return bird_id;
    }

    public void setBird_id(int bird_id) {
        this.bird_id = bird_id;
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
