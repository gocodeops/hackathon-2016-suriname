<?php

    // get all users info
    $app->get('/users/', function(){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM users WHERE usertype = 1", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // get user info by id
    $app->get('/user/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM users WHERE id = '$id'", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // make a new user
    $app->post('/user/', function(){
        require 'prepare.php';

        // post values
        $usertype = htmlspecialchars($_POST['usertype']);
        $firstname = htmlspecialchars($_POST['firstname']);
        $lastname = htmlspecialchars($_POST['lastname']);
        $number = htmlspecialchars($_POST['number']);
        $pin = htmlspecialchars($_POST['pin']);

        // operation
        $operation = new Operation("INSERT INTO users (usertype, firstname, lastname, number, pin) VALUES('$usertype', '$firstname', '$lastname', '$number', '$pin')", $connection);
        print_r(json_encode($operation->process()));
    });

    // login
    $app->post('/login/', function(){
        require 'prepare.php';
        // post values
        $number = htmlspecialchars($_POST['number']);
        $pin = htmlspecialchars($_POST['pin']);

        // operation
        $operation = new Operation("SELECT * FROM users WHERE number = '$number' AND pin = '$pin'", $connection);
        print_r(json_encode($operation->fetch_one()));
    });

?>