<?php
$servername = "localhost";
$username = "root";
$password = "";
$databasename = "animalshelter";

// Create a connection
$conn = mysqli_connect($servername, $username, $password, $databasename);

// Check the connection
if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}
?>
