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
    
    public static void main(String[] args) {
        Account acc = null;
        acc = getAccount("customer@gmail.com", "123");
        System.out.println(acc.getUsername());
    }
    
}
