/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
    public static void main(String[] args) {
        ArrayList<Orders> list = new ArrayList<>();
        list = getOrderByEmail("customer@gmail.com");
        System.out.println(list.size());
    }
}
