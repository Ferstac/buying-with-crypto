<?php

include("connection.php");

    if($_GET) {
        $firstName = $_GET["firstName"];
        $firstName = $_GET["lastName"];
        $username = $_GET["username"];
        $password = $_GET["password"];
        $mail = $_GET["mail"];
        $addressId = $_GET["addressId"];
        $orderId = $_GET["orderId"];
    }

    $insertCustomerQuery = "INSERT INTO `customers` (`firstName`, `lastName`, `username`, `password`, `mail`, `addressId`, `orderId`) VALUES ('$firstName', '$lastName', '$username', '$pasword', '$mail', '$addressId', '$orderId')";
    $result = mysqli_query($connection, $insertCustomerQuery);

    if($result) {

        echo "customer saved successfuly";

    } else {
        echo "error";
    }


    mysqli_close($connection);





?>