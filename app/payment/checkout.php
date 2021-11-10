<?php include("../../path.php"); ?>

<?php 
// Redirect to the home page if id parameter not found in URL 
if(empty($_GET['id'])){ 
    header("Location: index.php"); 
} 
 
// Include and initialize database class 
include_once 'DB.class.php'; 
$db = new DB; 
 
// Include and initialize paypal class 
include_once 'PaypalExpress.class.php'; 
$paypal = new PaypalExpress; 
 
// Get product ID from URL 
$productID = $_GET['id']; 

// $eventID = $_GET['id']; 
 
// Get product details 
$conditions = array( 
    'where' => array('id' => $productID), 
    'return_type' => 'single' 
); 
// $conditions = array( 
//     'where' => array('id' => $productID), 
//     'return_type' => 'single' 
// ); 

$productData = $db->getRows('products', $conditions);

// $eventData = $db->getRows('events', $conditions); 

 
// Redirect to the home page if product not found 
if(empty($productData)){ 
    header("Location: index.php"); 
} 
?>

<div class="item">
    <!-- Product details -->
    <img src="<?php echo BASE_URL . '/assets/images/' . $productData['image']; ?>"/>
    <p>Name: <?php echo $productData['title']; ?></p>
    <p>Price: <?php echo $productData['s_price']; ?></p>
    
    <!-- Checkout button -->
    <div id="paypal-button"></div>
</div>

<!--
JavaScript code to render PayPal checkout button and execute payment
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- paypal checkout JS lib -->
  <script src="https://www.paypalobjects.com/api/checkout.js"></script>


  <title>Document</title>
</head>
<body>
<div id="paypal-button"></div>
</body>
</html>

<script>
paypal.Button.render({
    // Configure environment
    env: '<?php echo $paypal->paypalEnv; ?>',
    client: {
        sandbox: '<?php echo $paypal->paypalClientID; ?>',
        production: '<?php echo $paypal->paypalClientID; ?>'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
        size: 'small',
        color: 'gold',
        shape: 'pill',
    },
    // Set up a payment
    payment: function (data, actions) {
        return actions.payment.create({
            transactions: [{
                amount: {
                    total: '<?php echo $productData['s_price']; ?>',
                    currency: '<?php echo $productData['currency']; ?>'
                }
            }]
      });
    },
    // Execute the payment
    onAuthorize: function (data, actions) {
        return actions.payment.execute()
        .then(function () {
            // Show a confirmation message to the buyer
            //window.alert('Thank you for your purchase!');
            
            // Redirect to the payment process page
            window.location = "process.php?paymentID="+data.paymentID+"&token="+data.paymentToken+"&payerID="+data.payerID+"&pid=<?php echo $productData['id']; ?>";
        });
    }
}, '#paypal-button');
</script>