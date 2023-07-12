package Controllers.User;

import DAL.BirdDetailsDAO;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import DAL.TagDAO;
import Model.BirdDetails;
import Model.Category;
import Model.Product;
import Model.Tag;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author nguyenson
 */
public class AddProduct extends HttpServlet {

    private static final String FORM_PATH = "/views/Product/AddProduct.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(FORM_PATH);
        TagDAO tagDAO = new TagDAO();
        List<Tag> tags = tagDAO.getAll();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAll();
        request.setAttribute("tags", tags);
        request.setAttribute("categories", categories);
//        requestDispatcher.forward(request, response);
        response.sendRedirect("/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Long price = Long.valueOf(request.getParameter("price"));
        int categoryId = Integer.valueOf(request.getParameter("category"));
        String origin = request.getParameter("origin");
        float weight = Float.valueOf(request.getParameter("weight"));
        float height = Float.valueOf(request.getParameter("height"));
        boolean gender = Boolean.valueOf(request.getParameter("gender"));
        String description = request.getParameter("description");

        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();

        Category category = categoryDAO.getCategoryByID(categoryId);
        Product product = new Product(name, price, 1, Date.valueOf(LocalDate.now()), category, description);
        int productId = productDAO.insert(product);

        System.out.println(productId);

        try {
            if (category.getTag().getTagName().equalsIgnoreCase("Chim")) {
                BirdDetails birdDetails = new BirdDetails(null, Date.valueOf(LocalDate.now()), gender, height, weight, origin);
                BirdDetailsDAO birdDetailsDAO = new BirdDetailsDAO();
                birdDetailsDAO.insert(birdDetails, productId);
            }
        } catch (Exception ex) {
        }

    }

}
