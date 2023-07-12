package Controllers.Staff;

import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nguyenson
 */
public class PublishProduct extends HttpServlet {

    private static final String VIEW_PATH = "/views/Staff/AllProduct.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("pid");
        Integer productId = Integer.valueOf(id);
        ProductDAO productDAO = new ProductDAO();
        productDAO.publishProduct(productId);
        response.sendRedirect("/staff/product");
    }

}
