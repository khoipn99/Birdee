package Controllers.Admin;

import DAL.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author nguyenson
 */
@WebServlet(name="ViewAllUser", urlPatterns={"/admin/user"})
public class ViewAllUser extends HttpServlet {
    
    private static String VIEW_PATH = "/views/Admin/AllUser.jsp";

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        ArrayList<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
