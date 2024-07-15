<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="bean" scope="request" type="getReceipt.OrderItem" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9; /* Light background */
            color: #333; /* Dark text color */
            padding: 20px;
        }
        h2, h3 {
            color: #d28f00; /* Honey theme color */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2; /* Light gray for headers */
        }
        tr:hover {
            background-color: #f1f1f1; /* Light hover effect */
        }
    </style>
</head>
<body>
    <h2>Receipt for Your Order</h2>
    <p>Date: <jsp:getProperty name="bean" property="date" /></p>
    <p>Total Amount: <jsp:getProperty name="bean" property="totalAmount" /></p>
    <p>Status: <jsp:getProperty name="bean" property="status" /></p>
    
    <h3>Order Items</h3>
    <table>
        <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        <c:forEach var="item" items="${bean.order_details}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.quantity}</td>
                <td>$${item.price}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
