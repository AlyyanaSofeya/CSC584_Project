package getReceipt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/receiptServlet")
public class ReceiptServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        // Assuming you have a method to validate and get order details
        Order order = OrderService.getOrderDetails(orderId);

        if (order != null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("getReceipt.jsp").forward(request, response);
        } else {
            response.sendRedirect("errorReceipt.jsp");
        }
    }
}
