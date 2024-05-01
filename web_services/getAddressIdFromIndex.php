<?php

include("connection.php");

if($_POST) {
    $cityName = $_POST["cityName"];
    $district = $_POST["district"];
    $neighbourhood = $_POST["neighbourhood"];
    $street = $_POST["street"];
    $posCode = $_POST["posCode"];
    $numberOfHome = $_POST["numberOfHome"];
    $address = $_POST["address"];
}

$getAddressQuery = "SELECT * FROM address WHERE cityName = '$cityName' AND district = '$district' AND neighbourhood = '$neighbourhood' AND street = '$street' AND posCode = '$posCode' AND numberOfHome = '$numberOfHome' AND address = '$address'";
$result = mysqli_query($connection, $getAddressQuery);

$response = array();

if(mysqli_num_rows($result) > 0) {

    $response["address"] = array();

    while($row = mysqli_fetch_assoc($result)) {

        $address = array();

        $address["addressId"] = $row["addressId"]; // addressId eklendi
        $address["customerId"] = $row["customerId"]; // addressId eklendi

        $address["cityName"] = $row["cityName"];
        $address["district"] = $row["district"];
        $address["neighbourhood"] = $row["neighbourhood"];
        $address["street"] = $row["street"];
        $address["posCode"] = $row["posCode"];
        $address["numberOfHome"] = $row["numberOfHome"];
        $address["address"] = $row["address"];

        array_push($response["address"], $address);
    }

    echo json_encode($response);

} else {
    echo "No Data Found";
}

mysqli_close($connection);

?>