<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.jsp.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Your Shopping Cart</h1>
    <%
        // Ensure that we are within a session
        HttpSession session = request.getSession();
        String orderID = (String) session.getAttribute("OrderID");
        if (orderID == null) {
            orderID = "someDefaultOrderID"; // Replace with logic to get a valid OrderID
        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/order_product", "root", "root");

            // Fetch products in the order
            String sql = "SELECT ProdID, ProductQuantity, TotalAmount FROM Order_Product WHERE OrderID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderID);
            rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) {    
                out.println("<p>Your cart is empty.</p>");
            } else {
                out.println("<table border='1'>");
                out.println("<tr><th>Product ID</th><th>Quantity</th><th>Total Amount</th></tr>");
                while (rs.next()) {
                    String prodID = rs.getString("ProdID");
                    int quantity = rs.getInt("ProductQuantity");
                    double total = rs.getDouble("TotalAmount");
                    out.println("<tr>");
                    out.println("<td>" + prodID + "</td>");
                    out.println("<td>" + quantity + "</td>");
                    out.println("<td>" + total + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
