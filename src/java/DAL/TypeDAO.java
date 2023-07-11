/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class TypeDAO extends DBContext {

    public Type getTypeByID(int typeID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Type]\n"
                    + "	Where [TypeID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, typeID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Type(rs.getInt("TypeID"), rs.getString("Name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
