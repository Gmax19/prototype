
<?php include("path.php"); ?>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Esport Brunei - Help Page</title>
  <link rel="icon" href= <?php echo BASE_URL . "/assets/logo/logo3.png" ?>>

  <link rel="stylesheet" href="ContactUs/style.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>

</head>
<body >

  <div  class="wrapper">
    <header>Send us a Message if there are any or give us a call at <br>
      <a href="tel:7258975" ><i class="fas fa-phone"></i> +673 7258975</span> </a>
</header>
    <form action="#">
      <div class="dbl-field">
        <div class="field">
          <input type="text" name="name" placeholder="Enter your name">
          <i class='fas fa-user'></i>
        </div>
        <div class="field">
          <input type="text" name="email" placeholder="Enter your email">
          <i class='fas fa-envelope'></i>
        </div>
      </div>
      <div class="dbl-field">
        <div class="field">
          <input type="text" name="phone" placeholder="Enter your phone">
          <i class='fas fa-phone-alt'></i>
        </div>
        <div class="field">
          <input type="text" name="website" placeholder="Enter your website (optional)">
          <i class='fas fa-globe'></i>
        </div>
      </div>
      <div class="message">
        <textarea placeholder="Write your message" name="message"></textarea>
        <i class="material-icons">message</i>
      </div>
      <div class="button-area">
        <button type="submit">Send Message</button>
        <span></span>
      </div>
      <div class="button-area">
      <button><a href="<?php echo BASE_URL . '/index.php' ?>"> cancel </a> </button>
        <span></span>
      </div>
    </form>
    
  </div>

  <script src="ContactUs/script.js"></script>

</body>
</html>
