package Controllers.Staff;

import DAL.ProductDAO;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author nguyenson
 */
public class ViewAllProduct extends HttpServlet {
    
    private static final String VIEW_PATH = "/views/Staff/AllProduct.jsp";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProduct();
        request.setAttribute("listProduct", products);
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
}
