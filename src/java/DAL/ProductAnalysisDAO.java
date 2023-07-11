package DAL;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguyenson
 */
public class ProductAnalysisDAO extends DBContext {

    public Double calculateMonthProfit(int year, int month) {
        try {
            String sql = "SELECT SUM(TotalOrder) * 0.05 AS Profit \n"
                    + "FROM Orders \n"
                    + "    JOIN StatusOrder \n"
                    + "        ON StatusValue = N'Hoàn thành' \n"
                    + "           AND StatusOrder.StatusOrderID = Orders.Status \n"
                    + "           AND YEAR(DateTime) = ? \n"
                    + "           AND MONTH(DateTime) = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, year);
            stm.setInt(2, month);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getDouble("Profit");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Double calculateWeekProfit(Date start, Date end) {
        try {
            String sql = "SELECT SUM(TotalOrder) * 0.05 AS Profit\n"
                    + "FROM Orders\n"
                    + "    JOIN StatusOrder\n"
                    + "        ON StatusValue = N'Hoàn thành'\n"
                    + "           AND StatusOrder.StatusOrderID = Orders.Status\n"
                    + "           AND DateTime\n"
                    + "           BETWEEN ? AND ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setDate(1, start);
            stm.setDate(2, end);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getDouble("Profit");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Integer calculateTotalProduct() {
        try {
            String sql = "SELECT COUNT(ProductId) AS Total\n"
                    + "FROM Products\n"
                    + "WHERE Status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getInt("Total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Integer calculateTotalNewProductInMonth(int year, int month) {
        try {
            String sql = "SELECT COUNT(ProductId) AS Total\n"
                    + "FROM Products\n"
                    + "WHERE Status = 1\n"
                    + "      AND YEAR(createDate) = ?\n"
                    + "      AND MONTH(createDate) = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, year);
            stm.setInt(2, month);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getInt("Total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void main(String[] args) {
        ProductAnalysisDAO a = new ProductAnalysisDAO();
        System.out.println(a.calculateMonthProfit(2023, 7));
        System.out.println(a.calculateWeekProfit(Date.valueOf("2023-07-01"), Date.valueOf("2023-07-30")));
        System.out.println(a.calculateTotalProduct());
        System.out.println(a.calculateTotalNewProductInMonth(2023, 7));
    }
}
