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
    
    public static ArrayList<Account> getAllCustomerAccount(){
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Account\n"
                        + "Where Account.role_id like 'cus'\n";
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
    
    public static ArrayList<Account> getAllShopAccount(){
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Account\n"
                        + "Where Account.role_id like 'ss'\n";
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
    
    public static void main(String[] args) {
        ArrayList<Account> list = getAllShopAccount();
        for (Account account : list) {
            System.out.println(account.getEmail());
            System.out.println(account.getPassword());
            System.out.println(account.getRole_id());
        }
    }
    
}
