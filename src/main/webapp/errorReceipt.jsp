<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Link to your main CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff6e5; /* Light honey theme background */
            color: #333; /* Dark text color */
            padding: 20px;
            max-width: 600px; /* Center the content */
            margin: auto; /* Center horizontally */
            border: 1px solid #ddd; /* Light border */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            text-align: center; /* Center text */
        }
        h2 {
            color: #d28f00; /* Honey theme color */
        }
        form {
            margin-top: 20px; /* Space above the form */
        }
        input[type="submit"] {
            background-color: #d28f00; /* Honey theme button color */
            color: #2c2c2c; /* Darker text color for visibility */
            border: none; /* No border */
            padding: 10px 20px; /* Padding */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            font-size: 16px; /* Larger text */
            transition: background-color 0.3s; /* Smooth transition */
        }
        input[type="submit"]:hover {
            background-color: #b27300; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <h2>Error: Order ID Not Found</h2>
    <p>Please check the Order ID you entered and try again.</p>
    <form action="inputOrderId.jsp">
        <input type="submit" value="Go Back >">
    </form>
</body>
</html>

