/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Bird;
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
    
    public Bird getBirdByProductID(int productID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Bird_Details]\n"
                    + "  where productID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Bird(rs.getInt("productID"),
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
