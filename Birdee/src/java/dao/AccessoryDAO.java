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

    public static ArrayList<Accessory> getAccessorys() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Accessory\n"
                        + "where quantity > 0\n"
                        + "order by Accessory.accessory_id DESC\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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
    
    public static ArrayList<Accessory> getAccessoryByID(int ID) {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from Accessory\n"
                        + "where Accessory.accessory_id like ?\n"
                        + "order by Accessory.accessory_id DESC\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                 pst.setInt(1, ID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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

    public static float getAccessoryVote(int Accessory_id) {
        float tmp = 0;
        ArrayList<Integer> list = new ArrayList();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select Accessory.accessory_id, rating\n"
                        + "from Accessory \n"
                        + "join Order_Detail_Accessory on Order_Detail_Accessory.accessory_id = Accessory.accessory_id \n"
                        + "join Review_Accessory on Review_Accessory.order_detail_id_A = Order_Detail_Accessory.order_detail_id_A\n"
                        + "where Accessory.accessory_id like ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int id = rs.getInt("rating");
                    list.add(id);
                    tmp += id;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        if (list.size() != 0) {
            return tmp / list.size();
        }
        return 0;
    }

    public static int getAccessoryBuying(int Accessory_id) {
        int tmp = 0;

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select Accessory.accessory_id from Accessory \n"
                        + "join Order_Detail_Accessory on Order_Detail_Accessory.accessory_id = Accessory.accessory_id\n"
                        + "where Accessory.accessory_id like ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    tmp += 1;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }

    public static ArrayList<String> getAccessoryImg(int Accessory_id) {
        ArrayList<String> tmp = new ArrayList<>();

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select Accessory.accessory_id, url from Accessory \n"
                        + "join Accessory_Img on Accessory_Img.accessory_id = Accessory.accessory_id \n"
                        + "where Accessory.accessory_id like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    String url = rs.getString("url");
                    tmp.add(url);
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return tmp;
    }
    
    public static String getMainAccessoryImg(int Accessory_id) {
        String tmp = "";

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select url from Accessory \n"
                        + "join Accessory_Img on Accessory_Img.accessory_id = Accessory.accessory_id \n"
                        + "where Accessory.accessory_id like ? and Accessory_Img.is_main_img like 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    String url = rs.getString("url");
                    tmp = url;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return tmp;
    }

    public static ArrayList<Integer> getAccessory_Isimg(int accessory_id) {
        ArrayList<Integer> tmp = new ArrayList<>();

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select is_main_img\n"
                        + "from Accessory join Accessory_Img on Accessory_Img.accessory_id = Accessory.accessory_id\n"
                        + "where Accessory.accessory_id like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int is = rs.getInt("is_main_img");
                    tmp.add(is);
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return tmp;
    }

    public static String getAccessoryAddress(int Accessory_id) {
        String tmp = "";
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "select Accessory.accessory_id, address from Accessory\n"
                        + "join Account on Account.email = Accessory.email_shop_staff \n"
                        + "where Accessory.accessory_id like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Accessory_id);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    String url = rs.getString("address");
                    tmp = url;
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return tmp;
    }

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
    

    public static ArrayList<Accessory> getAccessByCate(int cate_id) {
        Connection cn = null;
        ArrayList<Accessory> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accessory_id,name,price,quantity,description,email_shop_staff,cate_id,email_platform_staff\n"
                        + "FROM Accessory\n"
                        + "WHERE cate_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, cate_id);
                ResultSet rs = pst.executeQuery();
                if (rs != null)
                    while (rs.next()) {
                        int id = rs.getInt("accessory_id");
                        String name = rs.getString("name");
                        float price = rs.getFloat("price");
                        int quantity = rs.getInt("quantity");
                        String description = rs.getString("description");
                        String email_shop_staff = rs.getString("email_shop_staff");
                        int cateID = rs.getInt("cate_id");
                        String email_platform_staff = rs.getString("email_platform_staff");
                        Accessory Ac = new Accessory(id, name, price, quantity, description, email_shop_staff, cateID, email_platform_staff);
                        list.add(Ac);
                    }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static boolean DeleteAccessory(int accessoryId){
        PreparedStatement stm = null;
        try {
            Connection c = DBUtils.makeConnection();
            if(c != null ){
            String sql = "Update dbo.Accessory\n "
                        +"Set quantity = 0 \n "
                        + "where accessory_id = ?";
            stm = c.prepareStatement(sql);
            stm.setInt(1, accessoryId);
            stm.executeUpdate();
            c.close();
            return true;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static ArrayList<Accessory> SortAccessoryPrice() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + " from [dbo].[Accessory]\n"
                        + "order by [dbo].[Accessory].[price] desc";
                 PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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
    
    public static ArrayList<Accessory> SortAccessoryPriceUP() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + " from [dbo].[Accessory]\n"
                        + "order by [dbo].[Accessory].[price] ASC";
                 PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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
    

    public static ArrayList<Accessory> SortNewAccessory() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM [dbo].[Accessory]\n"
                        + "ORDER BY [dbo].[Accessory].[accessory_id] DESC";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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

    public static ArrayList<Accessory> SortHotAccessory() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from [dbo].[Accessory]\n"
                        + "order by [dbo].[Accessory].[quantity] desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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

    public static ArrayList<Accessory> SortRamdomAccessory() {
        ArrayList<Accessory> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT *\n"
                        + "FROM [dbo].[Accessory]\n"
                        + "ORDER BY NEWID()";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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

        public static ArrayList<Accessory> getAccessoriesByPriceRange(float minPrice, float maxPrice) {
        try {
             ArrayList<Accessory> list = new ArrayList<>();
            
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT * FROM [dbo].[Accessory] WHERE price BETWEEN ? AND ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setFloat(1, minPrice);
                st.setFloat(2, maxPrice);                
                ResultSet rs = st.executeQuery();
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
    
    public static ArrayList<Accessory> getAccessoriesList2(String keyword) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT *\n"
                        + "FROM Accessory\n"
                        + "where quantity>0 and email_shop_staff=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, keyword);
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

    public static boolean updateAccessory(int accessory_id, String name, float price, int quantity, String description) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Accessory\n"
                        + "SET name =?, price=?,quantity=?, description=?\n"
                        + "WHERE accessory_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setFloat(2, price);
                pst.setInt(3, quantity);
                pst.setString(4, description);
                pst.setInt(5, accessory_id);
                int rowsAffected = pst.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static boolean deleteTmp(int accessory_id) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Accessory SET quantity = 0 WHERE accessory_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accessory_id);

                int rowsAffected = pst.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static ArrayList<Accessory> getAccessoriesDeletTmp(String keyword) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT *\n"
                        + "FROM Accessory\n"
                        + "where quantity=0 and email_shop_staff=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, keyword);
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

    public static boolean RecoverA(int accessory_id) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Update Accessory\n"
                        + "SET quantity = 1 WHERE accessory_id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accessory_id);

                int rowsAffected = pst.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static boolean addAccessory(String AccessoryName, String Description, int Quantity, float Price,String EmailS,String EmailP ) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Accessory(name, price, quantity, description,email_shop_staff,cate_id,email_platform_staff)\n"
                        + "VALUES(?,?,?,?,?,2,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, AccessoryName);
                pst.setFloat(2, Price);
                pst.setInt(3, Quantity);
                pst.setString(4, Description);
                pst.setString(5, EmailS);
                pst.setString(6, EmailP);

                int rowsAffected = pst.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    
    
    public static void main(String[] args) {
        ArrayList<Accessory> list = new ArrayList<>();
        list=getAccessoriesByPriceRange(0, 10);
        for (Accessory accessory : list) {
            System.out.println(accessory.getAccessory_id());
        }
        
    }
    
    
    
}
