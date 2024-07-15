package getReceipt;

import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/viewOrderHistory")
public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Integer userId = (Integer) session.getAttribute("userId");
                if (userId != null) {
                    List<OrderDetail> orderHistory = getOrderHistory(userId);

                    OrderHistoryBean historyBean = new OrderHistoryBean();
                    historyBean.setUserId(userId);
                    historyBean.setOrders(orderHistory);

                    request.setAttribute("historyBean", historyBean);
                    RequestDispatcher rd = request.getRequestDispatcher("orderHistory.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("login.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private List<OrderDetail> getOrderHistory(int userId) {
        List<OrderDetail> orderHistory = new ArrayList<>();

        try {
            // Initialize JDBC connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

            // Fetch order history
            String query = "SELECT * FROM order_details WHERE user_id = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        OrderDetail detail = new OrderDetail();
                        detail.setOrderId(rs.getInt("order_id"));
                        detail.setUserId(rs.getInt("user_id"));
                        detail.setOrderDate(rs.getTimestamp("order_date"));
                        detail.setTotalAmount(rs.getBigDecimal("total_amount"));
                        detail.setStatus(rs.getString("status"));
                        detail.setItemId(rs.getInt("item_id"));
                        detail.setProductName(rs.getString("product_name"));
                        detail.setQuantity(rs.getInt("quantity"));
                        detail.setPrice(rs.getBigDecimal("price"));
                        orderHistory.add(detail);
                    }
                }
            }

            // Close connection
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return orderHistory;
    }
}