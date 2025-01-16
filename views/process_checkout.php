<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.html");
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
$sql = "INSERT INTO orders (name, email, address, payment_method, user_id) VALUES ('$name', '$email', '$address', '$paymentMethod', '{$_SESSION['user_id']}')";
if ($conn->query($sql) === TRUE) {
    $orderId = $conn->insert_id;

    // Fetch cart items
    $sql = "SELECT * FROM cart WHERE user_id = {$_SESSION['user_id']}";
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
    $conn->query("DELETE FROM cart WHERE user_id = {$_SESSION['user_id']}");

    $message = "Order placed successfully!";
} else {
    $message = "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container my-5">
        <h2 class="mb-4">Checkout</h2>
        <div class="alert alert-info">
            <?php echo $message; ?>
        </div>
        <a href="../index.php" class="btn btn-primary">Back to Home</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>