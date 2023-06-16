/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACE
 */
public class MainController extends HttpServlet {


     

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = "HomeServlet";
            String action = null;
            action = request.getParameter("action");          
            if (action == null)          
                url = "HomeServlet";                                                                    
            else if (action.equals("Login"))
                url = "LoginServlet";            
            else if (action.equals("Search"))
                url = "SearchServlet";            
            else if (action.equals("RegisterAccount"))
                url = "registerAccount.jsp";
            else if(action.equals("Register"))
                url = "RegisterServlet";
            else if(action.equals("viewBirdDetail"))
                url = "BirdDetail";
            else if (action.equals("Logout"))
                url = "LogoutServlet";
            else if(action.equals("viewAccessoryDetail"))
                url = "AccessoryDetail";
            else if(action.equals("orderNow"))
                url = "orderNowPage.jsp";
            else if(action.equals("SearchToUpdate"))
                url = ".jsp";
            else if(action.equals("Product Page"))
                url = "staffPage.jsp";
            else if(action.equals("Account Page"))
                url = "accountStaffPage.jsp";
            else if(action.equals("staffDeleteBird"))
                url = "staffDeleteBird";
            else if(action.equals("staffDeleteAccessory"))
                url = "staffDeleteAccessory";
            else if(action.equals("Comment Page"))
                url = ".jsp";
            else if(action.equals("ShowBList"))
                url = "ShowBlistServlet";
            else if(action.equals("ShowAList"))
                url = "ShowAListServlet";
            else if(action.equals("addbird"))
                url = "AddBirdServlet";
            else if(action.equals("UpdateF"))
                url ="UpdateFServlet";
            else if(action.equals("UpdateB"))
                url = "UpdateBServlet";
            else if(action.equals("deleteTemp"))
                url ="DeleteTmpServlet";
            else if(action.equals("DeleP"))
                url ="ShowDeleteTmpServlet";
            else if(action.equals("restore"))
                url="restoreServlet";
            else if(action.equals("UpdateAccessoryF"))
                url ="UpdateAccessoryFServlet";
            else if(action.equals("UpdateA"))
                url = "UpdateAServlet";
            else if(action.equals("AddAccessory"))
                url ="AddAccessoryServlet";
            else if (action.equals("AddToCart"))
                url = "AddToCartServlet";
            else if (action.equals("VCI"))
                url = "VCIServlet";
            else if (action.equals("EditCusProfile"))
                url = "EditCusProfileServlet";
            else if(action.equals("viewOrderList"))
                url = "ViewOrderListServlet";
            else if (action.equals("sort"))
                url = "SortServlet1";
            else if (action.equals("sortup"))
                url= "SortUpServlet";
            else if (action.equals("sortNew"))
                url= "SortProductNew";        
            else if (action.equals("sortHot"))
                url= "SortHotProductServlet"; 
            else if (action.equals("Ramdom"))
                url= "RamdomProductServlet"; 
            else if(action.equals("ViewOrderDetail"))
                url = "ViewOrderDetailServlet";
            else if (action.equals("range"))
                url= "birdRange.jsp"; 
            else if(action.equals("sortbyrangeid"))
                url="SortBirdsByPriceRange";
          
            request.getRequestDispatcher(url).forward(request, response);
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
