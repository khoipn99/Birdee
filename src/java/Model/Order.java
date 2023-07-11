/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class Order {
    private int orderId;
    private User orderFromUser;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String customerAddress;
    private User employee;
    private Date dateTime;
    private PaymentMethod paymentMethod;
    private double totalOrder;
    private StatusOrder statusOrder;
    private boolean isRate;
    private ArrayList<Product> productOrder;

    public Order() {
    }

    public Order(int orderId, User orderFromUser, String customerName, String customerEmail, String customerPhone, String customerAddress, User employee, Date dateTime, PaymentMethod paymentMethod, double totalOrder, StatusOrder statusOrder, boolean isRate) {
        this.orderId = orderId;
        this.orderFromUser = orderFromUser;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.employee = employee;
        this.dateTime = dateTime;
        this.paymentMethod = paymentMethod;
        this.totalOrder = totalOrder;
        this.statusOrder = statusOrder;
        this.isRate = isRate;
    }

    public Order(int orderId, User orderFromUser, String customerName, String customerEmail, String customerPhone, String customerAddress, User employee, Date dateTime, PaymentMethod paymentMethod, double totalOrder, StatusOrder statusOrder, boolean isRate, ArrayList<Product> productOrder) {
        this.orderId = orderId;
        this.orderFromUser = orderFromUser;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.employee = employee;
        this.dateTime = dateTime;
        this.paymentMethod = paymentMethod;
        this.totalOrder = totalOrder;
        this.statusOrder = statusOrder;
        this.isRate = isRate;
        this.productOrder = productOrder;
    }
    
    public ArrayList<Product> getProductOrder() {
        return productOrder;
    }

    public void setProductOrder(ArrayList<Product> productOrder) {
        this.productOrder = productOrder;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getOrderFromUser() {
        return orderFromUser;
    }

    public void setOrderFromUser(User orderFromUser) {
        this.orderFromUser = orderFromUser;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public User getEmployee() {
        return employee;
    }

    public void setEmployee(User employee) {
        this.employee = employee;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(double totalOrder) {
        this.totalOrder = totalOrder;
    }

    public StatusOrder getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(StatusOrder statusOrder) {
        this.statusOrder = statusOrder;
    }

    public boolean isIsRate() {
        return isRate;
    }

    public void setIsRate(boolean isRate) {
        this.isRate = isRate;
    }

   

    
}
