<?php

include("connection.php");

    if($_POST) {
        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $mail = $_POST["mail"];
    }

    $insertCustomerQuery = "INSERT INTO `customers` (`firstName`, `lastName`, `username`, `password`, `mail`) VALUES ('$firstName', '$lastName', '$username', '$password', '$mail')";
    $result = mysqli_query($connection, $insertCustomerQuery);

    if($result) {

        echo "customer saved successfuly";

    } else {
        echo "error";
    }


    mysqli_close($connection);





?>