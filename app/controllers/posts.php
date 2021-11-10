<?php

include(ROOT_PATH . "/app/database/db.php");
include(ROOT_PATH . "/app/helpers/middleware.php");
include(ROOT_PATH . "/app/helpers/validatePost.php");

$table = 'posts';

$topics = selectAll('topics');
$posts = selectAll($table);

//for bookmarked content TO BE USED
$bookmarks = selectAll($table , array('bookmark' => 1));



$errors = array();
$id = "";
$title = "";
$body = "";
$topic_id = "";
$published = "";
$bookmark = "";


// to get the id of posts

if (isset($_GET['id'])) {
    $post = selectOne($table, ['id' => $_GET['id']]);

    $id = $post['id'];
    $title = $post['title'];
    $body = $post['body'];
    $topic_id = $post['topic_id'];
    $published = $post['published'];
    $bookmark = $post['bookmark'];
}

//to delete posts created
if (isset($_GET['delete_id'])) {
    adminOnly();
    $count = delete($table, $_GET['delete_id']);
    $_SESSION['message'] = "Post deleted successfully";
    $_SESSION['type'] = "success";
    if ($_SESSION['admin'] == 1) {
        header('location: ' . BASE_URL . '/admin/posts/index.php'); 
    } else if($_SESSION['admin'] == 2) {
        header('location: ' . BASE_URL . '/moderator/posts/index.php');
    } else {
        header('location: ' . BASE_URL . '/index.php');
    }
    exit();
}

//to publish or unpublish posts created
if (isset($_GET['published']) && isset($_GET['p_id'])) {
    adminOnly();
    $published = $_GET['published'];
    $p_id = $_GET['p_id'];
    $count = update($table, $p_id, ['published' => $published]);
    $_SESSION['message'] = "Post published state changed!";
    $_SESSION['type'] = "success";
    if ($_SESSION['admin'] == 1) {
        header('location: ' . BASE_URL . '/admin/posts/index.php'); 
    } else if($_SESSION['admin'] == 2) {
        header('location: ' . BASE_URL . '/moderator/posts/index.php');
    } else {
        header('location: ' . BASE_URL . '/index.php');
    }
    exit();
}
 

//to add a new posts
if (isset($_POST['add-post'])) {
    adminOnly();
    $errors = validatePost($_POST);

    if (!empty($_FILES['image']['name'])) {
        $image_name = time() . '_' . $_FILES['image']['name'];
        $destination = ROOT_PATH . "/assets/images/" . $image_name;

        $result = move_uploaded_file($_FILES['image']['tmp_name'], $destination);

        if ($result) {
           $_POST['image'] = $image_name;
        } else {
            array_push($errors, "Failed to upload image");
        }
    } else {
       array_push($errors, "Post image required");
    }
    if (count($errors) == 0) {
        unset($_POST['add-post']);
        $_POST['user_id'] = $_SESSION['id'];
        $_POST['published'] = isset($_POST['published']) ? 1 : 0;
        $_POST['body'] = htmlentities($_POST['body']);
    
        $post_id = create($table, $_POST);
        $_SESSION['message'] = "Post created successfully";
        $_SESSION['type'] = "success";
        if ($_SESSION['admin'] == 1) {
            header('location: ' . BASE_URL . '/admin/posts/index.php'); 
        } else if($_SESSION['admin'] == 2)  {
            header('location: ' . BASE_URL . '/moderator/posts/index.php'); }
    } else {
        $title = $_POST['title'];
        $body = $_POST['body'];
        $topic_id = $_POST['topic_id'];
        $published = isset($_POST['published']) ? 1 : 0;
    }
}

//to edit/update a created post
if (isset($_POST['update-post'])) {
    adminOnly();
    $errors = validatePost($_POST);

    if (!empty($_FILES['image']['name'])) {
        $image_name = time() . '_' . $_FILES['image']['name'];
        $destination = ROOT_PATH . "/assets/images/" . $image_name;

        $result = move_uploaded_file($_FILES['image']['tmp_name'], $destination);

        if ($result) {
           $_POST['image'] = $image_name;
        } else {
            array_push($errors, "Failed to upload image");
        }
    } else {
       array_push($errors, "Post image required");
    }

    if (count($errors) == 0) {
        $id = $_POST['id'];
        unset($_POST['update-post'], $_POST['id']);
        $_POST['user_id'] = $_SESSION['id'];
        $_POST['published'] = isset($_POST['published']) ? 1 : 0;
        $_POST['body'] = htmlentities($_POST['body']);
    
        $post_id = update($table, $id, $_POST);
        $_SESSION['message'] = "Post updated successfully";
        $_SESSION['type'] = "success";
        if ($_SESSION['admin'] == 1) {
            header('location: ' . BASE_URL . '/admin/posts/index.php'); 
        } else if($_SESSION['admin'] == 2) {
            header('location: ' . BASE_URL . '/moderator/posts/index.php');
        } else {
        $title = $_POST['title'];
        $body = $_POST['body'];
        $topic_id = $_POST['topic_id'];
        $published = isset($_POST['published']) ? 1 : 0;
    }
    }

}


    //to bookmark a post TO BE USED
if (isset($_GET['bookmark']) && isset($_GET['p_id'])) {
    $bookmark = $_GET['bookmark'];
    $p_id = $_GET['p_id'];
    $count = update($table, $p_id, ['bookmark' => $bookmark]);
    $_SESSION['message'] = "This post is now listed in your bookmark post lists !";
    $_SESSION['type'] = "success";
    if ($_SESSION['admin'] == 1) {
        header('location: ' . BASE_URL . '/bookmarkpost.php'); 
    } else if($_SESSION['admin'] == 2) {
        header('location: ' . BASE_URL . '/bookmarkpost.php');
    } else {
        header('location: ' . BASE_URL . '/bookmarkpost.php');
    }
    exit();
}


 