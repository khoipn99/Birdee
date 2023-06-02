/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Accessory;
import dto.Bird;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import util.DBUtils;

/**
 *
 * @author ASUS
 */
public class AccessoryDAO {

    public static ArrayList<Accessory> getAccessory(String keyword) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT A.name, AI.url,A.quantity, A.description, A.price\n"
                        + "FROM dbo.Accessory AS A JOIN Accessory_Img AS AI \n"
                        + "ON A.accessory_id = AI.accessory_id\n"
                        + "WHERE name like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                ArrayList<Accessory> list = new ArrayList<>();
                if (rs != null) {
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String img = rs.getString("url");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");

                        Accessory Ac = new Accessory(name, img, quantity, description, price);
                        list.add(Ac);
                    }
                    return list;
                }
                cn.close();
            } else {
                System.out.println("Connection Error");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ArrayList<Accessory> getAccessoriesList() {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT A.name, AI.url,A.quantity, A.price,A.description\n"
                        + "FROM dbo.Accessory AS A JOIN Accessory_Img AS AI \n"
                        + "ON A.accessory_id = AI.accessory_id";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(s);
                ArrayList<Accessory> list = new ArrayList<>();
                if (rs != null) {
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String img = rs.getString("url");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        Accessory Ac = new Accessory(name, img, quantity, description, price);
                        
                        list.add(Ac);
                    }
                    return list;
                }
                cn.close();
            } else {
                System.out.println("Connection Error");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
