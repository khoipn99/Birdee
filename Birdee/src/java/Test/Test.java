/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import dto.Status;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtils;

/**
 *
 * @author vudin
 */
public class Test {
    public static ArrayList<Status> getStatus(String Status){

            ArrayList<Status> listOrder = null;
        listOrder = new ArrayList<>();
        Connection cn = null;
        Status or = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
                String sql = "Select * \n"+
                        "From dbo.Status\n"
                        +"where status_id = ( select status_id \n"
                                        +"from dbo.Status\n "
                                        + "where status_id like ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, Status);
                ResultSet rs = pst.executeQuery();
                while(rs != null&& rs.next()){
                        
                int status_id = rs.getInt("status_id");
                String status_name = rs.getString("status_name");
                
                or = new Status(status_id, status_name);
                listOrder.add(or);
                
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(cn != null){
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return listOrder;
    }
    
    public static void main(String[] args) {
        System.out.println(getStatus("2"));
        
    }
    
}
