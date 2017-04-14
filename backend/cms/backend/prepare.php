<?php
    require 'autoload.php';

    $connect = new DatabaseConnector("localhost", "codeops_hackathon2016", "root", "");
    $connection = $connect->connect();
?>