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
public class User {
    private int customerId;
    private String fullName;
    private String phone;
    private String username;
    private String emailID;
    private String password;
    private Date dob;
    private String address;
    private String avatar;
    private Role role;
    private User manager;
    private boolean status;
    private String description;

    public User() {
    }

    public User(int customerId, String fullName, String phone, String username, String emailID, String password, Date dob, String address, String avatar, Role role, User manager, boolean status, String description) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.username = username;
        this.emailID = emailID;
        this.password = password;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.manager = manager;
        this.status = status;
        this.description = description;
    }

    public User(int customerId, String fullName, String phone, String username, String emailID, Date dob, String address, String avatar, Role role, User manager, boolean status, String description) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.phone = phone;
        this.username = username;
        this.emailID = emailID;
        this.dob = dob;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.manager = manager;
        this.status = status;
        this.description = description;
    }
    
    

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

   

    
    
}
