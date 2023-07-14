package Controllers.Shop;

import DAL.CategoryDAO;
import DAL.ImageProductDAO;
import DAL.ProductDAO;
import Model.Category;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "UpdateProductShop", urlPatterns = {"/shop/product/update"})
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        Float price = Float.valueOf(request.getParameter("price"));
        int categoryId = Integer.valueOf(request.getParameter("category"));
        int quantity = Integer.valueOf(request.getParameter("quantity"));
        String description = request.getParameter("description");

        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();

        Category category = categoryDAO.getCategoryByID(categoryId);
        User shop = (User) request.getSession().getAttribute("account");
        
        Product product = productDAO.getProductByID(id);
        
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setCategory(category);
        product.setDescription(description);
        
        productDAO.updateProduct(product);
        
        response.sendRedirect(request.getContextPath() + "/shop/product");

    }

}
