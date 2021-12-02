<?php 



if (isset($_SESSION['id'])) {
    if ($post['category'] == 'Solo'){
        if ($userid['u'] < 1 && isset($_SESSION['id'])) {
            echo 'register here';
        } else if ($total_ikut['p'] >= $post['participant_limit']){
            echo 'event full';
        } else {
            echo 'you already register';
        }
    }
} else {
    echo 'pls login';
}





?>