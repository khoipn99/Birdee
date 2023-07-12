package Controllers.Admin;

import DAL.UserDAO;
import Model.Constants;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/adminUserUpdate"})
public class UpdateUser extends HttpServlet {

    private static String VIEW_PATH = "/views/Admin/AllUser.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.valueOf(request.getParameter("userID"));
        
        UserDAO userDAO = new UserDAO();
        ViewAllUser viewAllUser = new ViewAllUser();
        User user = userDAO.getUserByID(userID, true);
        
        String fullName = request.getParameter("fullName").trim();
        if (fullName.isEmpty()) {
            request.setAttribute("message", "Cập nhật thất bại: Tên không được để trống!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setFullName(fullName);
        
        user.setDob(Date.valueOf(request.getParameter("dob")));
        
        user.setGender(request.getParameter("gender"));
        
        String email = request.getParameter("email").trim();
        if (!email.matches(Constants.REGEX_EMAIL)) {
            request.setAttribute("message", "Cập nhật thất bại: Email không đúng định dạng!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setEmail(email);
        
        String address = request.getParameter("address").trim();
        if (address.isEmpty()) {
            request.setAttribute("message", "Cập nhật thất bại: Địa chỉ không được để trống!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setAddress(address);
        
        userDAO.updateUser(user);
        response.sendRedirect("/adminUser");
    }

}
