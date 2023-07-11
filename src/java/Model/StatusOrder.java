/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author dell
 */
public class StatusOrder {
    private int statusOrderID;
    private String statusValue;

    public StatusOrder() {
    }

    public StatusOrder(int statusOrderID, String statusValue) {
        this.statusOrderID = statusOrderID;
        this.statusValue = statusValue;
    }

    public int getStatusOrderID() {
        return statusOrderID;
    }

    public void setStatusOrderID(int statusOrderID) {
        this.statusOrderID = statusOrderID;
    }

    public String getStatusValue() {
        return statusValue;
    }

    public void setStatusValue(String statusValue) {
        this.statusValue = statusValue;
    }
    
    
}
