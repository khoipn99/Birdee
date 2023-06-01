/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
public class BirdDAO {

    public static ArrayList<Bird> getBird(String keyword) {
        ArrayList<Bird> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT B.bird_name,BI.url, B.dob, B.gender, B.height, B.weight, B.origin,B.quantity, B.description, B.price\n"
                        + "FROM dbo.Bird AS B \n"
                        + "JOIN dbo.Bird_Img AS BI \n"
                        + "ON B.bird_id = BI.bird_id\n"
                        + "WHERE bird_name LIKE + ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        String name = rs.getString("bird_name");
                        Date dob = rs.getDate("dob");
                        String url = rs.getString("url");
                        boolean gender = rs.getBoolean("gender");
                        float height = rs.getFloat("height");
                        float weight = rs.getFloat("weight");
                        String origin = rs.getString("origin");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        Bird Br = new Bird(name, url, dob, gender, height, weight, origin, quantity, description, price);

                        list.add(Br);
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

    public static ArrayList<Bird> getBirdsList() {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT B.bird_name, BI.url, B.dob, B.gender, B.height, B.weight, B.origin,B.quantity, B.description, B.price\n"
                        + "FROM dbo.Bird AS B \n"
                        + "JOIN dbo.Bird_Img AS BI \n"
                        + "ON B.bird_id = BI.bird_id";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(s);
                ArrayList<Bird> list = new ArrayList<>();
                if (rs != null) {
                    while (rs.next()) {
                        String name = rs.getString("bird_name");
                        Date dob = rs.getDate("dob");
                        String url = rs.getString("url");
                        boolean gender = rs.getBoolean("gender");
                        float height = rs.getFloat("height");
                        float weight = rs.getFloat("weight");
                        String origin = rs.getString("origin");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        Bird Br = new Bird(name, url, dob, gender, height, weight, origin, quantity, description, price);
                        list.add(Br);
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
