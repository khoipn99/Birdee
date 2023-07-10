/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Product;
import Model.User;
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
public class ProductDAO extends DBContext {

    public ArrayList<Product> getNewestProduct(int numberOfProduct) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT top 4*\n"
                    + "  FROM [Products]\n"
                    + "  Order by createDate desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setInt(1, numberOfProduct);
            ResultSet rs = stm.executeQuery();

            UserDAO uDao = new UserDAO();
            CategoryDAO cDao = new CategoryDAO();

            while (rs.next()) {
                Category category = cDao.getCategoryByID(rs.getInt("CategoryId"));
                User shop = uDao.getUserByID(rs.getInt("shopID"));

                list.add(new Product(rs.getInt("ProductId"),
                        rs.getString("Name"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("Status"),
                        rs.getDate("createDate"),
                        category,
                        shop,
                        rs.getString("Description"),
                        rs.getString("Image")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getCheapProduct(int i) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT top 4*\n"
                    + "  FROM [Products]\n"
                    + "  Order by price asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setInt(1, numberOfProduct);
            ResultSet rs = stm.executeQuery();

            UserDAO uDao = new UserDAO();
            CategoryDAO cDao = new CategoryDAO();

            while (rs.next()) {
                Category category = cDao.getCategoryByID(rs.getInt("CategoryId"));
                User shop = uDao.getUserByID(rs.getInt("shopID"));

                list.add(new Product(rs.getInt("ProductId"),
                        rs.getString("Name"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("Status"),
                        rs.getDate("createDate"),
                        category,
                        shop,
                        rs.getString("Description"),
                        rs.getString("Image")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getAllProduct(int offset, int recordPerPage, String textSearch,
            int categoryID, double minPrice, double maxPrice, int sortID) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            int count = 0;
            HashMap<Integer, Object> setter = new HashMap<>();

            String sql = "SELECT *\n"
                    + "  FROM [Products]\n"
                    + "  Where Price >= ? and Price <= ?";
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (categoryID != -1) {
                sql += " and CategoryId = ?";
                setter.put(++count, categoryID);
            }

            if (!textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            switch (sortID) {
                case -1:
                    sql += " order by ProductId\n";
                    break;
                case 1:
                    sql += " order by Price asc\n";
                    break;
                case 2:
                    sql += " order by Price desc\n";
                    break;
                case 3:
                    sql += " order by Name asc\n";
                    break;
                case 4:
                    sql += " order by Name desc\n";
                    break;
            }

            sql += "  offset ? rows\n"
                    + "  fetch next ? rows only";
            setter.put(++count, offset);
            setter.put(++count, recordPerPage);

            UserDAO uDao = new UserDAO();
            CategoryDAO cDao = new CategoryDAO();

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = cDao.getCategoryByID(rs.getInt("CategoryId"));
                User shop = uDao.getUserByID(rs.getInt("shopID"));
                list.add(new Product(rs.getInt("ProductId"),
                        rs.getString("Name"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("Status"),
                        rs.getDate("createDate"),
                        category,
                        shop,
                        rs.getString("Description"),
                        rs.getString("Image")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalRecord(String textSearch, int categoryID, double minPrice, double maxPrice) {
        try {
            int count = 0;
            HashMap<Integer, Object> setter = new HashMap<>();

            String sql = "SELECT count(*) as 'total'\n"
                    + "  FROM [Products]\n"
                    + "  Where Price >= ? and Price <= ?";
            setter.put(++count, minPrice);
            setter.put(++count, maxPrice);

            if (categoryID != -1) {
                sql += " and CategoryId = ?";
                setter.put(++count, categoryID);
            }

            if (!textSearch.equalsIgnoreCase("")) {
                textSearch = "%" + textSearch + "%";
                sql += " and Name like ?";
                setter.put(++count, textSearch);
            }

            UserDAO uDao = new UserDAO();
            CategoryDAO cDao = new CategoryDAO();

            PreparedStatement stm = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : setter.entrySet()) {
                stm.setObject(entry.getKey(), entry.getValue());
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Product getProductByID(int productID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Products]\n"
                    + "	Where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            ResultSet rs = stm.executeQuery();

            UserDAO uDao = new UserDAO();
            CategoryDAO cDao = new CategoryDAO();

            while (rs.next()) {
                Category category = cDao.getCategoryByID(rs.getInt("CategoryId"));
                User shop = uDao.getUserByID(rs.getInt("shopID"));

                return new Product(rs.getInt("ProductId"),
                        rs.getString("Name"),
                        rs.getDouble("price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("Status"),
                        rs.getDate("createDate"),
                        category,
                        shop,
                        rs.getString("Description"),
                        rs.getString("Image"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
