package Controllers.Admin;

import DAL.ProductAnalysisDAO;
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
@WebServlet(name = "DashBoard", urlPatterns = {"/adminDashboard"})
public class DashBoard extends BaseAdminAuthenticationController {

    private static final String VIEW_PATH = "/views/Admin/DashBoard.jsp";

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductAnalysisDAO productAnalysisDAO = new ProductAnalysisDAO();
        Date currentDate = Date.valueOf(LocalDate.now());
        Date lastWeekStartDate = Date.valueOf(LocalDate.now().minusDays(7));
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        Double currentMonthProfit = productAnalysisDAO.calculateMonthProfit(year, month);
        Double lastWeekProfit = productAnalysisDAO.calculateWeekProfit(lastWeekStartDate, currentDate);
        int currentTotalProduct = productAnalysisDAO.calculateTotalProduct();
        int currentMonthTotalProduct = productAnalysisDAO.calculateTotalNewProductInMonth(year, month);
        request.setAttribute("currentMonthProfit", currentMonthProfit);
        request.setAttribute("lastWeekProfit", lastWeekProfit);
        request.setAttribute("currentTotalProduct", currentTotalProduct);
        request.setAttribute("currentMonthTotalProduct", currentMonthTotalProduct);
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
