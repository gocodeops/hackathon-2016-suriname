<?php
    // new transactions
    $app->post('/transaction/', function(){
        require 'prepare.php';

        // post data
        $sender     = htmlspecialchars($_POST['sender']);
        $receiver   = htmlspecialchars($_POST['receiver']);
        $amount     = htmlspecialchars($_POST['amount']);

        // operation
        $operation = new Operation("INSERT INTO transactions (sender_id, receiver_id, amount) VALUES ('$sender', '$receiver', '$amount')", $connection);
        print_r(json_encode($operation->process()));
    });

    // get all transactions
    $app->get('/transactions/', function(){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM v_transactions", $connection);
        print_r(json_encode($operation->fetch_all()));
    });

    // get all transactions by sender
    $app->get('/transaction/:id/', function($id){
        require 'prepare.php';

        // operation
        $operation = new Operation("SELECT * FROM v_transactions WHERE sender_id='$id' OR receiver_id='$id'", $connection);
        print_r(json_encode($operation->fetch_all()));
    });
?>