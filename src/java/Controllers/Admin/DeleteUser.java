package Controllers.Admin;

import DAL.UserDAO;
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
@WebServlet(name = "DeleteUser", urlPatterns = {"/admin/user/delete"})
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.valueOf(request.getParameter("userID"));
        UserDAO userDAO = new UserDAO();
        userDAO.deleteUserById(userID);
        response.sendRedirect("/admin/user");
    }

}
