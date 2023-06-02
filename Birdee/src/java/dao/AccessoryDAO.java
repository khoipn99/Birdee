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

public class AccessoryDAO {
    public static ArrayList<Accessory> getAccessorys(){
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql = "select *\n"
                    + "from Accessory " ;              
                    
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if(rs != null){
                    while(rs.next()){
                        int id = rs.getInt("accessory_id");
                        String name = rs.getString("name");
                        String description = rs.getString("description");
                        int quantity = rs.getInt("quantity");
                        float price = rs.getFloat("price");                       
                        String email_shop_staff = rs.getString("email_shop_staff");
                        int cate_id = rs.getInt("cate_id");
                        String email_platform_staff = rs.getString("email_platform_staff");                                             
                                               
                        Accessory accessory = new Accessory(id, name, price, quantity, description, email_shop_staff, cate_id, email_platform_staff);
                        list.add(accessory);
                        
                    
                   }
                }
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static float getAccessoryVote(int Accessory_id){
        float tmp = 0;
        ArrayList<Integer> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                
                String sql = "select Accessory.accessory_id, rating\n"
                    + "from Accessory \n" +
                        "join Order_Detail_Accessory on Order_Detail_Accessory.accessory_id = Accessory.accessory_id \n" +
                        "join Review_Accessory on Review_Accessory.order_detail_id_A = Order_Detail_Accessory.order_detail_id_A\n" +
                        "where Accessory.accessory_id like ?";
                
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while(rs != null && rs.next()){                    
                        int id = rs.getInt("rating") ;                        
                        list.add(id);
                        tmp += id;
                }
                
            }     
            
        } catch (Exception e) {
            System.out.println(e);
        }
        if(list.size() != 0){
        return tmp/list.size();
        }
        return 0;
    }
    
    public static int getAccessoryBuying(int Accessory_id){
        int tmp = 0;
        
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                
                String sql = "select Accessory.accessory_id from Accessory \n" +                       
                        "join Order_Detail_Accessory on Order_Detail_Accessory.accessory_id = Accessory.accessory_id\n" +
                        "where Accessory.accessory_id like ?";
                
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id );
                ResultSet rs = pst.executeQuery();
                while(rs != null && rs.next()){                              
                        tmp += 1;
                }
                
            }     
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
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
    
    public static void main(String[] args) {
        System.out.println(getAccessoryBuying(2));       
                
    }
    
    
}
