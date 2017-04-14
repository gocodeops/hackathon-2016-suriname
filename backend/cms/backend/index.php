<?php
    require 'Slim/Slim.php';
    header('Access-Control-Allow-Origin:*');
    \Slim\Slim::registerAutoloader();

    $app = new \Slim\Slim();

    // requirements
    require 'users.php';
    require 'friends.php';
    require 'company.php';
    require 'transactions.php';
    require 'user_data.php';

    $app->run();
?>