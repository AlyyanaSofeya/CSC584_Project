<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin-top: 20px;
            background: #eee;
        }
        .ui-w-40 {
            width: 40px !important;
            height: auto;
        }
        .card {
            box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
        }
        .ui-product-color {
            display: inline-block;
            overflow: hidden;
            margin: .144em;
            width: .875rem;
            height: .875rem;
            border-radius: 10rem;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <form action="CreateOrderServlet" method="get">
        <div class="card">
            <div class="card-header">
                <h2>Shopping Cart</h2>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered m-0">
                        <thead>
                            <tr>
                                <!-- Set columns width -->
                                <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ion ion-md-trash"></i></a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection conn = null;
                                PreparedStatement pstmt = null;
                                ResultSet rs = null;

                                try {
                                	
                                	Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");

                                    // Retrieve the last OrderID from the database and increment by 1
                                    String getLastOrderIDSQL = "SELECT MAX(OrderID) AS LastOrderID FROM `order`"; // Query to get the last OrderID
                                    Statement stmt1 = con.createStatement();
                                    ResultSet rs1 = stmt1.executeQuery(getLastOrderIDSQL);
									
                                    int orderID;
                                    if (rs1.next()) {
                                        orderID = rs1.getInt("LastOrderID"); // Increment the last OrderID by 1
                                    } else {
                                        // Handle case when no orders exist yet (start from 1, for example)
                                        orderID = 301; // Set initial orderID if no orders exist yet
                                    }

                                    // Debugging output
                                    out.println("OrderID: " + orderID);

                                    if (orderID == 0) {
                                        // Debugging output for missing OrderID
                                        out.println("OrderID is missing in session.");
                                        // Handle missing OrderID
                                        // response.sendRedirect("error.jsp");
                                        // return;
                                    } else {
                                        // Database connection
                                        Class.forName("com.mysql.jdbc.Driver");
                                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject", "root", "root");
										
                                        String id=String.valueOf(orderID);
                                        // Fetch data from Order_Product table
                                        String sql = "SELECT * FROM order_product WHERE OrderID=?";
                                        pstmt = conn.prepareStatement(sql);
                                        pstmt.setString(1,id);
                                        rs = pstmt.executeQuery();

                                        if (!rs.isBeforeFirst()) {
                                            // Handle empty result set
                                            out.println("No products found for OrderID: " + orderID);
                                        } else {
                                            while (rs.next()) {
                                                String prodID = rs.getString("ProdID");
                                                int quantity = rs.getInt("ProductQuantity");
                                                double price = rs.getDouble("TotalAmount") / quantity;
                                                double total = rs.getDouble("TotalAmount");

                                                // Fetch product details from Products table
                                                String productSql = "SELECT * FROM product WHERE ProdID=?";
                                                PreparedStatement productPstmt = conn.prepareStatement(productSql);
                                                productPstmt.setString(1, prodID);
                                                ResultSet productRs = productPstmt.executeQuery();

                                                String productName = "";
                                                String productDescription = "";
                                                String productImage = "";

                                                if (productRs.next()) {
                                                    productName = productRs.getString("ProductName");
                                                    productDescription = productRs.getString("ProductDescription");
                                                    productImage = productRs.getString("ProductImage");
                                                }

                                                productRs.close();
                                                productPstmt.close();
                            %>
                            <tr>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <img src="<%= productImage %>" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark"><%= productName %></a>
                                            <small>
                                                <span class="text-muted">Description:</span> <%= productDescription %>
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">RM <%= price %></td>
                                <td class="align-middle p-4"><input type="number" class="form-control text-center quantity" name="quantity_<%= prodID %>" value="<%= quantity %>" min="1"></td>
                                <td class="text-right font-weight-semibold align-middle p-4 total">RM <%= total %></td>
                                <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                            </tr>
                            <%
                                            }
                                        }
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println("Error: " + e.getMessage());
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
                        </tbody>
                    </table>
                </div>
                <!-- / Shopping cart table -->

                <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                    <div class="mt-4">
                        <label class="text-muted font-weight-normal">Promocode</label>
                        <input type="text" name="promocode" placeholder="ABC" class="form-control">
                    </div>
                    <div class="d-flex">
                        <div class="text-right mt-4 mr-5">
                            <label class="text-muted font-weight-normal m-0">Discount</label>
                            <div class="text-large"><strong>RM 0</strong></div>
                        </div>
                        <div class="text-right mt-4">
                            <label class="text-muted font-weight-normal m-0">Total price</label>
                            <div class="text-large"><strong id="total-price">RM 0.00</strong></div>
                        </div>
                    </div>
                </div>

                <div class="float-right">
                    <a href="#" class="btn btn-lg btn-outline-primary md-btn-flat mt-2 mr-3">Continue Shopping</a>
                    <button type="submit" class="btn btn-lg btn-primary mt-2">Update Cart</button>
                    <a href="CheckoutServlet" class="btn btn-lg btn-success mt-2">Checkout</a>
                </div>

            </div>
        </div>
    </form>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Function to update the total price
        function updateTotalPrice() {
            let totalPrice = 0;
            document.querySelectorAll('.total').forEach(function (element) {
                const price = parseFloat(element.textContent.replace('RM', '').trim());
                totalPrice += price;
            });
            document.getElementById('total-price').textContent = 'RM ' + totalPrice.toFixed(2);
        }

        // Add event listeners to quantity input fields
        document.querySelectorAll('.quantity').forEach(function (element) {
            element.addEventListener('input', function () {
                const quantity = parseInt(element.value);
                const price = parseFloat(element.closest('tr').querySelector('.text-right').textContent.replace('RM', '').trim());
                const totalElement = element.closest('tr').querySelector('.total');
                totalElement.textContent = 'RM ' + (quantity * price).toFixed(2);
                updateTotalPrice();
            });
        });

        // Initial total price calculation
        updateTotalPrice();
    });
</script>
</body>
</html>

