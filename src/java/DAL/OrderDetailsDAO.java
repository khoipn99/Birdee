/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Order;
import Model.OrderDetails;
import Model.Product;
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
public class OrderDetailsDAO extends DBContext {

    public void insertProductDetails(OrderDetails od) {
        try {
            String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                    + "           ([OrderId]\n"
                    + "           ,[ProductId]\n"
                    + "           ,[Quantity])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, od.getOrder().getOrderId());
            stm.setInt(2, od.getProduct().getProductId());
            stm.setInt(3, od.getQuantity());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<OrderDetails> getOrderDetailsByOrderID(int orderID) {
        ArrayList<OrderDetails> list = new ArrayList<>();
        OrderDAO oDao = new OrderDAO();
        Order order = oDao.getOrdersByID(orderID);
        ProductDAO pDao = new ProductDAO();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [OrderDetails] where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = pDao.getProductByID(rs.getInt(3), true);
                list.add(new OrderDetails(rs.getInt(1), order, product, rs.getInt(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public OrderDetails getOrderDetailsByID(int orderID) {
        OrderDAO oDao = new OrderDAO();
        Order order = oDao.getOrdersByID(orderID);
        ProductDAO pDao = new ProductDAO();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [OrderDetails] where OrderDetailsId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = pDao.getProductByID(rs.getInt(3), true);
                return new OrderDetails(rs.getInt(1), order, product, rs.getInt(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void rateStar(int orderID, int rate) {
        try {
            String sql = "UPDATE [dbo].[OrderDetails]\n"
                    + "   SET \n"
                    + "      [Rate] = ?\n"
                    + " WHERE OrderDetailsId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDouble(1, rate);
            stm.setInt(2, orderID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void rateComment(int orderID, String comment) {
        try {
            String sql = "UPDATE [dbo].[OrderDetails]\n"
                    + "   SET \n"
                    + "      [Comment] = ?\n"
                    + " WHERE OrderDetailsId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, comment);
            stm.setInt(2, orderID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
