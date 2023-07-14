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
@WebServlet(name = "UpdateProductShop", urlPatterns = {"/shop/product/update"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
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
        ImageProductDAO imageProductDAO = new ImageProductDAO();
        ProductDAO productDAO = new ProductDAO();

        Category category = categoryDAO.getCategoryByID(categoryId);
        User shop = (User) request.getSession().getAttribute("account");

        Product product = productDAO.getProductByID(id);

        //Delte old image
        imageProductDAO.deleteImageProduct(product.getProductId());

        //Update image
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
        imageProductDAO.addImageProduct(product.getProductId(), "/images/" + fileName);

        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setCategory(category);
        product.setDescription(description);

        productDAO.updateProduct(product);

        response.sendRedirect(request.getContextPath() + "/shop/product");

    }

}
