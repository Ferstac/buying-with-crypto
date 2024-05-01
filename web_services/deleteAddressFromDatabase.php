<?php

include("connection.php");

if($_POST) {
    $addressId = $_POST["addressId"];
}

$deleteAddressQuery = "DELETE FROM address WHERE addressId = '$addressId'";
$result = mysqli_query($connection, $deleteAddressQuery);

$response = array();

if($result) {
    $response["message"] = "Address deleted successfully";
} else {
    $response["message"] = "Failed to delete address";
}

print json_encode($response);

mysqli_close($connection);

?>
