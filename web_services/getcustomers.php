<?php

    include("connection.php");

    $getCustomerQuery = "SELECT * FROM customers";
    $result = mysqli_query($connection, $getCustomerQuery);

    $response = array();

    if(mysqli_num_rows($result) > 0) {

        $response["customers"] = array();

        while($row = mysqli_fetch_assoc($result)) {

            $customer = array();

            $customer["customerId"] = $row["customerId"];
            $customer["firstName"] = $row["firstName"];
            $customer["lastName"] = $row["lastName"];
            $customer["userName"] = $row["userName"];
            $customer["password"] = $row["password"];
            $customer["mail"] = $row["mail"];
            $customer["addressId"] = $row["addressId"];
            $customer["orderId"] = $row["orderId"];

            array_push($response["customers"], $customer);
        }

        print json_encode($response);

    } else {
        echo "No Data Found";
    }

    mysqli_close($connection);


?>