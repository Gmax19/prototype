<?php include("../../path.php"); ?>
<?php include(ROOT_PATH . "/app/controllers/events.php");
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
        <link href="https://fonts.googleapis.com/css?family=Candal|Lora"
            rel="stylesheet">

        <!-- Custom Styling -->
        <link rel="stylesheet" href="../../assets/css/style.css">

        <!-- moderator Styling -->
        <link rel="stylesheet" href="../../assets/css/moderator.css">

        <title>Organiser Section - Manage Events</title>
        <link rel="icon" href= <?php echo BASE_URL . "/assets/logo/logo3.png" ?>>

    </head>

    <body>
        
    <?php include(ROOT_PATH . "/app/includes/organiserHeader.php"); ?>

        <!-- moderator Page Wrapper -->
        <div class="moderator-wrapper">

        <?php include(ROOT_PATH . "/app/includes/organiserSidebar.php"); ?>


            <!-- moderator Content -->
            <div class="moderator-content">
                <div class="button-group">
                    <a href="create.php" class="btn btn-big">Add Events</a>
                    <a href="index.php" class="btn btn-big">Manage Events</a>
                </div>


                <div class="content">

                    <h2 class="page-title">Manage Events</h2>

                    <?php include(ROOT_PATH . "/app/includes/messages.php"); ?>

                    <table>
                        <thead>
                            <th>SN</th>
                            <th>Title</th>
                            <th>Organiser</th>
                            <th colspan="3">Action</th>
                        </thead>
                        <tbody>
                            <?php foreach ($Adminevents as $key => $post): ?>
                                <tr>
                                    <td><?php echo $key + 1; ?></td>
                                    <td><?php echo $post['title'] ?></td>
                                    <td><?php echo $post['username'] ?></td>
                                    <td><a href="edit.php?id=<?php echo $post['eventid']; ?>" class="edit">edit</a></td>
                                    <td><a href="edit.php?delete_id=<?php echo $post['eventid']; ?>" class="delete">delete</a></td>
                                    <td><a href="partlist.php?id=<?php echo $post['eventid']; ?>" >participants</a></td>

                                    <!-- <?php if ($post['published']): ?>
                                        <td><a href="edit.php?published=0&p_id=<?php echo $post['id'] ?>" class="unpublish">unpublish</a></td>
                                    <?php else: ?>
                                        <td><a href="edit.php?published=1&p_id=<?php echo $post['id'] ?>" class="publish">publish</a></td>
                                    <?php endif; ?> -->
                                    
                                </tr>
                            <?php endforeach; ?>

                        </tbody>
                    </table>

                </div>

            </div>
            <!-- // moderator Content -->

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