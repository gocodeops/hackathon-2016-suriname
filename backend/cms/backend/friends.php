<?php
    // get all friends
    $app->get('/friends/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM v_friends WHERE user_id='$id'", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // get all favo friends
    $app->get('/favorites/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM v_friends WHERE user_id='$id' AND favorite='1'", $connection);
        print_r(json_encode($operation->fetch_all()));
    });    

    // get all non favo friends
    $app->get('/nonfavorites/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM v_friends WHERE user_id='$id' AND favorite='0'", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // get username by number
    $app->get('/friend/:number/', function($number){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT users.id FROM users WHERE number=$number", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // make a new friend
    $app->post('/friend/', function(){
        require 'prepare.php';
        // post data
        $user_id      = htmlspecialchars($_POST['user_id']);
        $friend_id      = htmlspecialchars($_POST['friend_id']);

        // operation
        $operation = new Operation("INSERT INTO friends (user_id, friend_id) VALUES ('$user_id', '$friend_id')", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // TODO mark as favorite
?>