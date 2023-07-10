/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Role;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class UserDAO extends DBContext {

    public void insertUser(User user) {
        try {
            String sql = "INSERT INTO [User]\n"
                    + "           ([FullName]\n"
                    + "           ,[Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[Phone]\n"
                    + "           ,[DOB]\n"
                    + "           ,[Address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getUsername());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getPhone());
            stm.setDate(5, user.getDob());
            stm.setString(6, user.getAddress());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User doLogin(String email, String pwd) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] Where Username = ? and Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, pwd);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));
                User manager = getUserByID(rs.getInt("ManagerID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Username"),
                        rs.getString("EmailID"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByID(int userID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] Where UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));
                User manager = getUserByID(rs.getInt("ManagerID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Username"),
                        rs.getString("EmailID"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(User user) {
        try {
            String sql = "INSERT INTO [User]\n"
                    + "           ([FullName]\n"
                    + "           ,[Username]\n"
                    + "           ,[EmailID]\n"
                    + "           ,[Password]\n"
                    + "           ,[Phone]\n"
                    + "           ,[DOB]\n"
                    + "           ,[Address]\n"
                    + "           ,[Avatar]\n"
                    + "           ,[RoleID]\n"
                    + "           ,[Status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "		  ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getFullName());
            stm.setString(2, user.getUsername());
            stm.setString(3, user.getEmailID());
            stm.setString(4, user.getPassword());
            stm.setString(5, user.getPhone());
            stm.setDate(6, user.getDob());
            stm.setString(7, user.getAddress());
            stm.setString(8, null);
            stm.setInt(9, 4);
            stm.setBoolean(10, true);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserGoogle(String EmailID) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] where EmailID like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, EmailID);
            ResultSet rs = stm.executeQuery();

            RoleDAO rDao = new RoleDAO();

            if (rs.next()) {

                Role role = rDao.getRoleByID(rs.getInt("RoleID"));
                User manager = getUserByID(rs.getInt("ManagerID"));

                return new User(rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("Username"),
                        rs.getString("EmailID"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("Avatar"),
                        role,
                        manager,
                        rs.getBoolean("Status"),
                        rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isUserExist(String uid) {
        try {
            String sql = "SELECT *\n"
                    + "  FROM [User] where Username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
