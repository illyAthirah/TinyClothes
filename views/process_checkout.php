<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit();
}

// Database connection
$host = "localhost";
$db = "tiny_clothes";
$user = "root";
$pass = "";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$name = $_POST['name'];
$email = $_POST['email'];
$address = $_POST['address'];
$paymentMethod = $_POST['paymentMethod'];

// Insert order into database
$sql = "INSERT INTO orders (name, email, address, payment_method) VALUES ('$name', '$email', '$address', '$paymentMethod')";
if ($conn->query($sql) === TRUE) {
    $orderId = $conn->insert_id;

    // Fetch cart items
    $sql = "SELECT * FROM cart";
    $result = $conn->query($sql);

    // Insert order items into database
    while ($row = $result->fetch_assoc()) {
        $productId = $row['product_id'];
        $quantity = $row['quantity'];
        $price = $row['price'];
        $sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($orderId, $productId, $quantity, $price)";
        $conn->query($sql);
    }

    // Clear cart
    $conn->query("DELETE FROM cart");

    echo "Order placed successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>