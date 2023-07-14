package Controllers.Shop;

import DAL.BirdDetailsDAO;
import DAL.CategoryDAO;
import DAL.ImageProductDAO;
import DAL.ProductDAO;
import Model.BirdDetails;
import Model.Category;
import Model.Product;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "AddProductShop", urlPatterns = {"/shop/product/add"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddProduct extends HttpServlet {

    private final String REDIRECT_PATH = "/shop/product";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        Long price = Long.valueOf(request.getParameter("price"));
        int categoryId = Integer.valueOf(request.getParameter("category"));
        int quantity = Integer.valueOf(request.getParameter("quantity"));
        String origin = request.getParameter("origin");
        String description = request.getParameter("description");

        CategoryDAO categoryDAO = new CategoryDAO();
        ImageProductDAO imageProductDAO = new ImageProductDAO();
        ProductDAO productDAO = new ProductDAO();

        Category category = categoryDAO.getCategoryByID(categoryId);
        User shop = (User) request.getSession().getAttribute("account");
        Product product = new Product(name, price, quantity, Date.valueOf(LocalDate.now()), category, shop, description);

        int productId = productDAO.insert(product);

        System.out.println(productId);

        String location = getServletContext().getRealPath("") + File.separator + "images";
        File folder = new File(location);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        Part filePart = request.getPart("image");
        String fileName = LocalDateTime.now().toString().replace(":", "") + filePart.getSubmittedFileName();
        String filePath = location + File.separator + fileName;

        Part part = request.getPart("image");
        part.write(filePath);
        imageProductDAO.addImageProduct(productId, "/images/" + fileName);

        try {
            if (category.getTag().getTagName().equalsIgnoreCase("Chim")) {
                float weight = Float.valueOf(request.getParameter("weight"));
                float height = Float.valueOf(request.getParameter("height"));
                boolean gender = Boolean.valueOf(request.getParameter("gender"));
                BirdDetails birdDetails = new BirdDetails(null, Date.valueOf(LocalDate.now()), gender, height, weight, origin);
                BirdDetailsDAO birdDetailsDAO = new BirdDetailsDAO();
                birdDetailsDAO.insert(birdDetails, productId);
            }
        } catch (Exception ex) {
        }

        response.sendRedirect(REDIRECT_PATH);

    }

}
