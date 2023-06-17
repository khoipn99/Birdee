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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACE
 */
public class EditCusProfileServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String Uname = request.getParameter("UName");
            if(Uname.equals("")|| Uname == null){
                Account tmp = (Account) session.getAttribute("acc");
                Uname = tmp.getUsername();
            }
            String UAddress = request.getParameter("UAddress");
            if(UAddress.equals("")|| UAddress == null){
                Account tmp = (Account) session.getAttribute("acc");
                UAddress = tmp.getAddress();
            }
            String UphoneNumber = request.getParameter("UphoneNumber");
            if(UphoneNumber.equals("") || UphoneNumber == null){
                Account tmp = (Account) session.getAttribute("acc");
                UphoneNumber = tmp.getPhone();
            }
            Account tmp = (Account) session.getAttribute("acc");
            String email = tmp.getEmail();
            int kq = AccountDAO.UpdateAccount(Uname, email, UAddress, UphoneNumber);
            if(kq>0){
                request.setAttribute("msg", "Update thanh cong");
                Account tmp1 = AccountDAO.getAccountByEmail(email);
                session.setAttribute("acc", tmp1);
                session.setAttribute("userName", tmp1.getUsername());
                request.getRequestDispatcher("viewCusInfor.jsp").forward(request, response);
            }else{
                request.setAttribute("msg", "Đã có lỗi xảy ra trong quá trình cập nhập vui lòng thử lại");
                request.getRequestDispatcher("viewCusInfor.jsp").forward(request, response);
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
