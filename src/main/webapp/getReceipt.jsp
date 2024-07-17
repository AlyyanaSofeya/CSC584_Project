<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Link to your main CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff6e5; /* Light honey theme background */
            color: #333; /* Dark text color */
            padding: 20px;
            max-width: 800px; /* Center the form */
            margin: auto; /* Center horizontally */
            border: 1px solid #ddd; /* Light border */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        h2 {
            color: #d28f00; /* Honey theme color */
        }
        p {
            font-size: 16px;
            margin: 5px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #d28f00; /* Honey theme color */
            color: #333; /* Dark text color */
        }
        .order-summary {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Receipt for Order Id ${order.orderId}</h2>
    <div class="order-summary">
        <p><strong>Date:</strong> ${order.date}</p>
        <p><strong>Total Amount:</strong> RM${order.totalAmount}</p>
        <p><strong>Status:</strong> ${order.status}</p>
    </div>
    <br>
    
    <h3>Order Items</h3>
    <table>
        <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        <c:forEach var="item" items="${order.items}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>RM${item.price}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>