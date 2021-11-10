<?php 
if(!empty($_GET['id'])){ 
    // Include and initialize database class 
    include_once 'DB.class.php'; 
    $db = new DB; 
     
    // Get payment details 
    $conditions = array( 
        'where' => array('id' => $_GET['id']), 
        'return_type' => 'single' 
    ); 
    $paymentData = $db->getRows('payments', $conditions); 
     
    // Get product details 
    $conditions = array( 
        'where' => array('id' => $paymentData['product_id']), 
        'return_type' => 'single' 
    ); 
    $eventData = $db->getRows('events', $conditions); 
}else{ 
    header("Location: index.php"); 
} 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esport Brunei - Payment Status</title>
</head>
<body>
    <div>
        <div class="status">
    <?php if(!empty($paymentData)){ ?>
        <h1 class="success">Your Payment has been Successful!</h1>
        <h4>Payment Information</h4>
        <p><b>TXN ID:</b> <?php echo $paymentData['txn_id']; ?></p>
        <p><b>Paid Amount:</b> <?php echo $paymentData['payment_gross'].' '.$paymentData['currency_code']; ?></p>
        <p><b>Payment Status:</b> <?php echo $paymentData['payment_status']; ?></p>
        <p><b>Payment Date:</b> <?php echo $paymentData['created']; ?></p>
        <p><b>Payer Name:</b> <?php echo $paymentData['payer_name']; ?></p>
        <p><b>Payer Email:</b> <?php echo $paymentData['payer_email']; ?></p>
		<!-- <p><b>User ID:</b> <?php echo $paymentData['user_id']; ?></p>  -->
        <h4>Product Information</h4>
        <p><b>Name:</b> <?php echo $eventData['title']; ?></p>
        <p><b>Price:</b> <?php echo $eventData['s_price'].' '.$eventData['currency']; ?></p>
    <?php }else{ ?>
        <h1 class="error">Your Payment has Failed</h1>
    <?php } ?>
        </div>
        <a href="../../index.php" class="btn-link">Back to Home</a>
</div>
</body>
</html>
