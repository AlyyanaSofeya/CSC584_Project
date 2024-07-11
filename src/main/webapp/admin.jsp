<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Homepage</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #C04000;
    }

    header {
        background-color: #834333;
        color: white;
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    nav ul {
        list-style: none;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    nav ul li {
        margin: 0 20px;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }

    nav ul li a:hover {
        text-decoration: underline;
    }

    main {
        padding: 40px 20px;
        max-width: 1000px;
        margin: 0 auto;
    }

    section {
        margin-bottom: 40px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: white;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .header-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
    }

    .logo-section img {
        max-height: 50px;
    }

    .nav-container {
        display: flex;
        align-items: center;
    }

    .nav-container nav {
        margin-left: 20px;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<header>
 <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
  
    <div class="header-container">
        <div class="logo-section">
            <a href="index.html"><img src="images/logo1.png" alt="Logo"/></a>
        </div>
        <div class="nav-container">
            <nav>
                <ul>
                    <li><a class="logout-link" href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <h1>Admin Dashboard</h1>
</header>

<main>
    <section id="home">
        <h2>Welcome, Admin!</h2>
    </section>

    <section id="orders">
        <h2>Customer Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Product ID</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody id="orderTableBody">
                <!-- Order rows will be dynamically inserted here -->
            </tbody>
        </table>
    </section>
</main>
</body>
</html>
