<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Cart</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <style>
        .product img {
            width: 150px; /* Ensures the images are the same size */
            height: 150px;
            object-fit: cover;
        }
        .product {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px 0;
        }
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .product-form {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- Order Section -->
            <div class="col-md-6">
                <h3>Place Your Order</h3>
                <div class="products">
                    <div class="product">
                        <img src="images/biscoff.jpg" alt="Biscoff Buttercookies" class="img-fluid">
                        <p><strong>Biscoff Buttercookies</strong> - RM 32.00</p>
                        <p>Delicious cookies with a rich, caramelized taste of Biscoff.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Biscofff Buttercookies">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantityBiscoff">Quantity:</label>
                                <input type="number" id="quantityBiscoff" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product">
                        <img src="images/semperit.jpg" alt="Semperit Susu" class="img-fluid">
                        <p><strong>Semperit Susu</strong> - RM 28.00</p>
                        <p>Soft, buttery cookies with a melt-in-your-mouth texture.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Semperit Susu">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantitySemperit">Quantity:</label>
                                <input type="number" id="quantitySemperit" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product">
                        <img src="images/dahlia.jpg" alt="Dahlia Cookies" class="img-fluid">
                        <p><strong>Dahlia Cookies</strong> - RM 35.00</p>
                        <p>Classic cookies with a floral pattern and rich taste.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Dahlia Cookies">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantityDahlia">Quantity:</label>
                                <input type="number" id="quantityDahlia" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product">
                        <img src="images/almond.jpg" alt="Almond London Cookies" class="img-fluid">
                        <p><strong>Almond London Cookies</strong> - RM 26.00</p>
                        <p>Crunchy almond cookies coated in smooth chocolate.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Almond London Cookies">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantityAlmond">Quantity:</label>
                                <input type="number" id="quantityAlmond" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product">
                        <img src="images/redPearl.jpeg" alt="Red Pearl Cookies" class="img-fluid">
                        <p><strong>Red Pearl Cookies</strong> - RM 28.00</p>
                        <p>Delicious cookies with a unique red pearl design.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Red Pearl Cookies">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantityRedPearl">Quantity:</label>
                                <input type="number" id="quantityRedPearl" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                    <div class="product">
                        <img src="images/rainbowChip.jpeg" alt="Rainbow Chocolate Chip" class="img-fluid">
                        <p><strong>Rainbow Chocolate Chip</strong> - RM 35.00</p>
                        <p>Colorful cookies with chocolate chips and a rainbow of flavors.</p>
                        <form action="CartOrderServlet" method="post" class="product-form">
                            <input type="hidden" name="product" value="Rainbow Chocolate Chip">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="quantityRainbowChip">Quantity:</label>
                                <input type="number" id="quantityRainbowChip" name="quantity" class="form-control" min="1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Cart Section -->
            <div class="col-md-6">
                <h3>Your Cart</h3>
                <div class="cart">
                    <% 
                        List<String> cartItems = (List<String>) session.getAttribute("cartItems");
                        if (cartItems == null) {
                            cartItems = new ArrayList<>();
                            session.setAttribute("cartItems", cartItems);
                        }
                    %>
                    <ul>
                        <% for (String item : cartItems) { %>
                            <li><%= item %></li>
                        <% } %>
                    </ul>
                    <% if (cartItems.isEmpty()) { %>
                        <p>Your cart is empty.</p>
                    <% } else { %>
                        <form action="CartOrderServlet" method="post">
                            <input type="hidden" name="action" value="checkout">
                            <button type="submit" class="btn btn-success">Checkout</button>
                        </form>
                    <% } %>
                </div>
                <% if ("true".equals(request.getParameter("checkout"))) { %>
                    <div class="alert alert-success" role="alert">
                        Checkout successful! Thank you for your purchase.
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>