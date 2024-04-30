<?php

include("connection.php");

if($_POST) {
    $customerId = $_POST["customerId"];
}

$getCustomerQuery = "SELECT * FROM customers c INNER JOIN address a ON c.customerId = a.customerId
 WHERE c.customerId = $customerId";
$result = mysqli_query($connection, $getCustomerQuery);

$response = array();

if(mysqli_num_rows($result) > 0) {

    $response["customers"] = array();
    $response["address"] = array();

    while($row = mysqli_fetch_assoc($result)) {

        $customer = array();
        $product = array();

        $customer["customerId"] = $row["customerId"];
        $customer["firstName"] = $row["firstName"];
        $customer["lastName"] = $row["lastName"];
        $customer["username"] = $row["username"];
        $customer["password"] = $row["password"];
        $customer["mail"] = $row["mail"];
        $customer["addressId"] = $row["addressId"];
        $customer["orderId"] = $row["orderId"];

        $product["addressId"] = $row["addressId"];
        $product["customerId"] = $row["customerId"];
        $product["cityName"] = $row["cityName"];
        $product["district"] = $row["district"];
        $product["neighbourhood"] = $row["neighbourhood"];
        $product["street"] = $row["street"];
        $product["posCode"] = $row["posCode"];
        $product["numberOfHome"] = $row["numberOfHome"];
        $product["address"] = $row["address"];

        array_push($response["address"], $product);
        array_push($response["customers"], $customer);
    }

    echo json_encode($response);

} else {
    echo "No Data Found";
}

mysqli_close($connection);

?>
