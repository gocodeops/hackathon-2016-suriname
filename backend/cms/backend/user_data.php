<?php
    
    // post data
    $app->post('/userdata/', function(){
        require 'prepare.php';
        
        // post data
        $carriername      = htmlspecialchars($_POST['carriername']);
        $phonenumber      = htmlspecialchars($_POST['phonenumber']);
        $networktype      = htmlspecialchars($_POST['networktype']);
        $latitude      = htmlspecialchars($_POST['latitude']);
        $longtitude      = htmlspecialchars($_POST['longtitude']);

        // operation
        $operation = new Operation("INSERT INTO user_data (carriername, phonenumber, networktype, latitude, longitude) VALUES ('$carriername', '$phonenumber', '$networktype', '$latitude', '$longtitude')", $connection);
        print_r(json_encode($operation->process()));
    });

    // get all data
    $app->get('/userdata/', function(){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM user_data", $connection);
        print_r(json_encode($operation->fetch_all()));
    });
?>