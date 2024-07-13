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
        background-color: #F0F0F0;
    }

    header {
        background-color: #8B4513;
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
        padding: 20px;
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
        background-color: #FFA07A;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #FFF5EE;
    }

    tr:hover {
        background-color: #FFFAF0;
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

    .total-sales {
        background-color: #FFE4E1;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .total-sales h3 {
        margin: 0;
        color: #FF4500;
    }

    @media (max-width: 600px) {
        nav ul {
            flex-direction: column;
            text-align: center;
        }

        nav ul li {
            margin: 10px 0;
        }

        .header-container {
            flex-direction: column;
        }
    }
</style>
</head>
<body>
<header>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
  
    <div class="header-container">
        <div class="logo-section">
            <a href="index.html"><img src="lyssaalogo.png" alt="Logo"/></a>
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

    <section id="total-sales" class="total-sales">
        <h3>Total Sales: <span id="totalSalesAmount">RM</span></h3>
    </section>
</main>
