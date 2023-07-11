/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.BirdDetails;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class BirdDetailsDAO extends DBContext {
    
    public BirdDetails getBirdByProductID(int productId, boolean status) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Bird_Details] Where ProductID = ?";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ProductDAO pDao = new ProductDAO();
                Product product = pDao.getProductByID(productId, status);
                return new BirdDetails(product,
                        rs.getDate("dob"),
                        rs.getBoolean("gender"),
                        rs.getDouble("height"),
                        rs.getDouble("weight"),
                        rs.getString("origin"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BirdDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
