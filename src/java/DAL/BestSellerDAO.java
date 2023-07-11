/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.BestSeller;
import Model.NewArrival;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class BestSellerDAO extends DBContext {

    public ArrayList<BestSeller> getAllNew(boolean deleteFlag, boolean productStatus) {
        ArrayList<BestSeller> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Best_Seller] Where deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, deleteFlag);
            ResultSet rs = stm.executeQuery();
            ProductDAO pDao = new ProductDAO();
            while (rs.next()) {
                Product product = pDao.getProductByID(rs.getInt("ProductID"), productStatus);
                list.add(new BestSeller(product, deleteFlag));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
