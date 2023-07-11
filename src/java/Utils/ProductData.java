/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import DAL.ProductDAO;
import Model.Product;
import java.util.ArrayList;

public class ProductData {
    public static ArrayList<Product> ProductData(){
        ProductDAO pdao = new ProductDAO();
        return  pdao.getAllProductParent(true);
    }
}
