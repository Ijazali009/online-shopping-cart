<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
{   
    header('location:login.php');
}
else{
    if (isset($_POST['submit'])) {
        // Update order's payment method in the database
        $payMethod = mysqli_real_escape_string($con, $_POST['paymethod']);
        mysqli_query($con, "UPDATE orders SET paymentMethod='$payMethod' WHERE userId='".$_SESSION['id']."' AND paymentMethod IS NULL");
        unset($_SESSION['cart']);
        echo "<script>alert('Thank you! Your payment was successful.');</script>";
        header('location:order-history.php');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">
    <title>| Payment Method</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/red.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="shortcut icon" href="assets/images/icon.png">
    <script src="assets/js/jquery-1.11.1.min.js"></script>
</head>
<body class="cnt-home">
    
<header class="header-style-1">
    <?php include('includes/top-header.php');?>
    <?php include('includes/main-header.php');?>
    <?php include('includes/menu-bar.php');?>
</header>

<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="home.html">Home</a></li>
                <li class='active'>Payment Method</li>
            </ul>
        </div>
    </div>
</div>

<div class="body-content outer-top-bd">
    <div class="container">
        <div class="checkout-box faq-page inner-bottom-sm">
            <div class="row">
                <div class="col-md-12">
                    <h2>Choose Payment Method</h2>
                    <div class="panel-group checkout-steps" id="accordion">
                        <div class="panel panel-default checkout-step-01">
                            <div class="panel-heading">
                                <h4 class="unicase-checkout-title">
                                    <a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
                                     Select your Payment Method
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <form name="payment" method="post" id="paymentForm" onsubmit="return validateForm()">
                                        <input type="radio" name="paymethod" value="VPP" checked="checked" onclick="showPaymentFields('vpp')"> VPP 
                                        <input type="radio" name="paymethod" value="Cheque" onclick="showPaymentFields('cheque')"> Cheque 
                                        <input type="radio" name="paymethod" value="CreditCard" onclick="showPaymentFields('credit')"> Debit / Credit card <br /><br />

                                        <div id="vppFields" style="display:none;">
                                            <!-- VPP specific fields -->
                                            <label for="vpp-details">VPP Details:</label>
                                            <input type="text" name="vpp-details" id="vpp-details" placeholder="Enter VPP details" class="form-control"><br />
                                        </div>

                                        <div id="chequeFields" style="display:none;">
                                            <!-- Cheque specific fields -->
                                            <label for="cheque-number">Cheque Number:</label>
                                            <input type="text" name="cheque-number" id="cheque-number" placeholder="Enter cheque number" class="form-control"><br />
                                        </div>

                                        <div id="creditFields" style="display:none;">
                                            <!-- Credit Card specific fields -->
                                            <label for="card-number">Card Number:</label>
                                            <input type="text" name="card-number" id="card-number" placeholder="Enter card number" class="form-control"><br />
                                            <label for="expiry-date">Expiry Date:</label>
                                            <input type="text" name="expiry-date" id="expiry-date" placeholder="MM/YY" class="form-control"><br />
                                        </div>

                                        <input type="submit" value="Submit" name="submit" class="btn btn-primary">
                                    </form>      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('includes/brands-slider.php'); ?>
    </div>
</div>

<?php include('includes/footer.php');?>

<script src="assets/js/bootstrap.min.js"></script>

<script>
    // Show payment-specific fields based on the selected payment method
    function showPaymentFields(method) {
        document.getElementById('vppFields').style.display = (method == 'vpp') ? 'block' : 'none';
        document.getElementById('chequeFields').style.display = (method == 'cheque') ? 'block' : 'none';
        document.getElementById('creditFields').style.display = (method == 'credit') ? 'block' : 'none';
    }

    // Validate form fields
    function validateForm() {
        var method = document.querySelector('input[name="paymethod"]:checked').value;
        var isValid = true;

        // Validation for VPP
        if (method === 'VPP') {
            var vppDetails = document.getElementById('vpp-details').value.trim();
            if (vppDetails === "") {
                alert("Please enter VPP details.");
                isValid = false;
            }
        } 
        // Validation for Cheque
        else if (method === 'Cheque') {
            var chequeNumber = document.getElementById('cheque-number').value.trim();
            if (chequeNumber === "" || isNaN(chequeNumber)) {
                alert("Please enter a valid 6-digit cheque number.");
                isValid = false;
            }
            else if (chequeNumber.length != 6) {
                alert("Cheque number should be exactly 6 digits.");
                isValid = false;
            }
        } 
        // Validation for Credit Card
        else if (method === 'CreditCard') {
            var cardNumber = document.getElementById('card-number').value.trim();
            var expiryDate = document.getElementById('expiry-date').value.trim();
            if (cardNumber === "" || isNaN(cardNumber) || cardNumber.length != 16) {
                alert("Please enter a valid 16-digit card number.");
                isValid = false;
            }
            if (expiryDate === "" || !/\d{2}\/\d{2}/.test(expiryDate)) {
                alert("Please enter a valid expiry date in MM/YY format.");
                isValid = false;
            }
        }

        return isValid;
    }
</script>

</body>
</html>
<?php } ?>
