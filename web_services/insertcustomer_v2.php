<?php

include("connection.php");

if ($_POST) {
    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $mail = $_POST["mail"];
    $cityName = $_POST["cityName"];
    $district = $_POST["district"];
    $neighbourhood = $_POST["neighbourhood"];
    $street = $_POST["street"];
    $posCode = $_POST["posCode"];
    $numberOfHome = $_POST["numberOfHome"];
    $address = $_POST["address"];

    // Customers tablosuna veri ekleme
    $insertCustomerQuery = "INSERT INTO `customers` (`firstName`, `lastName`, `username`, `password`, `mail`) VALUES ('$firstName', '$lastName', '$username', '$password', '$mail')";
    $resultCustomer = mysqli_query($connection, $insertCustomerQuery);

    if ($resultCustomer) {
        // Eklenen customersId'yi al
        $customerId = mysqli_insert_id($connection);

        // Address tablosuna veri ekleme
        $insertAddressQuery = "INSERT INTO `address` (`customerId`, `cityName`, `district`, `neighbourhood`, `street`, `posCode`, `numberOfHome`, `address`) VALUES ('$customerId', '$cityName', '$district', '$neighbourhood', '$street', '$posCode', '$numberOfHome', '$address')";
        $resultAddress = mysqli_query($connection, $insertAddressQuery);

        if ($resultAddress) {
            echo "customer and address saved successfully";
        } else {
            echo "error while adding address";
        }
    } else {
        echo "error while adding customer";
    }
}

mysqli_close($connection);

?>
