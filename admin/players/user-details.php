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
        <link rel="stylesheet" href="../../assets/css/prof.css">


        <!-- Admin Styling -->
        <!-- <link rel="stylesheet" href="../../assets/css/admin.css"> -->

        <title>Admin Section - Edit User</title>
        <link rel="icon" href= <?php echo BASE_URL . "/assets/logo/logo3.png" ?>>

    </head>

    <body>
        
    <?php include(ROOT_PATH . "/app/includes/adminHeader.php"); ?>

         <?php include(ROOT_PATH . "/app/includes/adminSidebar.php"); ?>
        <?php include(ROOT_PATH . "/app/helpers/formErrors.php"); ?>

                   
        <form action="index.php" method="post">
           <input type="hidden" name="id" value="<?php echo $id; ?>" >
        <div class="wrapper">
 
            <div class="left">
            <div class="users">
                <img src="<?php echo BASE_URL . '/assets/profile/' . $pic; ?>" 
                alt="user" width="75%" height="auto">
                <h1><i class="fas fa-at"></i> <?php echo $username; ?></h1>
                <p><?php echo $bio; ?></p>
            </div>   
            
                <div class="summoned">
                    <h4><i class="fa fa-gamepad"></i> Summoned on</h4>
                    <p><?php echo date('F j, Y', strtotime($created)); ?></p>
                </div>
            </div>
            <div class="right">

                    <div class="info">
                        <h3><i class="fas fa-info-circle"></i> Information</h3>
                        <div class="info_data">
                            <div class="data">
                                <h4>Email <i class="far fa-envelope"></i></h4>
                                <p><?php echo $email; ?> </p>
                            </div>
                            <div class="data">
                            <h4>Phone <i class="fas fa-phone"></i></h4>
                                <p><?php echo $phone; ?></p>
                        </div>
                        </div>
                    </div>

                    <div class="projects">
                        <h3><i class="fas fa-trophy"></i> Achievements</h3>
                        <div class="projects_data">
                            <div class="data">
                            <table>
                                <thead>
                                <th><i class="fas fa-certificate"></i> Events Joined:</th>
                                <th><i class="far fa-calendar-check"></i> Joined:</th>
                                <th><i class="fas fa-users-cog"></i>Category:</th>
                            </thead>
                                <?php 
                                $participants = "SELECT * FROM `payments` as p 
                                inner join users as u on p.user_id = u.id
                                inner JOIN events as e on e.id = p.product_id where u.id = $id; ";
                                    $res = mysqli_query($conn, $participants);
                                    if(mysqli_num_rows($res) > 0){
                                    $fetch = mysqli_fetch_all($res,MYSQLI_ASSOC);
                                    foreach ($fetch as $key => $participant){   ?>
                                <tr>
                                <td><p><?php echo $key + 1; ?>. <?php echo $participant['title']; ?></p></td>
                                <td><p><?php echo date('F j, Y', strtotime($participant['created'])); ?></p></td>
                                <td><p><?php echo $participant['category']; ?></p></td>
                                </tr>
                                <?php
                                                    } 
                                                }
                                            ?>
                            </table>
                            </div>
                        </div>
                    </div>
                    <div class="projects">
                    <div class="links">
                        <h3><i class="fas fa-user-plus"></i> Social Media</h3>
                        <ul>
                        <div class="data">
                        
                        <li><a href="https://steamcommunity.com/profiles/<?php echo $steam?>/"><i class="fab fa-steam"></i> <?php echo $steam?></a></li>
                        </div>  

                        <div class="data">
                        <li><a href="https://www.instagram.com/<?php echo $instagram?>/"><i class="fab fa-instagram"></i> <?php echo $instagram?></a></li>
                        </div>
                        
                        <div class="data">
                        <li style="width:160px;"><a href="#"><i class="fab fa-discord"></i> <?php echo $discord ?></a></li>
                        </div>
                    </ul>
                    </div>
                    </div>
                    <div class="edit">
                    <a href="<?php echo BASE_URL . '/admin/players/index.php' ?>" class="btn btn-big">Back</a>
                   </div>
                    </form>

               

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