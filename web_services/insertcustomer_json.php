<?php

include("connection.php");

    if($_POST) {
        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $mail = $_POST["mail"];
    }

    /*
    
    $insertCustomerQuery = "INSERT INTO `customers` (`firstName`, `lastName`, `username`, `password`, `mail`) VALUES ('$firstName', '$lastName', '$username', '$password', '$mail')";
    $result = mysqli_query($connection, $insertCustomerQuery);

    if($result) {

        echo "customer saved successfuly";

    } else {
        echo "error";
    }


    mysqli_close($connection);
    */


    //Buradan assagisini ben yazdim. (QUERYDEKİ VALUE DEGERLERİ DEGİSTİ )

    //Json Decode
    $_firstName = json_decode($firstName);
    $_lastName = json_decode($lastName);
    $_userName = json_decode($username);
    $_password = json_decode($password);
    $_mail = json_decode($mail);

    $insertCustomerQuery = "INSERT INTO `customers` (`firstName`, `lastName`, `username`, `password`, `mail`) VALUES
     ('$_firstName', '$_lastName', '$_username', '$_password', '$_mail')";

    $result = mysqli_query($connection, $insertCustomerQuery);

    if($result) {
        echo "customer saved successfuly";
    } else {
        echo "error";
    }

    mysqli_close($connection);

?>