/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static dao.AccessoryDAO.getAccessoriesByPriceRange;
import dao.BirdDAO;
import dto.Accessory;
import dto.Bird;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class SortBirdsByPriceRange extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//        float minPrice = Float.parseFloat(request.getParameter("minPrice"));
//        float maxPrice = Float.parseFloat(request.getParameter("maxPrice"));
//        ArrayList<Bird> list10 = new ArrayList<>();
//        list10 = BirdDAO.getBirdsByPriceRange(minPrice, maxPrice);
//         ArrayList<Accessory> list11 = new ArrayList<>();
//        list11=getAccessoriesByPriceRange(minPrice, maxPrice);
//         request.setAttribute("Birdrange", list10);
//        request.setAttribute("Acrange", list11);
//        request.getRequestDispatcher("birdRange.jsp").forward(request, response);
        
//        float minPrice = Float.parseFloat(request.getParameter("minPrice"));
//        float maxPrice = Float.parseFloat(request.getParameter("maxPrice"));
//
//        ArrayList<Bird> list10 = new ArrayList<>();
//        ArrayList<Accessory> list11 = new ArrayList<>();
//
//            if (minPrice == null || maxPrice == null) {
//              request.getRequestDispatcher("birdRange.jsp").forward(request, response);
//            } else {
//                list10 = BirdDAO.getBirdsByPriceRange(minPrice, maxPrice);
//                list11 = getAccessoriesByPriceRange(minPrice, maxPrice);
//                request.setAttribute("Birdrange", list10);
//                request.setAttribute("Acrange", list11);
//                request.getRequestDispatcher("birdRange.jsp").forward(request, response);
//        }
      
            String minPriceParam =request.getParameter("minPrice");
            String maxPriceParam = request.getParameter("maxPrice");
            
            if(minPriceParam == null || minPriceParam.isEmpty() || maxPriceParam == null || maxPriceParam.isEmpty()  )
            {
                request.getRequestDispatcher("birdRange.jsp").forward(request, response);
            }else{
                int minPrice = Integer.parseInt(minPriceParam);
                int maxPrice = Integer.parseInt(maxPriceParam);
                ArrayList<Bird> list10 = new ArrayList<>();
                ArrayList<Accessory> list11 = new ArrayList<>();
                list10 = BirdDAO.getBirdsByPriceRange(minPrice, maxPrice);
                list11 = getAccessoriesByPriceRange(minPrice, maxPrice);
                request.setAttribute("Birdrange", list10);
                request.setAttribute("Acrange", list11);
                request.getRequestDispatcher("birdRange.jsp").forward(request, response);
            }
      
        }  
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
