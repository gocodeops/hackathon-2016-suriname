<?php
    // get all companies info
    $app->get('/companies/', function(){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM users WHERE usertype = 2", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // get company info by id
    $app->get('/company/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM users WHERE id = '$id' AND usertype = 2", $connection);
        print_r(json_encode($operation->fetch_all()));
    });
?>