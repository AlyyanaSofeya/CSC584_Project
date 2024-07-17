<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        color: #333; 
    }
    th {
        background-color: #f2f2f2;
        color: #000; 
    }
    .order-summary {
        margin: 20px 0;
    }
</style>
</head>
<body>
    <header>
        <div class="container">
            <h1 class="logo"><a href="homepage.jsp">Honey Pastries</a></h1>
            <nav>
                <ul>
                    <li><a href="homepage.jsp">Home</a></li>
                    <li><a href="menu.jsp">Menu</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="main-content">
            <h2>Order History for User ID: ${historyBean.userId}</h2>
            <div class="order-summary">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${historyBean.orders}">
                            <tr>
                                <td>${order.orderId}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.totalAmount}</td>
                                <td>${order.status}</td>
                                <td>${order.itemId}</td>
                                <td>${order.productName}</td>
                                <td>${order.quantity}</td>
                                <td>${order.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>&copy; 2024 Honey Pastries. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>