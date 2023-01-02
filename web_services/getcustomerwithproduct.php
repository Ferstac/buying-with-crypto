<?php

include("connection.php");

    if($_GET) {
        $customerId = $_GET("customerId");
    }

    $getCustomerQuery = "SELECT * FROM customers c INNER JOIN orders o ON c.customerId = o.customerId
     INNER JOIN products p ON o.productId = p.productId
     WHERE customerId = $customerId";
    $result = mysqli_query($connection, $getCustomerQuery);

    $response = array();

    if(mysqli_num_rows($result) > 0) {

        $response["customers"] = array();
        $response["products"] = array();

        while($row = mysqli_fetch_assoc($result)) {

            $customer = array();
            $product = array();

            $customer["customerId"] = $row["customerId"];
            $customer["firstName"] = $row["firstName"];
            $customer["lastName"] = $row["lastName"];
            $customer["userName"] = $row["userName"];
            $customer["password"] = $row["password"];
            $customer["mail"] = $row["mail"];
            $customer["addressId"] = $row["addressId"];
            $customer["orderId"] = $row["orderId"];

            $product["productId"] = $row["productId"];
            $product["productName"] = $row["productName"];
            $product["categoryId"] = $row["categoryId"];
            $product["photoId"] = $row["photoId"];
            $product["price"] = $row["price"];

            array_push($response["products"], $product);
            array_push($response["customers"], $customer);
        }

        print json_encode($response);

    } else {
        echo "No Data Found";
    }

    mysqli_close($connection);



















?>