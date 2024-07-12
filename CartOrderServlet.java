package Order;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            String product = request.getParameter("product");
            String quantity = request.getParameter("quantity");

            List<String> cartItems = (List<String>) session.getAttribute("cartItems");
            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

            cartItems.add(product + " - Quantity: " + quantity);
            session.setAttribute("cartItems", cartItems);
            response.sendRedirect("order_cart.jsp");
        } else if ("checkout".equals(action)) {
            // Handle the checkout process here
            // For now, just clear the cart and redirect
            session.setAttribute("cartItems", new ArrayList<>());
            response.sendRedirect("order_cart.jsp?checkout=true");
        }
    }
}
