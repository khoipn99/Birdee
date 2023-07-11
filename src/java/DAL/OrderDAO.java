/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Order;
import Model.PaymentMethod;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class OrderDAO extends DBContext {

    public void insert(Order order) {

        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([OrderID]\n"
                    + "           ,[OrderFromUser]\n"
                    + "           ,[Customer_Name]\n"
                    + "           ,[Customer_Email]\n"
                    + "           ,[Customer_Phone]\n"
                    + "           ,[Customer_Address]\n"
                    + "           ,[DateTime]\n"
                    + "           ,[PaymentMethod]\n"
                    + "           ,[TotalOrder]\n"
                    + "           ,[Status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, order.getOrderId());
            stm.setInt(2, order.getOrderFromUser().getUserID());
            stm.setString(3, order.getCustomerName());
            stm.setString(4, order.getCustomerEmail());
            stm.setString(5, order.getCustomerPhone());
            stm.setString(6, order.getCustomerAddress());
            stm.setDate(7, order.getDateTime());
            stm.setInt(8, order.getPaymentMethod().getPaymentId());
            stm.setDouble(9, order.getTotalOrder());
            stm.setInt(10, 1);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int getMaxID() {
        try {
            String sql = "SELECT Max(OrderID) as 'max'\n"
                    + "  FROM [Orders]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("max");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Order> getOrdersByUser(int userID) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            UserDAO uDao = new UserDAO();
            String sql = "  SELECT *\n"
                    + "  FROM [Orders] where OrderFromUser = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User fromUser = new User();
                fromUser.setUserID(userID);
                
                PaymentMethodDAO pmDao = new PaymentMethodDAO();
                PaymentMethod pm = pmDao.getPaymentByID(rs.getInt("PaymentMethod"));

                list.add(new Order(rs.getInt("OrderID"),
                        fromUser,
                        rs.getString("Customer_Name"),
                        rs.getString("Customer_Email"),
                        rs.getString("Customer_Phone"),
                        rs.getString("Customer_Address"),
                        null,
                        rs.getDate("DateTime"),
                        pm,
                        rs.getDouble("TotalOrder"),
                        rs.getInt("Status")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
