<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="your.package.Product" %>
<%@ page import="your.package.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Cart</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="main-layout inner_page">
    <!-- header section omitted for brevity -->
    
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Our Products</h2>
            </div>
            <c:forEach var="product" items="${products}">
                <div class="col-md-3">
                    <div class="card mb-4">
                        <img class="card-img-top" src="${product.image}" alt="${product.name}">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">Price: RM ${product.price}</p>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="addToCart">
                                <input type="hidden" name="productId" value="${product.id}">
                                <div class="form-group">
                                    <label for="quantity_${product.id}">Quantity:</label>
                                    <input type="number" id="quantity_${product.id}" name="quantity" class="form-control" min="1" value="1" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h2>Your Cart</h2>
                <%
                    List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
                    if (cartItems == null || cartItems.isEmpty()) {
                %>
                <div class="alert alert-warning text-center">Your cart is empty.</div>
                <% } else { %>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CartItem item : cartItems) { %>
                        <tr>
                            <td><%= item.getProduct().getName() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>RM <%= item.getProduct().getPrice() %></td>
                            <td>RM <%= item.getQuantity() * item.getProduct().getPrice() %></td>
                            <td>
                                <form action="CartServlet" method="post">
                                    <input type="hidden" name="action" value="removeFromCart">
                                    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                                    <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } %>
            </div>
        </div>
    </div>
    <!-- footer section omitted for brevity -->
</body>
</html>
