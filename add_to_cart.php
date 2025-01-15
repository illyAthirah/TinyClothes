<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
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

// Get data from the request
$rawData = file_get_contents("php://input");
$data = json_decode($rawData, true);

// Validate input data
if (!isset($data['productId']) || !isset($data['quantity'])) {
    echo json_encode(["error" => "Invalid input data"]);
    exit;
}

$productId = $data['productId'];
$quantity = $data['quantity'];

// Check if the product already exists in the cart
$sql = "SELECT * FROM cart WHERE product_id = $productId";
$result = $conn->query($sql);

if ($result === false) {
    echo json_encode(["error" => "Failed to execute query: " . $conn->error]);
    exit;
}

if ($result->num_rows > 0) {
    // Update quantity if the product exists
    $row = $result->fetch_assoc();
    $newQuantity = $row['quantity'] + $quantity;
    $updateSql = "UPDATE cart SET quantity = $newQuantity WHERE cart_id = " . $row['cart_id'];
    if ($conn->query($updateSql) === TRUE) {
        echo json_encode(["message" => "Product quantity updated in cart"]);
    } else {
        echo json_encode(["error" => "Failed to update product quantity: " . $conn->error]);
    }
} else {
    // Insert new product into the cart
    $insertSql = "INSERT INTO cart (product_id, quantity) VALUES ($productId, $quantity)";
    if ($conn->query($insertSql) === TRUE) {
        echo json_encode(["message" => "Product added to cart"]);
    } else {
        echo json_encode(["error" => "Failed to add product to cart: " . $conn->error]);
    }
}

$conn->close();
?>