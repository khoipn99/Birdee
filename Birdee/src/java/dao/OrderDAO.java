/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Order_Detail_Accessory;
import dto.Order_Detail_Bird;
import dto.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public static ArrayList<Orders> getOrderByEmail(String email) {
        Connection cn = null;
        ArrayList<Orders> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select order_id, address, status_id, shipping_id, payment_id, order_date \n"
                        + "from Orders\n"
                        + "where email_customer = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while(rs!=null&& rs.next()){
                    Orders o = new Orders();
                    o.setOrder_id(rs.getInt("order_id"));
                    o.setEmail_customer(email);
                    o.setAddress(rs.getString("address"));
                    o.setStatus_id(rs.getInt("status_id"));
                    o.setShipping_id(rs.getInt("shipping_id"));
                    o.setPayment_id(rs.getInt("payment_id"));
                    o.setOrder_date(rs.getDate("order_date"));
                    list.add(o);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static ArrayList<Order_Detail_Bird> getOrderDetailBird(int orderid) {
        Connection cn = null;
        ArrayList<Order_Detail_Bird> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select order_detail_id_B, quantity, price, bird_id\n"
                        + "from Order_Detail_Bird\n"
                        + "where order_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderid);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    Order_Detail_Bird ob = new Order_Detail_Bird();
                    ob.setOrder_detail_id_B(rs.getInt("order_detail_id_B"));
                    ob.setOrder_id(orderid);
                    ob.setQuantity(rs.getInt("quantity"));
                    ob.setPrice(rs.getFloat("price"));
                    ob.setBird_id(rs.getInt("bird_id"));
                    list.add(ob);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order_Detail_Accessory> getOrderDetailAcessory(int orderid) {
        ArrayList<Order_Detail_Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select order_detail_id_A, quantity, order_price, accessory_id\n"
                        + "from Order_Detail_Accessory\n"
                        + "where order_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderid);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    Order_Detail_Accessory oa = new Order_Detail_Accessory();
                    oa.setOrder_detail_id_A(rs.getInt("order_detail_id_A"));
                    oa.setOrder_id(orderid);
                    oa.setQuantity(rs.getInt("quantity"));
                    oa.setOrder_price(rs.getFloat("order_price"));
                    oa.setAccessory_id(rs.getInt("accessory_id"));
                    list.add(oa);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static void main(String[] args) {
        ArrayList<Orders> list = new ArrayList<>();
        list = getOrderByEmail("customer@gmail.com");
        System.out.println(list.size());
    }
}
