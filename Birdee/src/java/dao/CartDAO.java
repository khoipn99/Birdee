/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Accessory_Sub_Cart;
import dto.Bird_Sub_Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBUtils;

/**
 *
 * @author ACE
 */
public class CartDAO {
    public static Bird_Sub_Cart getBirdCart(int bird_id) {
        Connection cn = null;
        Bird_Sub_Cart bc = new Bird_Sub_Cart();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select cart_id, cate_id, quantity, bird_id\n"
                        + "from Bird_Sub_Cart\n"
                        + "where bird_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, bird_id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int cartID = rs.getInt("cart_id");
                    int cateID = rs.getInt("cate_id");
                    int quantity = rs.getInt("quantity");
                    int birdID = rs.getInt("bird_id");
                    bc = new Bird_Sub_Cart(cartID, cateID, quantity, bird_id);
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bc;
    }
    
    public static boolean checkBirdCart(int bird_id) {       
        Bird_Sub_Cart bc = null;
        bc = getBirdCart(bird_id);
        if (bc.getBird_id() == 0)
            return true;
        return false;
    }
    
    public static int addBirdCart(int cateID, int quantity, int birdID) {
        int kq = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Bird_Sub_Cart(cate_id, quantity, bird_id) VALUES (?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, cateID);
                pst.setInt(2, quantity);
                pst.setInt(3, birdID);
                kq = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static int addBirdQuantity(Bird_Sub_Cart bc, int quantity) {
        int kq = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Bird_Sub_Cart\n"
                        + "SET quantity += ?\n"
                        + "WHERE bird_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, bc.getBird_id());
                pst.setInt(2, quantity);
                kq = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static Accessory_Sub_Cart getAccessoryCart(int ary_id) {
        Connection cn = null;
        Accessory_Sub_Cart ac = new Accessory_Sub_Cart();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select cart_id, cate_id, quantity, accessory_id\n"
                        + "from Accessory_Sub_Cart\n"
                        + "where accessory_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ary_id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int cartID = rs.getInt("cart_id");
                    int cateID = rs.getInt("cate_id");
                    int quantity = rs.getInt("quantity");
                    int aryID = rs.getInt("accessory_id");
                    ac = new Accessory_Sub_Cart(cartID, cateID, quantity, ary_id);
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ac;
    }
    
    public static int addAccessoryCart(int cateID, int quantity, int aryID) {
        int kq = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Accessory_Sub_Cart(cate_id, quantity, accessory_id) VALUES (?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, cateID);
                pst.setInt(2, quantity);
                pst.setInt(3, aryID);
                kq = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static int addAccessoryQuantity(Accessory_Sub_Cart ac, int quantity) {
        int kq = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Accessory_Sub_Cart\n"
                        + "SET quantity += ?\n"
                        + "WHERE accessory_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(2, ac.getAccessory_id());
                pst.setInt(1, quantity);
                kq = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static boolean checkAccessoryCart(int ary_id) {       
        Accessory_Sub_Cart ac = null;
        ac = getAccessoryCart(ary_id);
        if (ac.getCart_id() == 0)
            return true;
        return false;
    }
    
    public static void main(String[] args) {
//        Bird_Sub_Cart bc = new Bird_Sub_Cart();
//        bc = getBirdCart(2);
//        System.out.println(bc);
//        boolean i = checkBirdCart(bc.getBird_id());
//        System.out.println(i);
//        int kq = addBirdQuantity(bc, 2);
//        bc = getBirdCart(2);
//        System.out.println(bc.getQuantity());
        Accessory_Sub_Cart ac = new Accessory_Sub_Cart();
        ac = getAccessoryCart(2);
        System.out.println(ac);
        boolean i = checkAccessoryCart(ac.getAccessory_id());
        System.out.println(i);
        int kq = addAccessoryQuantity(ac, 1);
        ac = getAccessoryCart(2);
        System.out.println(ac.getQuantity());
    }
}
