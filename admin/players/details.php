<?php include("../../path.php"); ?>
<?php include(ROOT_PATH . "/app/controllers/users.php"); 
adminOnly();
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
        <link rel="stylesheet" href="../../assets/css/style.css">

        <!-- Admin Styling -->
        <link rel="stylesheet" href="../../assets/css/admin.css">

        <title>Admin Section - Edit User</title>
        <link rel="icon" href= <?php echo BASE_URL . "/assets/logo/logo3.png" ?>>

    </head>

    <body>
        
    <?php include(ROOT_PATH . "/app/includes/adminHeader.php"); ?>

        <!-- Admin Page Wrapper -->
        <div class="admin-wrapper">

         <?php include(ROOT_PATH . "/app/includes/adminSidebar.php"); ?>


            <!-- Admin Content -->
            <div class="admin-content">
                <div class="button-group">
                    <!-- <a href="create.php" class="btn btn-big">Add User</a>
                    <a href="index.php" class="btn btn-big">Manage Users</a> -->
                </div>


                <div class="content">

                    <h2 class="page-title">User Details</h2>

                    <?php include(ROOT_PATH . "/app/helpers/formErrors.php"); ?>

                    <form action="index.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $id; ?>" >
                        <div>
                            <h1>NOTE * CHANGE DESIGN</h1>
                        </div>
                        <div>
                            <h1>Username : <?php echo $username; ?> </h1>
                        </div>
                        <div>
                        <h1>Email : <?php echo $email; ?> </h1>
                        </div>
                        <div>
                        <h1>Phone Number : +673 <?php echo $user['phone_number']; ?> </h1>
                        </div>
                        <div>
                            <h1>User's Bio : </h1>
                            <p><?php echo $user['bio']; ?></p>
                            <img src="<?php echo BASE_URL . '/assets/profile/' . $user['pic']; ?>" height="100" width="100" /> 
                            <p> <?php echo date('F j, Y', strtotime($user['created_at'])); ?></p>
                        </div>
                        <div align="center">
                            <button class="btn btn-big"><a href="<?php echo BASE_URL . '/admin/players/index.php'; ?>">back</a></button>
                        </div>
                    </form>

                </div>

            </div>
            <!-- // Admin Content -->

        </div>
        <!-- // Page Wrapper -->



        <!-- JQuery -->
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Ckeditor -->
        <script
            src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
        <!-- Custom Script -->
        <script src="../../assets/js/scripts.js"></script>

    </body>

</html>