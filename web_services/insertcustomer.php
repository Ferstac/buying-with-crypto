<?php

include("connection.php");

    if($_GET) {
        $username = $_POST["username"];
        $password = $_POST["password"];
        $taxScore = $_POST["taxScore"];
        $userStatus = $_POST["userStatus"];
        $totalMoney = $_POST["totalMoney"];
    }



    $_username = mysqli_real_escape_string($connection, $username);
    $_password = md5($password);
    $_taxScore = mysqli_real_escape_string($connection, $taxScore);
    $_userStatus = mysqli_real_escape_string($connection, $userStatus);
    $_totalMoney = mysqli_real_escape_string($connection, $totalMoney);


    $insertUserQuery = "INSERT INTO `users` (`username`, `password`, `taxScore`, `userStatus`, `totalMoney`) VALUES ('$_username', '$_password', '$_taxScore', '$_userStatus', '$_totalMoney')";
    $result = mysqli_query($connection, $insertUserQuery);

    if($result) {

        echo "user saved successfuly";

    } else {
        echo "error";
    }


    mysqli_close($connection);





?>