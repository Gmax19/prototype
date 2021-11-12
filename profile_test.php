<?php include("path.php"); ?>
<?php include(ROOT_PATH . "/app/controllers/users.php"); 
 require "app/database/connect.php";

?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Font Awesome -->
        <link rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
            integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
            crossorigin="anonymous">
            

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>


        <!-- Custom Styling -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/prof.css">
        <!-- page Styling -->
        <!-- <link rel="stylesheet" href="assets/css/page.css"> -->

        <title>Esport Brunei - Profile</title>
        <link rel="icon" href="assets/logo/logo3.png">

    </head>

    <body>
        
    <?php include(ROOT_PATH . "/app/includes/header.php"); ?>

        <!-- page Page Wrapper -->
        <div class="page-wrapper">

        <div class="sidebar-wrapper">
        <?php include(ROOT_PATH . "/app/includes/sidebar.php"); ?>
        </div>


                <!-- <div class="auth-content" align="center" >
                <?php include(ROOT_PATH . "/app/helpers/formErrors.php"); ?>
                <?php include(ROOT_PATH . "/app/includes/messages.php"); ?> 
                    <!-- <h1 class="page-title">Welcome to your profile</h1> -->
                </div> -->

                    <?php  
                    // to get user details by fetching user punya database table 

                    $id = $_SESSION['id'];
                    $email_check = "SELECT * FROM users WHERE id = '$id'";
                    $res = mysqli_query($conn, $email_check);
                    if(mysqli_num_rows($res) > 0){
                        $fetch = mysqli_fetch_assoc($res);
                        $pic = $fetch['pic'];
                        $phone_number = $fetch['phone_number'];
                        $created = $fetch['created_at'];
                    }
                    
                    ?>
                    
            <!-- // page Content -->
<div class="wrapper">
 
    <div class="left">
        <img src="<?php echo BASE_URL . '/assets/profile/' . $pic; ?>" 
        alt="user" width="75%" height="auto">
        <h4><?php echo $_SESSION['username']; ?></h4>
         <p><?php echo $_SESSION['bio']; ?></p>

        <!-- <div class="badges">
        <h3>Badges</h3>
        <img src="assets/profile_badge/b3.png" 
        alt="user" width="13%" height="auto">

        <img src="assets/profile_badge/b2.png" 
        alt="user" width="15%" height="auto">

        <img src="assets/profile_badge/b1.png" 
        alt="user" width="15%" height="auto">
        </div> -->
    </div>

    <div class="right">

        <div class="info">
            <h3>Information</h3>
            <div class="info_data">
                 <div class="data">
                    <h4>Email</h4>
                    <p><?php echo $_SESSION['email']; ?></p>
                 </div>
                 <div class="data">
                   <h4>Phone</h4>
                    <p><?php echo $phone_number; ?></p>
              </div>
            </div>
        </div>
      
      <div class="projects">
            <h3>Achievements</h3>
            <div class="projects_data">
                 <div class="data">
                    <h4>Events Joined:</h4>
                    <p>-</p>
                 </div>
                 <div class="data">
                   <h4>Summoned on</h4>
                    <p><?php echo date('F j, Y', strtotime($created)); ?></p>
              </div>
            </div>
        </div>
      
      <div class="links">
            <h3>Social Media</h3>
            <ul>
              <li><a href="https://steamcommunity.com/profiles/76561199032818871/"><i class="fab fa-steam"></i></a></li>
              <li><a href="Zylioth#1580"><i class="fab fa-discord"></i></a></li>
              <li><a href="https://www.instagram.com/_amir02/"><i class="fab fa-instagram"></i></a></li>
          </ul>
      </div>

      <div class="edit">
        <a href="<?php echo BASE_URL . '/edit-profile.php' ?>" class="btn">Edit Profile</a>
      </div>

      
    </div>
</div>

        
        <!-- // Page Wrapper -->
        </div>

        <?php include(ROOT_PATH . "/app/includes/footer.php"); ?>

        <!-- JQuery -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Ckeditor -->
        <script
            src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
        <!-- Custom Script -->
        <script src="assets/js/scripts.js"></script>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <script>
  /* Set the width of the side navigation to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }
  
  /* Set the width of the side navigation to 0 */
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }</script>

    </body>
    

</html>