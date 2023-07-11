/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Collection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class CollectionDAO extends DBContext {

    public ArrayList<Collection> getAllCollection(boolean status) {
        ArrayList<Collection> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Collections] where Status = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Collection(rs.getInt("CollectionID"),
                        rs.getString("CollectionName"),
                        rs.getString("link"),
                        rs.getBoolean("Status"),
                        rs.getString("Description")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
