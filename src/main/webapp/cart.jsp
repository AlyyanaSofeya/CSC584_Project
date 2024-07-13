<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin-top: 20px;
            background: #eee;
        }

        .ui-w-40 {
            width: 40px !important;
            height: auto;
        }

        .card {
            box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
        }

        .ui-product-color {
            display: inline-block;
            overflow: hidden;
            margin: .144em;
            width: .875rem;
            height: .875rem;
            border-radius: 10rem;
            -webkit-box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <div class="card">
        <div class="card-header">
            <h2>Shopping Cart</h2>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered m-0">
                    <thead>
                        <tr>
                            <!-- Set columns width -->
                            <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                            <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                            <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                            <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                            <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ion ion-md-trash"></i></a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="p-4">
                                <div class="media align-items-center">
                                    <img src="images/biscoff2.jpg" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                    <div class="media-body">
                                        <a href="#" class="d-block text-dark">Biscoff Buttercookies</a>
                                        <small>
                                            <span class="text-muted">Description:</span> Delicious buttery cookies with a hint of Biscofff flavor.
                                        </small>
                                    </div>
                                </div>
                            </td>
                            <td class="text-right font-weight-semibold align-middle p-4">RM 32.00</td>
                            <td class="align-middle p-4"><input type="number" class="form-control text-center quantity" value="2" min="1"></td>
                            <td class="text-right font-weight-semibold align-middle p-4 total">RM 64.00</td>
                            <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                        </tr>

                        <tr>
                            <td class="p-4">
                                <div class="media align-items-center">
                                    <img src="images/semperitSusu.jpeg" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                    <div class="media-body">
                                        <a href="#" class="d-block text-dark">Semperit Susu</a>
                                        <small>
                                            <span class="text-muted">Description:</span> Traditional milk cookies with a soft, melt-in-your-mouth texture.
                                        </small>
                                    </div>
                                </div>
                            </td>
                            <td class="text-right font-weight-semibold align-middle p-4">RM 28.00</td>
                            <td class="align-middle p-4"><input type="number" class="form-control text-center quantity" value="1" min="1"></td>
                            <td class="text-right font-weight-semibold align-middle p-4 total">RM 28.00</td>
                            <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</td>
                        </tr>

                        <tr>
                            <td class="p-4">
                                <div class="media align-items-center">
                                    <img src="images/dahlia.jpg" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                    <div class="media-body">
                                        <a href="#" class="d-block text-dark">Dahlia Cookies</a>
                                        <small>
                                            <span class="text-muted">Description:</span> Delightful flower-shaped cookies with a rich buttery taste.
                                        </small>
                                    </div>
                                </div>
                            </td>
                            <td class="text-right font-weight-semibold align-middle p-4">RM 35.00</td>
                            <td class="align-middle p-4"><input type="number" class="form-control text-center quantity" value="1" min="1"></td>
                            <td class="text-right font-weight-semibold align-middle p-4 total">RM 35.00</td>
                            <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- / Shopping cart table -->

            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                <div class="mt-4">
                    <label class="text-muted font-weight-normal">Promocode</label>
                    <input type="text" placeholder="ABC" class="form-control">
                </div>
                <div class="d-flex">
                    <div class="text-right mt-4 mr-5">
                        <label class="text-muted font-weight-normal m-0">Discount</label>
                        <div class="text-large"><strong>RM 0</strong></div>
                    </div>
                    <div class="text-right mt-4">
                        <label class="text-muted font-weight-normal m-0">Total price</label>
                        <div class="text-large"><strong id="total-price">RM 127.00</strong></div>
                    </div>
                </div>
            </div>

            <div class="float-right">
                <a href="#" class="btn btn-lg btn-outline-primary md-btn-flat mt-2 mr-3">Continue Shopping</a>
                <a href="#" class="btn btn-lg btn-primary mt-2">Checkout</a>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Function to update the total price of a single row
        function updateRowTotal(row) {
            const price = parseFloat(row.querySelector('.text-right.font-weight-semibold.align-middle.p-4').innerText.replace('RM ', ''));
            const quantity = parseInt(row.querySelector('.quantity').value);
            const total = price * quantity;
            row.querySelector('.total').innerText = 'RM ' + total.toFixed(2);
            updateTotalPrice();
        }

        // Function to update the overall total price
        function updateTotalPrice() {
            const rows = document.querySelectorAll('tbody tr');
            let totalPrice = 0;
            rows.forEach(row => {
                const rowTotal = parseFloat(row.querySelector('.total').innerText.replace('RM ', ''));
                totalPrice += rowTotal;
            });
            document.getElementById('total-price').innerText = 'RM ' + totalPrice.toFixed(2);
        }

        // Add event listeners to quantity inputs
        const quantityInputs = document.querySelectorAll('.quantity');
        quantityInputs.forEach(input => {
            input.addEventListener('change', function() {
                const row = input.closest('tr');
                updateRowTotal(row);
            });
        });

        // Add event listeners to remove buttons
        const removeButtons = document.querySelectorAll('.close');
        removeButtons.forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                const row = button.closest('tr');
                row.remove();
                updateTotalPrice();
            });
        });
    });
</script>
</body>
</html>
