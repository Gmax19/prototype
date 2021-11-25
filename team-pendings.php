<?php include("path.php"); ?>
<?php include(ROOT_PATH . "/app/controllers/team-listing.php");
UsersOnly();
$userId = $_SESSION['id'];
$teamCheck = "SELECT * FROM team_members WHERE member_id = '$userId'";
                        $res = mysqli_query($conn, $teamCheck);
                        if(mysqli_num_rows($res) < 1){
                        header("Location: team-registration.php");
                        exit;
                        }

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

        <!-- Admin Styling -->

        <title>Esport Brunei - Profile</title>
        <link rel="icon" href="assets/logo/logo3.png">

    </head>

    <body>
        
    <?php include(ROOT_PATH . "/app/includes/header.php"); ?>

        <!-- Admin Page Wrapper -->
        <div class="sidebar-wrapper">

        <?php include(ROOT_PATH . "/app/includes/sidebar.php"); ?>

                <div class="auth-content" align="center">

                    

                    <h2 class="page-title">Team Management List : </h2>
                    

                    <div class="main-content">
                        
                        <?php 

                        //According to this, this should only take member id inside of team_members table that is equal to the session id of the user
                        // $teamId = "SELECT * FROM team_members WHERE member_id = $userId";

                        $teamId = "SELECT * FROM team_members INNER JOIN teams ON team_members.team_id = teams.id where team_members.member_id = $userId";
                        $res = mysqli_query($conn, $teamId);
                        if(mysqli_num_rows($res) > 0){
                        // $teamNumber = "Team"; 
                        $fetch = mysqli_fetch_all($res,MYSQLI_ASSOC);
                        foreach ($fetch as $teams){
                            //I forgotten that it requires double quotation marks I am so sorry
                         echo "<br><h2><a href=\"team_no.php?id=".$teams['team_id']."\">TEAM ".$teams['team_name']."</a></h2>";
                        }
                    }
                            ?>
                        
                        </div>
                    </div>
                </div>

            </div>
            <!-- // Admin Content -->

        </div>
        <!-- // Page Wrapper -->
        <?php include(ROOT_PATH . "/app/includes/footer.php"); ?>



        <!-- JQuery -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Ckeditor -->
        <script
            src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
        <!-- Custom Script -->
        <script src="assets/js/scripts.js"></script>

    </body>
</html>