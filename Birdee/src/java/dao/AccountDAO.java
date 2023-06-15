/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtils;

/**
 *
 * @author ACE
 */
public class AccountDAO {
    public static Account getAccount(String email, String pass) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select email, password, username, role_id, address, phone\n"
                        + "from Account\n"
                        + "where email = ? and password = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, pass);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String mail = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("username");
                    String role = rs.getString("role_id");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    acc = new Account(email, password, name, role, address, phone);
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;        
    }
    
    public static ArrayList<Account> getAllAccount(){
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Account\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("username");
                    String role = rs.getString("role_id");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    Account acc = new Account(email, password, name, role, address, phone);
                    list.add(acc);
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static boolean checkValid(String email, String phone){
        boolean kq = true;
        ArrayList<Account> list = getAllAccount();
        for (Account account : list) {
            if(account.getEmail().equals(email)||account.getPhone().equals(phone.trim())){
                kq = false;
            }
        }
        return kq;
    }
    
    public static int addAccount(String email, String password, String name,String role, String address, String phone) {
        int kq = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
            String sql = "INSERT INTO Account (email, password, username, role_id, address, phone) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = cn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, role);
            statement.setString(5, address);
            statement.setString(6, phone);
            kq = statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static Account getAccountByEmail(String email) {
        Connection cn = null;
        Account acc = new Account();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Account\n"
                        + "where email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    acc.setUsername(rs.getString("username"));
                    acc.setEmail(email);
                    acc.setPhone(rs.getString("phone"));
                    acc.setAddress(rs.getString("address"));
                    acc.setPassword("");
                    acc.setRole_id("");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }
    
    public static int UpdateAccount(String name, String email, String address, String phone){
        Connection cn = null;
        int kq = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Update Account\n"
                        + "set username = ?,phone = ?, address = ?\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, phone);
                pst.setString(3, address);
                pst.setString(4, email);
                kq = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
}
