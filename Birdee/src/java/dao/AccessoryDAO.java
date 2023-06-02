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

    public static ArrayList<Accessory> searchAccessory(String keyword) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accessory_id,name,price,quantity,description,email_shop_staff,cate_id,email_platform_staff\n"
                        + "FROM Accessory\n"
                        + "where name like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                ArrayList<Accessory> list = new ArrayList<>();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accessory_id");
                        String name = rs.getString("name");
                        float price = rs.getFloat("price");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        String email_shop_staff = rs.getString("email_shop_staff");
                        int cate_id = rs.getInt("cate_id");
                        String email_platform_staff = rs.getString("email_platform_staff");

                        Accessory Ac = new Accessory(id, name, price, quantity, description, email_shop_staff, cate_id, email_platform_staff);
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
                String s = "SELECT accessory_id,name,price,quantity,description,email_shop_staff,cate_id,email_platform_staff\n"
                        + "FROM Accessory";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(s);
                ArrayList<Accessory> list = new ArrayList<>();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accessory_id");
                        String name = rs.getString("name");
                        float price = rs.getFloat("price");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        String email_shop_staff = rs.getString("email_shop_staff");
                        int cate_id = rs.getInt("cate_id");
                        String email_platform_staff = rs.getString("email_platform_staff");

                        Accessory Ac = new Accessory(id, name, price, quantity, description, email_shop_staff, cate_id, email_platform_staff);

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

public static ArrayList<String> getAccessoryImg(int Accessory_id){
        ArrayList<String> tmp = new ArrayList<>();

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){

                String sql = "select Accessory.accessory_id, url from Accessory \n"
                    + "join Accessory_Img on Accessory_Img.accessory_id = Accessory.accessory_id \n"
                    + "where Accessory.accessory_id like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while(rs != null && rs.next()){
                     String url = rs.getString("url");
                     tmp.add(url);
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        } 
        return tmp;
        }
    public static void main(String[] args) {
        System.out.println(AccessoryDAO.getAccessoryImg(1).get(0));
    }
    public static String getAccessoryAddress(int Accessory_id){
        String tmp = "";

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){

                String sql = "select Accessory.accessory_id, address from Accessory\n"
                    + "join Account on Account.email = Accessory.email_shop_staff \n"
                    + "where Accessory.accessory_id like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while(rs != null && rs.next()){
                     String url = rs.getString("address");
                     tmp= url;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        } 
        return tmp;
        }

}
