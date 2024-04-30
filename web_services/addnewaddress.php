<?php

include("connection.php");

if($_POST) {
    $customerId = $_POST["customerId"];
    $cityName = $_POST["cityName"];
    $district = $_POST["district"];
    $neighbourhood = $_POST["neighbourhood"];
    $street = $_POST["street"];
    $posCode = $_POST["posCode"];
    $numberOfHome = $_POST["numberOfHome"];
    $address = $_POST["address"];
}

$insertAddressQuery = "INSERT INTO address (customerId, cityName, district, neighbourhood, street, posCode, numberOfHome, address) VALUES ('$customerId', '$cityName', '$district', '$neighbourhood', '$street', '$posCode', '$numberOfHome', '$address')";
$result = mysqli_query($connection, $insertAddressQuery);

$response = array();

if($result) {
    $response["message"] = "Address added successfully";
} else {
    $response["message"] = "Failed to add address";
}

print json_encode($response);

mysqli_close($connection);

?>