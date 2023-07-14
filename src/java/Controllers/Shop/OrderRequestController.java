/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Shop;

import DAL.OrderDetailsDAO;
import Model.OrderDetails;
import Model.User;
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
public class OrderRequestController extends HttpServlet {

    private final int recordsPerPage = 5;
    String textSearch = "";
    int sortOption = -1;

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
            out.println("<title>Servlet OrderRequestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderRequestController at " + request.getContextPath() + "</h1>");
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

        User account = (User) request.getSession().getAttribute("account");

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));

        }

        if (textSearch == null) {
            textSearch = "";
        }

        OrderDetailsDAO odDao = new OrderDetailsDAO();
        ArrayList<OrderDetails> list = odDao.getAllOrderDetailsByShop((page - 1) * recordsPerPage,
                recordsPerPage, textSearch, sortOption, 12, 1);

        int noOfRecords = odDao.getNoOfRecords(textSearch, 12, 1);

        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        request.setAttribute("list", list);

        request.setAttribute("textSearch", textSearch);
        request.setAttribute("sortOption", sortOption);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);

        request.getRequestDispatcher("views/Shop/OrderRequest.jsp").forward(request, response);
    }

//    public static void main(String[] args) {
//        OrderDetailsDAO odDao = new OrderDetailsDAO();
//        ArrayList<OrderDetails> list = odDao.getAllOrderDetailsByShop(0,
//                3, "", -1, 12);
//        int noOfRecords = odDao.getNoOfRecords("", 12);
//        System.out.println(noOfRecords);
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
        OrderDetailsDAO odDao = new OrderDetailsDAO();

        String action = request.getParameter("action");
        switch (action) {
            case "approve":
                int orderDetailsID = Integer.parseInt(request.getParameter("id"));
                if (request.getParameter(action).equalsIgnoreCase("true")) {
                    odDao.changeStatus(orderDetailsID, 2);
                    doGet(request, response);
                } else if (request.getParameter(action).equalsIgnoreCase("false")) {
                    odDao.changeStatus(orderDetailsID, 5);
                    doGet(request, response);
                }
                break;
            case "search":
                textSearch = request.getParameter("textSearch");
                sortOption = Integer.parseInt(request.getParameter("sortOption"));
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
