/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Constants;
import Model.Tag;
import com.oracle.wls.shaded.org.apache.bcel.classfile.Constant;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAll() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT [CategoryID]\n"
                    + "      ,[CategoryName]\n"
                    + "      ,[Status]\n"
                    + "      ,[Description]\n"
                    + "      ,[TagId]\n"
                    + "  FROM [BirdeePlatform].[dbo].[Categories]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            TagDAO tagDAO = new TagDAO();
            while (rs.next()) {
                Tag tag = tagDAO.getTagByID(rs.getInt("TagId"), true);
                list.add(new Category(rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getBoolean("Status"),
                        rs.getString("Description"),
                        tag));
            }
        } catch (Exception e) {
            System.out.println("get list categories");
        }
        return list;
    }

    public Category getCategoryByID(int CategoryID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Categories] where CategoryID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, CategoryID);
            ResultSet rs = stm.executeQuery();
            TagDAO tDao = new TagDAO();
            if (rs.next()) {
                Tag tag = tDao.getTagByID(rs.getInt("TagId"), Constants.Active);
                return new Category(rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getBoolean("Status"),
                        rs.getString("Description"),
                        tag);
            }
        } catch (Exception e) {
            System.out.println("get category by id");
        }
        return null;
    }

    public ArrayList<Category> getAllByTagID(int tagID) {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT c.*\n"
                    + "  FROM [Categories] c \n"
                    + "  left join Tags t\n"
                    + "  on t.TagId = c.TagId\n"
                    + "  where c.TagId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, tagID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getBoolean("Status"),
                        rs.getString("Description")));
            }
        } catch (Exception e) {
            System.out.println("get list categories");
        }
        return list;
    }
}
