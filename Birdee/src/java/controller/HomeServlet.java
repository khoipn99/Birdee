/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACE
 */
public class HomeServlet extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            String uName = (String) session.getAttribute("userName");
            if (uName != null) //Da dang nhap            
                request.getRequestDispatcher("PrintProduct").forward(request, response);
            else { // Chua dang nhap
                Cookie[] cookies = request.getCookies();
                String cEmail = null;
                String cPass = null;
                for (Cookie c : cookies) {
                    if (c.getName().equals("cEmail")) 
                        cEmail = c.getValue();
                    
                    if (c.getName().equals("cPass")) 
                        cPass = c.getValue();
                    
                    if (cEmail != null && cPass != null) 
                        break;
                    
                }
                if (cEmail == null || cPass == null) 
                    request.getRequestDispatcher("PrintProduct").forward(request, response);
                else {
                    Account acc = null;
                    acc = AccountDAO.getAccount(cEmail, cPass);
                    if (acc == null) 
                        response.sendRedirect("PrintProduct");
                    else {
                        if (acc.getRole_id().equals("cus")) {
                            session.setAttribute("userName", acc.getUsername());
                            request.getRequestDispatcher("PrintProduct").forward(request, response);
                        } 
                        else if (acc.getRole_id().equals("ad")) {
                            request.setAttribute("userName", acc.getUsername());
                            request.getRequestDispatcher("adminPage.jsp").forward(request, response);
                        } 
                        else if (acc.getRole_id().equals("ma")) {
                            request.setAttribute("userName", acc.getUsername());
                            request.getRequestDispatcher("managerPage.jsp").forward(request, response);
                        } 
                        else if (acc.getRole_id().equals("staff")) {
                            request.setAttribute("userName", acc.getUsername());
                            request.getRequestDispatcher("staffPage.jsp").forward(request, response);
                        } 
                        else {
                            request.setAttribute("userName", acc.getUsername());
                            request.getRequestDispatcher("home.jsp").forward(request, response);
                        }
                    }
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
