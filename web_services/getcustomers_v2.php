<?php

include("connection.php");

if($_POST) {
    $password = $_POST["password"];
    $mail = $_POST["mail"];
}

$getCustomerQuery = "SELECT * FROM customers WHERE password = '$password' AND mail = '$mail'";
$result = mysqli_query($connection, $getCustomerQuery);

$response = array();

if(mysqli_num_rows($result) > 0) {

    $response["customers"] = array();

    while($row = mysqli_fetch_assoc($result)) {

        $customer = array();

        $customer["customerId"] = $row["customerId"]; // customerId eklendi

        $customer["password"] = $row["password"];
        $customer["mail"] = $row["mail"];

        array_push($response["customers"], $customer);
    }

    print json_encode($response);

} else {
    echo "No Data Found";
}

mysqli_close($connection);

?>
