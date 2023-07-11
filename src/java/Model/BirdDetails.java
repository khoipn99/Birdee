/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author dell
 */
public class BirdDetails {
    private Product bird;
    private Date dob;
    private boolean gender;
    private double height;
    private double weight;
    private String origin;

    public BirdDetails() {
    }

    public BirdDetails(Product bird, Date dob, boolean gender, double height, double weight, String origin) {
        this.bird = bird;
        this.dob = dob;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.origin = origin;
    }

    public Product getBird() {
        return bird;
    }

    public void setBird(Product bird) {
        this.bird = bird;
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

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
}
