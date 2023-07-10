/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Product;

import DAL.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ProductServlet extends HttpServlet {

    int page;
    int recordPerPage = 7;
    int minPrice = 0;
    int maxPrice = 100000000;
    int categoryID = -1;
    String textSearch = "";
    int sortID = -1;

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
            out.println("<title>Servlet ProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath() + "</h1>");
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

        page = 1;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        if (request.getParameter("categoryID") != null) {
            categoryID = Integer.parseInt(
                    request.getParameter("categoryID"));
        }else{
            categoryID = -1;
        }

        if (request.getSession().getAttribute("minPrice") != null) {
            minPrice = (int) request.getSession().getAttribute("minPrice");
        }
        if (request.getSession().getAttribute("maxPrice") != null) {
            maxPrice = (int) request.getSession().getAttribute("maxPrice");
        }

        String txt = (String) request.getSession().getAttribute("textSearch");
        if (txt != null) {
            textSearch = txt;
        }
        ProductDAO pDao = new ProductDAO();
        ArrayList<Product> listProducts = pDao.getAllProduct((page - 1) * recordPerPage, recordPerPage,
                textSearch, categoryID, minPrice, maxPrice, sortID);
        int totalRecord = pDao.getTotalRecord(textSearch, categoryID, minPrice, maxPrice);
        int noOfPages = (int) Math.ceil((double) totalRecord / recordPerPage);

        request.setAttribute("sortID", sortID);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("categoryID", categoryID);
        request.setAttribute("listProducts", listProducts);
        request.getRequestDispatcher("/views/product/listAllProduct.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        switch (action) {
            case "search":
                minPrice = Integer.parseInt(request.getParameter("minPrice"));
                maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
                request.getSession().setAttribute("minPrice", minPrice);
                request.getSession().setAttribute("maxPrice", maxPrice);
                doGet(request, response);
                break;
            case "sort":
                sortID = Integer.parseInt(request.getParameter("sortID"));
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
