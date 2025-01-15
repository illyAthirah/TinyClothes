<?php

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

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Checkout - Tiny Clothes</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>

<body>
  <div class="container my-5">
    <h2 class="mb-4">Checkout</h2>
    <form action="process_checkout.php" method="POST">
      <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" name="name" required>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
      <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
      </div>
      <div class="mb-3">
        <label for="paymentMethod" class="form-label">Payment Method</label>
        <select class="form-select" id="paymentMethod" name="paymentMethod" required>
          <option value="credit_card">Credit Card</option>
          <option value="paypal">PayPal</option>
          <option value="bank_transfer">Bank Transfer</option>
        </select>
      </div>
      <h4 class="mb-3">Your Cart</h4>
      <ul class="list-group mb-3">
        <?php foreach ($cartItems as $item): ?>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0"><?php echo htmlspecialchars($item['name']); ?></h6>
              <small class="text-body-secondary">Quantity: <?php echo $item['quantity']; ?></small>
            </div>
            <span class="text-body-secondary">RM<?php echo number_format($item['price'] * $item['quantity'], 2); ?></span>
          </li>
        <?php endforeach; ?>
        <li class="list-group-item d-flex justify-content-between">
          <span class="fw-bold">Total (MYR)</span>
          <strong>
            RM<?php echo number_format(array_sum(array_map(function($item) { return $item['price'] * $item['quantity']; }, $cartItems)), 2); ?>
          </strong>
        </li>
      </ul>
      <button type="submit" class="btn btn-primary">Place Order</button>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>