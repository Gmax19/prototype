<?php 
include("../../path.php");
require (ROOT_PATH . "/app/database/connect.php");
include(ROOT_PATH . "/app/database/db.php");
include(ROOT_PATH . "/app/helpers/middleware.php");


$participants = "SELECT * FROM `payments` as p 
inner join users as u on p.user_id = u.id
inner JOIN events as e on e.id = p.product_id
";

$res = mysqli_query($conn, $participants);
if(mysqli_num_rows($res) > 0){
    // $teamNumber = "Team"; 
    $fetch = mysqli_fetch_all($res,MYSQLI_ASSOC);
    foreach ($fetch as $teams){ ?>

        <a href="partlist.php?=<?php echo $teams['id'] ?>" >events</a>
        <h2>Active Events : <?php echo $teams['title']; ?></h2>

   <!-- content for listing the participants of each events  -->

<?php   
    }
}

?>