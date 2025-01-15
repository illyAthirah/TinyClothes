<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

// Database connection
$host = "localhost";
$db = "tiny_clothes";
$user = "root";
$pass = "";


$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch cart items
$sql = "SELECT c.cart_id, p.name, p.price, c.quantity 
        FROM cart c 
        JOIN products p ON c.product_id = p.product_id";
$result = $conn->query($sql);

$cartItems = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $cartItems[] = $row;
    }
}

echo json_encode($cartItems);

$conn->close();
?>