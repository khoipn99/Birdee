/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccessoryDAO;
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
 * @author ASUS
 */
public class SearchServlet extends HttpServlet {

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
        // Get the search keyword from the request parameter
        String keyword = request.getParameter("txtsearch");
        
        // If the search keyword is empty or null, retrieve all birds and accessories
        if (keyword == null || keyword.trim().isEmpty()) {
            ArrayList<Bird> Blist = BirdDAO.getBirdsList();
            ArrayList<Accessory> Alist = AccessoryDAO.getAccessoriesList();
            
            request.setAttribute("BirdList", Blist);
            request.setAttribute("AccessoryList", Alist);
            request.getRequestDispatcher("home_search.jsp").forward(request, response);
        } else {
            // Perform a search for birds and accessories based on the search keyword
            ArrayList<Bird> Blist = BirdDAO.getBird(keyword);
            ArrayList<Accessory> Alist = AccessoryDAO.getAccessory(keyword);

            if (!Blist.isEmpty()) {
                request.setAttribute("BirdList", Blist);
            }

            if (!Alist.isEmpty()) {
                request.setAttribute("AccessoryList", Alist);
            }

            // If no results are found, set the ERROR attribute of the request object
            if (Blist.isEmpty() && Alist.isEmpty()) {
                request.setAttribute("ERROR", "Can not find anything with that name");
            }

            request.getRequestDispatcher("home_search.jsp").forward(request, response);
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
