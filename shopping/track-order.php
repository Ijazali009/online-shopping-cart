<?php
session_start();
include_once 'includes/config.php';
$oid = intval($_GET['oid']);
?>

<script language="javascript" type="text/javascript">
function f2() {
    window.close();
}

function f3() {
    window.print(); 
}
</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Order Tracking Details</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
</head>
<body>

<div style="margin-left:50px;">
    <form name="updateticket" id="updateticket" method="post"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr height="50">
                <td colspan="2" class="fontkink2" style="padding-left:0px;">
                    <div class="fontpink2"> <b>Order Tracking Details !</b></div>
                </td>
            </tr>
            <tr height="30">
                <td class="fontkink1"><b>Order Id:</b></td>
                <td class="fontkink"><?php echo $oid; ?></td>
            </tr>
            
            <?php 
            // Fetching tracking history for this order
            $ret = mysqli_query($con, "SELECT * FROM ordertrackhistory WHERE orderId='$oid'");
            $num = mysqli_num_rows($ret);
            
            if ($num > 0) {
                while ($row = mysqli_fetch_array($ret)) {
            ?>
                    <tr height="20">
                        <td class="fontkink1"><b>At Date:</b></td>
                        <td class="fontkink"><?php echo $row['postingDate']; ?></td>
                    </tr>
                    <tr height="20">
                        <td class="fontkink1"><b>Status:</b></td>
                        <td class="fontkink"><?php echo $row['status']; ?></td>
                    </tr>
                    <tr height="20">
                        <td class="fontkink1"><b>Remark:</b></td>
                        <td class="fontkink"><?php echo $row['remark']; ?></td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    </tr>
            <?php 
                }
            } else {
            ?>
                <tr>
                    <td colspan="2">Order Not Processed Yet</td>
                </tr>
            <?php } 

            // Check if the order is delivered
            $st = 'Delivered';
            $rt = mysqli_query($con, "SELECT * FROM orders WHERE id='$oid'");
            while ($num = mysqli_fetch_array($rt)) {
                $currentSt = $num['orderStatus'];
            }
            if ($st == $currentSt) { ?>
                <tr><td colspan="2"><b>Product Delivered Successfully</b></td></tr>
                <!-- Return Request Button -->
                <tr>
                    <td colspan="2" align="center">
                        <form method="post">
                            <button type="submit" name="requestReturn" class="btn btn-warning">Request Return</button>
                        </form>
                    </td>
                </tr>
            <?php } ?>
        </table>
    </form>
</div>

<?php 
// Handling the return request
if (isset($_POST['requestReturn'])) {
    $returnRequestDate = date("Y-m-d H:i:s");
    
    // Insert the return request into the order tracking history
    $query = "INSERT INTO ordertrackhistory (orderId, postingDate, status, remark) 
              VALUES ('$oid', '$returnRequestDate', 'Return Requested', 'Return request submitted by user')";
    
    $result = mysqli_query($con, $query);

    if ($result) {
        // Update the order status to 'Return Requested'
        $updateStatusQuery = "UPDATE orders SET orderStatus = 'Return Requested' WHERE id = '$oid'";
        $updateResult = mysqli_query($con, $updateStatusQuery);

        if ($updateResult) {
            echo "<script>alert('Return request submitted successfully.'); window.location.href='order-tracking.php?oid=$oid';</script>";
        } else {
            echo "<script>alert('Error updating order status to Return Requested.');</script>";
        }
    } else {
        echo "<script>alert('Error submitting return request.');</script>";
    }
}
?>

</body>
</html>
