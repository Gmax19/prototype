<div id="mySidenav" class="sidenav">

<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

<div class="left-sidebar" align="center">



<!-- <a href="<?php echo BASE_URL . '/index.php' ?>" class="logo">
      <h1 class="logo-text"><span>Esport</span>Brunei</h1>
    </a> -->

    <ul>   
         <!-- Profile image display code  -->
    <?php if (isset($_SESSION['id'])){ ?>
        <?php  
                    $id = $_SESSION['id'];
                    $email_check = "SELECT * FROM users WHERE id = '$id'";
                    $res = mysqli_query($conn, $email_check);
                    if(mysqli_num_rows($res) > 0){
                        $fetch = mysqli_fetch_assoc($res);
                        $pic = $fetch['pic'];
                    } 
                    
        // Default image punya stuffz
        // $user_pic = "/assets/images/".$pic;
        // $default = "assets/uploads/avatar.png";    
        
        // if(file_exists($user_pic)){
        //     $profile_picture = $user_pic;
        // }else{
        //     $profile_picture =$default;

        // }
        
                    
        ?>
        <br>
        <!-- profile image display code -->
        <li><img src="<?php echo BASE_URL . '/assets/profile/' . $pic; ?>" class="rounded" style="border-radius:50%;max-width:50%;" alt="Profile Image"></li>
        <li ><h1><?php echo $_SESSION['username'];?></h1></li>
        
        <li><p><a href="<?php echo BASE_URL . '/profile.php' ?>" class="profile"><i class="fa fa-user"></i> My Profile</a></p></li>
        <li><p><a href="<?php echo BASE_URL . '/team-profile.php' ?>" class="TeamProfile"><i class="fa fa-users"></i> Team Management</a></p></li>
        <li><p><a href="<?php echo BASE_URL . '/team-registration.php' ?>" class="TeamRegistration"><i class="fa fa-user-plus"></i> Team Registration</a></p></li>
        <?php if($_SESSION['admin']  == 0 || $_SESSION['admin']  == 1 ){ ?>
        <li><p><a href="<?php echo BASE_URL . '/organiser-reg.php' ?>" class="organiserreg">Organiser Registration</a></p></li> 
        <?php } ?>
        <!-- IF ADMIN USER -->
        <?php if($_SESSION['admin']  == 1 ){ ?>
        <li><p><a href="<?php echo BASE_URL . '/admin/events/create.php' ?>" class="organiserreg">Create Event</a></p></li> 
        <?php }?>
        <!-- IF MODERATOR USER -->
        <?php if($_SESSION['admin']  == 2 ){ ?>
        <li><p><a href="<?php echo BASE_URL . '/moderator/events/create.php' ?>" class="organiserreg">Create Event</a></p></li> 
        <?php }?>
        <!-- IF ORGANISER USER -->
        <?php if($_SESSION['admin']  == 3 ){ ?>
        <li><p><a href="<?php echo BASE_URL . '/organiser/events/create.php' ?>" class="organiserreg">Create Event</a></p></li> 
        <?php }?>
        <li><p><a href= "contact.php" ><i class="fa fa-address-book"></i> Help </a></p></li>  
        <li><p><a href= <?php echo BASE_URL . "/bookmarkpost.php" ?> ><i class="far fa-bookmark"></i> Bookmark posts </a></p></li>  
        <li><p><a href="<?php echo BASE_URL . '/logout-user.php' ?>" class="logout">Logout</a></p></li>
        <?php } else { ?>
            
            <!-- IF GUEST USER PUNYA SIDEBAR -->
        <li><p><a href= "contact.php" ><i class="fa fa-address-book"></i> Help </a></p></li>
       <li><p><a href=" <?php echo BASE_URL . '/login-user.php' ?> "><i class="fa fa-user" ></i> login/Register</a></p></li>
       <?php } ?>
    <br>   
    <br>   
    
    <li>Esports Brunei © 2021</li>         
    </ul>
</div>

</div>