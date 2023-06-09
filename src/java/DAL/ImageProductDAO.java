/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.ImageProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class ImageProductDAO extends DBContext {

    public ArrayList<ImageProduct> getImageByProductID(int productID, boolean deleteFlag) {
        ArrayList<ImageProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [Image_Product]\n"
                    + "  where ProductID = ? and deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setBoolean(2, deleteFlag);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ImageProduct(productID,
                        rs.getString("image"),
                        deleteFlag));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<ImageProduct> getAllImageByProductID(int productID, boolean deleteFlag) {
        ArrayList<ImageProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT img.*\n"
                    + "FROM [Products] p\n"
                    + "left join Image_Product img\n"
                    + "on p.ProductId = img.productID\n"
                    + "Where p.ProductId = ? or ParentId = ?\n"
                    + "and deleteFlag = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productID);
            stm.setInt(2, productID);
            stm.setBoolean(3, deleteFlag);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new ImageProduct(productID,
                        rs.getString("image"),
                        deleteFlag));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Boolean addImageProduct(int productId, String imagePath) {
        try {
            String sql = "INSERT INTO Image_Product(ProductID, image, deleteFlag)\n"
                    + "VALUES\n"
                    + "(\n"
                    + "?, -- ProductID - int\n"
                    + "?, -- image - text\n"
                    + "0 -- deleteFlag - bit\n"
                    + ");";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            stm.setString(2, imagePath);

            int re = stm.executeUpdate();
            if (re > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteImageProduct(int id) {
        try {
            String sql = "DELETE FROM Image_Product WHERE ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, id);

            int result = stm.executeUpdate();

            if (result > 0) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
