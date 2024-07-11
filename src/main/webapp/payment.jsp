<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>
<style>
    .container {
        display: flex;
    	width: 50%;
    }
    .column {
        flex: 1;
        margin: 10px;
    }
    .column form, .column .cart {
        border: 1px solid #ccc;
        padding: 20px;
        border-radius: 5px;
    }
    .paymentForm {
    	display: flex;
    	margin: 0px auto;
    	justify-content: center;
    }
    
</style>
<script type="text/javascript">
    function toggleDeliveryForm() {
        var standardDelivery = document.getElementById("standardDelivery").checked;
        var deliveryFormElements = document.querySelectorAll("#deliveryForm input, #deliveryForm select");

        deliveryFormElements.forEach(function(element) {
            element.disabled = !standardDelivery;
        });
        
        toggleCashPaymentOption();
    }

    function toggleBankOptions() {
        var onlineBanking = document.getElementById("onlineBanking").checked;
        var bankOptions = document.getElementById("bankOptions");

        bankOptions.style.display = onlineBanking ? "block" : "none";
    }
    
    function toggleCashPaymentOption() {
        var inStorePickup = document.getElementById("inStorePickup").checked;
        var cashPaymentOption = document.getElementById("cashPayment");

        cashPaymentOption.disabled = !inStorePickup;
    }

    window.onload = function() {
        toggleDeliveryForm(); // Set initial state based on the selected radio button
        toggleBankOptions(); // Set initial state based on the selected payment type
        toggleCashPaymentOption();
    }
</script>
</head>
<body>
<div class=paymentForm>
<div class="container">
    <div class="column">
        <form action="payment" method="post">
            <label>Delivery Type :</label>
            <input type="radio" id="standardDelivery" name="deliveryType" value="standard" onclick="toggleDeliveryForm()"> Standard Delivery
            <input type="radio" id="inStorePickup" name="deliveryType" value="inStore" onclick="toggleDeliveryForm()"> In-Store Pickup
            <div id=deliveryForm>
           <h2>Delivery</h2>
           <table>
                <tr><td><label for="name">Name:</label></td>
                <td><input type="text" id="name" name="name" ></td></tr>
                <tr><td><label for="address">Address:</label></td>
                <td><input type="text" id="address" name="address"></td></tr>
                <tr><td><label for="city">City:</label></td>
                <td><input type="text" id="city" name="city"></td></tr>
                <tr><td><label for="postalCode">Postal Code:</label></td>
                <td><input type="text" id="postalCode" name="postalCode"></td></tr>
                </table>
                </div>
                <h2>Payment</h2>
            <label>Payment Type :</label>
            <input type="radio" id="onlineBanking" name="paymentType" value="onlineBanking" onclick="toggleBankOptions()"> Online Banking
            <input type="radio" id="cashPayment" name="paymentType" value="cashPayment" > Cash Payment
            <div id=bankOptions>
            <br>
            <label for="bank">Choose your bank:</label>
            <select id="bank" name="bank">
                <option value="1">Bank Simpanan Nasional</option>
                <option value="2">Maybank Berhad</option>
            </select></div>
            <br><input type=submit name=submit>
        </form>
        </div>
    </div>

    <div class="column">
        <div class="cart">
            <h2>Cart Details</h2>
            <p>Item 1: $10.00</p>
            <p>Item 2: $15.00</p>
            <p>Item 3: $20.00</p>
            <hr>
            <h3>Total: $45.00</h3>
        </div>
    </div>
</div>
</body>
</html>
