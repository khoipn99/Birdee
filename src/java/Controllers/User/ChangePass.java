package Controllers.User;

import DAL.UserDAO;
import Model.User;
import Utils.EncodeMD5;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nguyenson
 */
@WebServlet(name = "ChangePass", urlPatterns = {"/userChangePass"})
public class ChangePass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("old-pass");
        String newPass = request.getParameter("new-pass");
        String newPass2 = request.getParameter("new-pass-2");
        EncodeMD5 encode = new EncodeMD5();
        String eOldPass = encode.EncoderMD5(oldPass);
        String eNewPass = encode.EncoderMD5(newPass);
        User user = (User) request.getSession().getAttribute("account");
        UserDAO userDAO = new UserDAO();

        if (user.getPassword().equals(eOldPass) && newPass.equals(newPass2)) {
            userDAO.changePass(user.getUserID(), eNewPass);
        }
        response.sendRedirect("/home");
    }

}
