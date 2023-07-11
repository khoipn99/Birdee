/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.StatusOrder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class StatusOrderDAO extends DBContext {

    public StatusOrder getStatusByID(int id) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [StatusOrder] where StatusOrderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new StatusOrder(rs.getInt("StatusOrderID"),
                        rs.getString("StatusValue"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusOrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
