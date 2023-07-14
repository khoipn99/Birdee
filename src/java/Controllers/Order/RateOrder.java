/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Order;

import DAL.OrderDetailsDAO;
import Model.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class RateOrder extends HttpServlet {

    private int orderDetailID;

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
            out.println("<title>Servlet RateOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RateOrder at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("id") != null) {
            orderDetailID = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("orderDetailID", orderDetailID);
            OrderDetailsDAO odDao = new OrderDetailsDAO();
            ArrayList<OrderDetails> list = odDao.getOrderDetailsByOrderID(orderDetailID);
            request.setAttribute("list", list);
            request.getRequestDispatcher("views/Account/RateOrder.jsp").forward(request, response);
        }else{
            response.sendRedirect("home");
        }
    }

    public static void main(String[] args) {
        OrderDetailsDAO odDao = new OrderDetailsDAO();
        ArrayList<OrderDetails> list = odDao.getOrderDetailsByOrderID(7);
        System.out.println(list.get(0).getQuantity());
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
        OrderDetailsDAO odDao = new OrderDetailsDAO();
        String action = request.getParameter("action");
        switch (action) {
            case "cancel":
                int id = Integer.parseInt(request.getParameter("idOrder"));
                odDao.changeStatus(id, 4);
                doGet(request, response);
                break;
        }
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
