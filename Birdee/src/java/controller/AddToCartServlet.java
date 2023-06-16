/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dto.Accessory_Sub_Cart;
import dto.Bird_Sub_Cart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACE
 */
public class AddToCartServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String birdID = request.getParameter("birdID");
            String cateID = request.getParameter("cateID");
            String aryID = request.getParameter("aryID");
            Bird_Sub_Cart bc = new Bird_Sub_Cart();
            Accessory_Sub_Cart ac = new Accessory_Sub_Cart();
            boolean kq = true;
            int kq2 = 0;
            if (birdID != null && !birdID.isEmpty()) {
                bc = CartDAO.getBirdCart(Integer.parseInt(birdID));
                kq = CartDAO.checkBirdCart(bc.getBird_id());
                if (kq == true) {
                    kq2 = CartDAO.addBirdCart(Integer.parseInt(cateID), 1, Integer.parseInt(birdID));
                }
                else {
                    kq2 = CartDAO.addBirdQuantity(bc, 1);
                }
            }
            if (aryID != null && !aryID.isEmpty()) {
                ac = CartDAO.getAccessoryCart(Integer.parseInt(aryID));
                kq = CartDAO.checkAccessoryCart(ac.getAccessory_id());
                if (kq == true) {
                    kq2 = CartDAO.addAccessoryCart(Integer.parseInt(cateID), 1, Integer.parseInt(aryID));
                }
                else {
                    kq2 = CartDAO.addAccessoryQuantity(ac, 1);
                }
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
