<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enter Order ID</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Link to your main CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff6e5; /* Light honey theme background */
            color: #333; /* Dark text color */
            padding: 20px;
            max-width: 600px; /* Center the form */
            margin: auto; /* Center horizontally */
            border: 1px solid #ddd; /* Light border */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        h2 {
            color: #d28f00; /* Honey theme color */
        }
        form {
            display: flex;
            flex-direction: column; /* Vertical layout */
        }
        input[type="text"] {
            padding: 10px;
            margin-bottom: 10px; /* Space below the input */
            border: 1px solid #ddd; /* Light border */
            border-radius: 5px; /* Rounded corners */
        }
        input[type="submit"], .back-button {
            background-color: #d28f00; /* Honey theme button color */
            color: #333; /* Dark text color for visibility */
            border: none; /* No border */
            padding: 10px; /* Padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            font-size: 16px; /* Larger text */
            text-align: center;
        }
        input[type="submit"]:hover, .back-button:hover {
            background-color: #b27300; /* Darker shade on hover */
        }
        .back-button {
            margin-top: 10px; /* Space above the back button */
            text-decoration: none; /* No underline */
        }
    </style>
</head>
<body>
    <h2>Enter Order ID to Get Receipt</h2>
    <form action="receiptServlet" method="get">
        <label for="orderId">Order ID:</label>
        <input type="text" id="orderId" name="orderId" required/><br>
        <input type="submit" value="Get Receipt"/><br>
    </form>
    <a href="homepage.jsp" class="back-button">Go Back to Home Page</a>
</body>
</html>
