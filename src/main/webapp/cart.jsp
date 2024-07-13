<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
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
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                // Get OrderID from session or request parameter
                                HttpSession session = request.getSession();
                                String orderID = (String) session.getAttribute("OrderID");
                                if (orderID == null) {
                                    orderID = "someDefaultOrderID"; // Replace with logic to get a valid OrderID
                                }

                                // Database connection
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/order_product", "root", "root");

                                // Fetch data from Order_Product table
                                String sql = "SELECT * FROM Order_Product WHERE OrderID='" + orderID + "'";
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery(sql);

                                while (rs.next()) {
                                    String prodID = rs.getString("ProdID");
                                    int quantity = rs.getInt("ProductQuantity");
                                    double price = rs.getDouble("TotalAmount") / quantity;
                                    double total = rs.getDouble("TotalAmount");

                                    // Assuming product details are fetched from another table or hardcoded for simplicity
                                    String productName = "";
                                    String productDescription = "";
                                    String productImage = "";

                                    if (prodID.equals("Biscoff")) {
                                        productName = "Biscoff Buttercookies";
                                        productDescription = "Delicious buttery cookies with a hint of Biscoff flavor.";
                                        productImage = "images/biscoff2.jpg";
                                    } else if (prodID.equals("Semperit")) {
                                        productName = "Semperit Susu";
                                        productDescription = "Traditional milk cookies with a soft, melt-in-your-mouth texture.";
                                        productImage = "images/semperitSusu.jpeg";
                                    } else if (prodID.equals("Dahlia")) {
                                        productName = "Dahlia Cookies";
                                        productDescription = "Delightful flower-shaped cookies with a rich buttery taste.";
                                        productImage = "images/dahlia.jpg";
                                    }

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
                            <td class="align-middle p-4"><input type="number" class="form-control text-center quantity" value="<%= quantity %>" min="1"></td>
                            <td class="text-right font-weight-semibold align-middle p-4 total">RM <%= total %></td>
                            <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
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
                    <input type="text" placeholder="ABC" class="form-control">
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
                <a href="#" class="btn btn-lg btn-primary mt-2">Checkout</a>
            </div>

        </div>
    </div>
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

        // Add event listeners to remove buttons
        const removeButtons = document.querySelectorAll('.close');
        removeButtons.forEach(button => {
            button.addEventListener('click', function() {
                const row = button.closest('tr');
                row.remove();
                updateTotalPrice();
            });
        });

        // Initial calculation of the total price
        updateTotalPrice();
    });
</script>

</body>
</html>
