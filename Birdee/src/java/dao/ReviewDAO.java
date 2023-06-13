/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Accessory;
import dto.Review_Accessory;
import dto.Review_Bird;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtils;

/**
 *
 * @author vudin
 */
public class ReviewDAO {

    public static ArrayList<Review_Bird> getReview_Bird(int ID) {
        ArrayList<Review_Bird> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Order_Detail_Bird\n"
                        + "join Review_Bird on Review_Bird.order_detail_id_B = Order_Detail_Bird.order_detail_id_B\n"
                        + "where Order_Detail_Bird.bird_id like ?\n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String email_customer = rs.getString("email_customer");
                        int order_detail_id_B = rs.getInt("order_detail_id_B");
                        int rating = rs.getInt("rating");
                        String comment = rs.getString("comment");
                        String email_platform_staff = rs.getString("email_platform_staff");

                        Review_Bird review_Bird = new Review_Bird(email_customer, order_detail_id_B, rating, comment, email_platform_staff);
                        list.add(review_Bird);

                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static ArrayList<Review_Accessory> getReview_Accessory(int ID) {
        ArrayList<Review_Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Order_Detail_Accessory\n"
                        + "join Review_Accessory on Review_Accessory.order_detail_id_A = Order_Detail_Accessory.order_detail_id_A\n"
                        + "where Order_Detail_Accessory.accessory_id like ?\n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String email_customer = rs.getString("email_customer");
                        int order_detail_id_B = rs.getInt("order_detail_id_A");
                        int rating = rs.getInt("rating");
                        String comment = rs.getString("comment");
                        String email_platform_staff = rs.getString("email_platform_staff");

                        Review_Accessory review = new Review_Accessory(email_customer, order_detail_id_B, rating, comment, email_platform_staff);
                        list.add(review);

                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static String getReviewerBirdName(String email) {
        String tmp = "";

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Review_Bird \n"
                        + "join Account on Account.email = Review_Bird.email_customer\n"
                        + "where Review_Bird.email_customer like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp = rs.getString("username");
                    return tmp;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }
    
    public static String getReviewerAccessoryName(String email) {
        String tmp = "";

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Review_Accessory \n"
                        + "join Account on Account.email = Review_Accessory.email_customer\n"
                        + "where Review_Accessory.email_customer like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp = rs.getString("username");
                    return tmp;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }

    public static Date getReviewBirdDate(int id) {
        Date tmp = null;

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Order_Detail_Bird \n"
                        + "join Orders on Orders.order_id = Order_Detail_Bird.order_id\n"
                        + "where Order_Detail_Bird.order_detail_id_B like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp = rs.getDate("order_date");
                    return tmp;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }
    
    public static Date getReviewAccessoryDate(int id) {
        Date tmp = null;

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Order_Detail_Accessory\n"
                        + "join Orders on Orders.order_id = Order_Detail_Accessory.order_id\n"
                        + "where Order_Detail_Accessory.order_detail_id_A like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp = rs.getDate("order_date");
                    return tmp;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }
    
    public static ArrayList<String> getReviewBirdImg(int id) {
        ArrayList<String> tmp = new ArrayList<>();

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Review_Bird\n"
                        + "join Img_Review_Bird on Img_Review_Bird.order_detail_id_B = Review_Bird.order_detail_id_B\n"
                        + "where Review_Bird.order_detail_id_B like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp.add(rs.getString("url"));                    
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }
    
    public static ArrayList<String> getReviewAccessoryImg(int id) {
        ArrayList<String> tmp = new ArrayList<>();

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from Review_Accessory\n"
                        + "join Img_Review_Accessory on Img_Review_Accessory.order_detail_id_A = Review_Accessory.order_detail_id_A\n"
                        + "where Review_Accessory.order_detail_id_A like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp.add(rs.getString("url"));                    
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }
    
    

    public static void main(String[] args) {
//        ArrayList<Review_Bird> b = getReview_Bird(2);
//        System.out.println(b.get(0));
//
//        System.out.println(getReviewerBirdName("customer@gmail.com"));
        
        System.out.println(getReviewAccessoryDate(1));
        
    }

}
