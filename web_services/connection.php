<?php

$url = "104.247.165.3";
$username = "ilhamsad_root_ferstac";
$password = "!}zfD^NZM-=u^G7*L%Pf*:gpx2C{bP_JL-`.TR";
$database = "ilhamsad_buyingwithcrypto";

$connection = mysqli_connect($url, $username, $password, $database);

if($connection) {
    echo "connected successfuly";
} else {
    echo "error";
}

mysqli_set_charset($connection, "utf8");


?>

