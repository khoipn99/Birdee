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

    public Boolean insert(BirdDetails product, int productId) {
        try {
            String sql = "  INSERT INTO Bird_Details\n"
                    + "  (\n"
                    + "      ProductID,\n"
                    + "      dob,\n"
                    + "      gender,\n"
                    + "      height,\n"
                    + "      weight,\n"
                    + "      origin\n"
                    + "  )\n"
                    + "  VALUES\n"
                    + "  (   ?, -- ProductID - int\n"
                    + "      ?, -- dob - date\n"
                    + "      ?, -- gender - bit\n"
                    + "      ?, -- height - float\n"
                    + "      ?, -- weight - float\n"
                    + "      ?  -- origin - nvarchar(250)\n"
                    + "      )";
            PreparedStatement stm = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stm.setInt(1, productId);
            stm.setDate(2, product.getDob());
            stm.setBoolean(3, product.isGender());
            stm.setFloat(4, (float) product.getHeight());
            stm.setFloat(5, (float) product.getHeight());
            stm.setNString(6, product.getOrigin());
            int re = stm.executeUpdate();

            if (re > 0) {
                return true;
            }
//            ResultSet re = stm.getGeneratedKeys();
//            if (re.next()) {
//                return re.getInt(1);
//            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
