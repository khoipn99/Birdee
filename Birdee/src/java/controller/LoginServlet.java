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
public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Boolean rem = Boolean.parseBoolean(request.getParameter("remember"));
            HttpSession session = request.getSession(true);
            Account acc = null;
            String msg = "";
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                
                response.sendRedirect("errorPage.jsp");
            }
            else {
                acc = AccountDAO.getAccount(email, password);
                if (acc == null) {
                    msg = "Invalid Email or Password";
                    request.setAttribute("msg", msg);                    
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                else {
                    if (rem) {
                        Cookie cEmail = new Cookie("cEmail", email);
                        Cookie cPass = new Cookie("cPass", password);
                        cEmail.setMaxAge(60 * 60 * 24 * 365);
                        cPass.setMaxAge(60 * 60 * 24 * 365);
                        response.addCookie(cEmail);
                        response.addCookie(cPass);
                    }
                    
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
                    else { //seller
                        request.setAttribute("userName", acc.getUsername());                        
                        request.getRequestDispatcher("home.jsp").forward(request, response);
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
