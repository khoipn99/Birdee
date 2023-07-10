/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Authenticate;

import DAL.UserDAO;
import Model.User;
import Utils.EncodeMD5;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
    }

//    public static void main(String[] args) {
//        EncodeMD5 encode = new EncodeMD5();
//        UserDAO uDAO = new UserDAO();
//        User user = uDAO.doLogin("cus1@gmail.com", encode.EncoderMD5("123@123"));
//        System.out.println(user);
//    }
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
        HttpSession session = request.getSession();
        
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        
        if(request.getParameter("remember") != null){
            session.setAttribute("uid", uid);
            session.setAttribute("pwd", pwd);
            session.setAttribute("remember", true);
        }
        
        EncodeMD5 encode = new EncodeMD5();
        String encodePwd = encode.EncoderMD5(pwd);

        UserDAO uDAO = new UserDAO();
        User user = uDAO.doLogin(uid, encodePwd);
        if (user != null) {
            request.getSession().setAttribute("account", user);
            response.sendRedirect("home");
        } else {
            request.setAttribute("isFail", true);
            request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
        }
    }
    
    public static void main(String[] args) {
        UserDAO uDAO = new UserDAO();
        EncodeMD5 encode = new EncodeMD5();
        User user = uDAO.doLogin("shop1", encode.EncoderMD5("123@123"));
        System.out.println(user.getRole().getId());
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
