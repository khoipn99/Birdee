package Controllers.Shop;

import DAL.ImageProductDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "DeleteProductShop", urlPatterns = {"/shop/product/delete"})
public class DeleteProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));

        ImageProductDAO imageProductDAO = new ImageProductDAO();
        ProductDAO productDAO = new ProductDAO();

        try {
            imageProductDAO.deleteImageProduct(id);
        } catch (Exception ex) {
        }
        
        productDAO.deleteProductById(id);
        response.sendRedirect(request.getContextPath() + "/shop/product");
    }

}
