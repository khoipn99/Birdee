package Controllers.Admin;

import DAL.UserDAO;
import Model.Constants;
import Model.User;
import Utils.EncodeMD5;
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
@WebServlet(name = "AddUser", urlPatterns = {"/admin/user/add"})
public class AddUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        EncodeMD5 encode = new EncodeMD5();
        ViewAllUser viewAllUser = new ViewAllUser();

        User user = new User();

        String fullName = request.getParameter("fullName").trim();
        if (fullName.isEmpty()) {
            request.setAttribute("message", "Thêm thất bại: Tên không được để trống!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setFullName(fullName);

        user.setDob(Date.valueOf(request.getParameter("dob")));

        user.setGender(request.getParameter("gender"));

        String email = request.getParameter("email").trim();
        if (!email.matches(Constants.REGEX_EMAIL)) {
            request.setAttribute("message", "Thêm thất bại: Email không đúng định dạng!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setEmail(email);

        String address = request.getParameter("address").trim();
        if (address.isEmpty()) {
            request.setAttribute("message", "Thêm thất bại: Địa chỉ không được để trống!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setAddress(address);

        String phone = request.getParameter("phone").trim();
        if (!phone.matches(Constants.REGEX_PHONE)) {
            request.setAttribute("message", "Thêm thất bại: Số điện thoại không đúng định dạng!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setPhone(request.getParameter("phone"));
        
        String password = request.getParameter("password").trim();
        if (!password.matches(Constants.REGEX_PASSWORD)) {
            request.setAttribute("message", "Thêm thất bại: Password phải có ít nhất 6 ký tự!");
            viewAllUser.doGet(request, response);
            return;
        }
        user.setPassword(encode.EncoderMD5(password));

        boolean isExist = userDAO.isUserExist(user.getEmail());

        if (!isExist) {
            userDAO.insert(user);
        }

        response.sendRedirect("/admin/user");
    }

}
