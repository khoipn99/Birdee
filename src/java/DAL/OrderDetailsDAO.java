/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Order;
import Model.OrderDetails;
import Model.Product;
import Model.StatusOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
                    + "           ,[Quantity]\n"
                    + "           ,[DeliverStatus]\n"
                    + "           ,[IsRated])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, od.getOrder().getOrderId());
            stm.setInt(2, od.getProduct().getProductId());
            stm.setInt(3, od.getQuantity());
            stm.setInt(4, od.getStatusOrder().getStatusOrderID());
            stm.setBoolean(5, od.isIsRated());
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
        StatusOrderDAO soDao = new StatusOrderDAO();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [OrderDetails] where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Product product = pDao.getProductDetailsByID(rs.getInt(3));
                StatusOrder status = soDao.getStatusByID(rs.getInt("DeliverStatus"));

                list.add(new OrderDetails(rs.getInt(1), order, product, rs.getInt(4), status, rs.getInt("Rate"), rs.getString("Comment"), rs.getBoolean("IsRated")));
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

    public ArrayList<OrderDetails> getAllOrderDetailsByShop(int offset, int recordsPerPage, String textSearch, int sortOption, int userID, int status) {
        ArrayList<OrderDetails> list = new ArrayList<>();
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT od.*\n"
                    + "  FROM [OrderDetails] od\n"
                    + "  left join Products p\n"
                    + "  on p.ProductId = od.ProductId\n"
                    + "  left join Orders o\n"
                    + "  on o.OrderID = od.OrderId\n"
                    + "  left join [User] u\n"
                    + "  on o.OrderFromUser = u.UserID\n"
                    + "  where p.ShopID = ?\n";
            setter.put(++count, userID);
            if (status != 1 && status != 0) {
                sql += " and DeliverStatus = ?";
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                setter.put(++count, status);
            } else if (status == 0) {
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                sql += " and DeliverStatus != 1";
            } else if (status == 1) {
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                sql += " and DeliverStatus = 1";
            }

            switch (sortOption) {
                case -1:
                    sql += " order by OrderDetailsId\n";
                    break;
                case 1:
                    sql += " order by o.[DateTime] asc\n";
                    break;
                case 2:
                    sql += " order by o.[DateTime] desc\n";
                    break;
                case 3:
                    sql += " order by od.Quantity asc\n";
                    break;
                case 4:
                    sql += " order by od.Quantity desc\n";
                    break;
            }

            sql += "   offset ? row\n"
                    + "  fetch next ? rows only";
            setter.put(++count, offset);
            setter.put(++count, recordsPerPage);

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();

            OrderDAO oDao = new OrderDAO();
            ProductDAO pDao = new ProductDAO();
            StatusOrderDAO soDao = new StatusOrderDAO();

            while (rs.next()) {
                Order order = oDao.getOrdersByID(rs.getInt("OrderId"));
                Product product = pDao.getProductDetailsByID(rs.getInt("ProductId"));
                StatusOrder so = soDao.getStatusByID(rs.getInt("DeliverStatus"));

                list.add(new OrderDetails(rs.getInt("OrderDetailsId"),
                        order,
                        product,
                        rs.getInt("Quantity"),
                        so,
                        rs.getInt("Rate"),
                        rs.getString("Comment"),
                        rs.getBoolean("IsRated")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNoOfRecords(String textSearch, int userID, int status) {
        try {
            HashMap<Integer, Object> setter = new HashMap<>();
            int count = 0;
            String sql = "SELECT count(*) as 'total'\n"
                    + "  FROM [OrderDetails] od\n"
                    + "  left join Products p\n"
                    + "  on p.ProductId = od.ProductId\n"
                    + "  left join Orders o\n"
                    + "  on o.OrderID = od.OrderId\n"
                    + "  left join [User] u\n"
                    + "  on o.OrderFromUser = u.UserID\n"
                    + "  where p.ShopID = ?\n";
            setter.put(++count, userID);
            if (status != 1 && status != 0) {
                sql += " and DeliverStatus = ?";
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                setter.put(++count, status);
            } else if (status == 0) {
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                sql += " and DeliverStatus != 1";
            } else if (status == 1) {
                if (!textSearch.isEmpty() && !textSearch.equalsIgnoreCase("")) {
                    textSearch = "%" + textSearch + "%";
                    sql += " and p.Name like ? or u.FullName like ?\n";
                    setter.put(++count, textSearch);
                    setter.put(++count, textSearch);
                }
                sql += " and DeliverStatus = 1";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void changeStatus(int orderDetailsID, int status) {
        try {
            String sql = "UPDATE [dbo].[OrderDetails]\n"
                    + "   SET [DeliverStatus] = ?\n"
                    + " WHERE OrderDetailsId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, orderDetailsID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void RateProduct(int orderDetailsID, boolean isRated) {
        try {
            String sql = "UPDATE [dbo].[OrderDetails]\n"
                    + "   SET [IsRated] = ?\n"
                    + " WHERE OrderDetailsId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, isRated);
            stm.setInt(2, orderDetailsID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<OrderDetails> getRatesOrder(int productID) {
        ArrayList<OrderDetails> list = new ArrayList<>();
        try {

            OrderDAO oDao = new OrderDAO();
            ProductDAO pDao = new ProductDAO();
            StatusOrderDAO soDao = new StatusOrderDAO();

            String sql = "SELECT o.*\n"
                    + "  FROM [OrderDetails] o\n"
                    + "  join Products p\n"
                    + "  on p.ProductId = o.ProductId\n"
                    + "  where Rate IS NOT NULL and Comment IS NOT NULL\n"
                    + "  and (p.ProductId = ? or p.ParentId = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Order order = oDao.getOrdersByID(rs.getInt("OrderId"));
                Product product = pDao.getProductDetailsByID(rs.getInt("ProductId"));
                StatusOrder status = soDao.getStatusByID(rs.getInt("DeliverStatus"));

                list.add(new OrderDetails(rs.getInt(1), order, product, rs.getInt(4), status, rs.getInt("Rate"), rs.getString("Comment"), rs.getBoolean("IsRated")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDetailsDAO odDao = new OrderDetailsDAO();
        ArrayList<OrderDetails> rates = odDao.getRatesOrder(12);
        System.out.println(rates.size());

    }

}
