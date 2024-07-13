<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="paymentProject.OrderProduct" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>Payment Page</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="css/style1.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #b43f11;
        color: #333;
        margin: 0;
        padding: 0;
    }
    .container-custom {
        display: flex;
        width: 70%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .column {
        flex: 1;
        margin: 10px;
    }
    .column form, .column .cart {
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
    }
    .column h2 {
        color: #b43f11;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="text"], input[type="date"], input[type="time"], select {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="radio"] {
        margin-right: 10px;
    }
    input[type="submit"] {
        background-color: #b43f11;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #993610;
    }
    .cart {
        margin-top: 20px;
    }
    .cart p {
        margin: 5px 0;
        
    }
    .cart hr {
        border: 1px solid #b43f11;
    }
</style>
<script type="text/javascript">
    function toggleDeliveryForm() {
        var standardDelivery = document.getElementById("standardDelivery").checked;
        var inStorePickup = document.getElementById("inStorePickup").checked;
        var deliveryFormElements = document.querySelectorAll("#deliveryForm input, #deliveryForm select");

        deliveryFormElements.forEach(function(element) {
            if (inStorePickup) {
                if (element.id === "pickupDate" || element.id === "pickupTime") {
                    element.disabled = false; // Enable pickup date and time fields for in-store pickup
                } else {
                    element.disabled = true; // Disable other fields for in-store pickup
                }
            } else {
                element.disabled = !standardDelivery; // Disable form fields for standard delivery
            }
        });
        
        updateDeliveryCharge();
        toggleBankOptions();
        toggleCashPaymentOption();
        togglePickupDateTime();
    }
    
    function updateDeliveryCharge() {
        var standardDelivery = document.getElementById("standardDelivery").checked;
        var deliveryCharge = standardDelivery ? 10.00 : 0.00;
        document.getElementById("totalCharge").value = "RM " + deliveryCharge.toFixed(2);
    }

    function toggleBankOptions() {
        var onlineBanking = document.getElementById("onlineBanking").checked;
        var bankOptions = document.getElementById("bankOptions");

        bankOptions.style.display = onlineBanking ? "block" : "none";
    }
    
    function toggleCashPaymentOption() {
        var inStorePickup = document.getElementById("inStorePickup").checked;
        var cashPaymentOption = document.getElementById("cashPayment");
        var cashPaymentMessage = document.getElementById("cashPaymentMessage");

        cashPaymentOption.disabled = !inStorePickup;
        cashPaymentMessage.style.display = inStorePickup && cashPaymentOption.checked ? "block" : "none";
    }
    
    function togglePaymentOptions() {
        toggleBankOptions();
        toggleCashPaymentOption();
    }
    
    function togglePickupDateTime() {
        var inStorePickup = document.getElementById("inStorePickup").checked;
        var pickupDateTimeRow = document.getElementById("pickupDateTime");
        var pickupTimeRow = document.getElementById("pickupTime");

        if (inStorePickup) {
            pickupDateTimeRow.style.display = "table-row";
            pickupTimeRow.style.display = "table-row";
        } else {
            pickupDateTimeRow.style.display = "none";
            pickupTimeRow.style.display = "none";
        }
    }
    
    function setPaymentDateTime() {
        var now = new Date();
        var date = now.toISOString().split('T')[0]; // YYYY-MM-DD format
        var time = now.toTimeString().split(' ')[0]; // HH:MM:SS format

        document.getElementById("paymentDate").value = date;
        document.getElementById("paymentTime").value = time;
    }
    
    window.onload = function() {
        toggleDeliveryForm(); // Set initial state based on the selected radio button
        togglePaymentOptions();
    }
</script>
</head>
<body>
<div class="container-custom">
    <div class="column">
        <form action="PaymentControl1" method="get" onsubmit="setPaymentDateTime()">
            <h2>Delivery Type</h2>
            <label>
                <input type="radio" id="standardDelivery" name="deliveryType" value="standard" onclick="toggleDeliveryForm()"> Standard Delivery
            </label>
            <label>
                <input type="radio" id="inStorePickup" name="deliveryType" value="inStore" onclick="toggleDeliveryForm()"> In-Store Pickup
            </label>
            <div id="deliveryForm">
                <h2>Delivery Details</h2>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
                <label for="city">City:</label>
                <input type="text" id="city" name="city">
                <label for="postalCode">Postal Code:</label>
                <input type="text" id="postalCode" name="postalCode">
                
                <div id="pickupDateTime" style="display:none;">
                    <label for="pickupDate">Pickup Date:</label>
                    <input type="date" id="pickupDate" name="pickupDate">
                    <label for="pickupTime">Pickup Time:</label>
                    <input type="time" id="pickupTime" name="pickupTime">
                </div>
            </div>
            <h2>Payment Details</h2>
            <label>
                <input type="radio" id="onlineBanking" name="paymentType" value="onlineBanking" onclick="togglePaymentOptions()"> Online Banking
            </label>
            <label>
                <input type="radio" id="cashPayment" name="paymentType" value="cashPayment" onclick="togglePaymentOptions()"> Cash Payment
            </label>
            <div id="bankOptions" style="display:none;">
                <br>
                <label for="bank">Choose your bank:</label>
                <select id="bank" name="bank">
                    <option value="1">Bank Simpanan Nasional</option>
                    <option value="2">Maybank Berhad</option>
                </select>
            </div>
            <div id="cashPaymentMessage" style="display:none;">
                <p>You can pay upon pickup at store.</p>
            </div>
            <br>
            <input type="hidden" id="paymentDate" name="paymentDate">
            <input type="hidden" id="paymentTime" name="paymentTime">
            <br>
            <input type="submit" name="Pay" value="Pay">
        </form>
    </div>

    <div class="column">
        <div class="cart">
            <h2>Cart Details for Order ID: ${orderId}</h2>
            <%
                Object cartDetailsObj = request.getAttribute("cartDetails");
                List<OrderProduct> cartDetails = null;
                if (cartDetailsObj instanceof List) {
                    cartDetails = (List<OrderProduct>) cartDetailsObj;
                }

                if (cartDetails != null && !cartDetails.isEmpty()) {
                    for (OrderProduct product : cartDetails) {
            %>
                        <p>Product ID: <%= product.getProdID() %></p>
                        <p>Quantity: <%= product.getProductQuantity() %></p>
                        <p>Total Price: $<%= product.getTotalAmount() %></p>
                        <hr>
            <%
                    }
                } else {
            %>
                    <p>No items found for this order.</p>
            <%
                }
            %>
            <label>Total Charge:</label>
            <input type="text" id="totalCharge" name="totalCharge" value="RM 0.00" readonly>
        </div>
    </div>
</div>
</body>
</html>
