<?php
    $balance = json_decode(file_get_contents('http://190.98.22.130/hackathon2015/checkBalance/5978781953'));

    print_r($balance);
?>