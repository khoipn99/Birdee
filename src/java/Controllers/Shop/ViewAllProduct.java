package Controllers.Shop;

import DAL.ProductDAO;
import Model.Product;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "ViewAllProductShop", urlPatterns = {"/shop/product"})
public class ViewAllProduct extends HttpServlet {

    private static final String VIEW_PATH = "/views/Shop/AllProduct.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        User user = (User)request.getSession().getAttribute("account");
        List<Product> products = productDAO.getAllProductOfShop(user.getUserID());
        request.setAttribute("listProduct", products);
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
