/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

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
public class NewArrivalDAO extends DBContext {

    public ArrayList<NewArrival> getAllNew(boolean deleteFlag, boolean productStatus) {
        ArrayList<NewArrival> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [New_Arrival] where deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, deleteFlag);
            ResultSet rs = stm.executeQuery();
            ProductDAO pDao = new ProductDAO();
            while (rs.next()) {
                Product product = pDao.getProductByID(rs.getInt("ProductID"), productStatus);
                list.add(new NewArrival(product, deleteFlag));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
