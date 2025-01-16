<?php
require '../config.php';

// Helper function to update user details (in `userController.php`)
function updateUserDetails($user_id, $name, $email, $address, $phone) {
    global $pdo;  // Use PDO connection

    try {
        $query = "UPDATE users SET name = ?, email = ?, address = ?, phone = ? WHERE id = ?";
        $stmt = $pdo->prepare($query);  // Prepare query using PDO
        return $stmt->execute([$name, $email, $address, $phone, $user_id]);  // Execute with parameters as an array
    } catch (PDOException $e) {
        error_log("Error updating user details: " . $e->getMessage());
        return false;
    }
}

function getUserDetails($userId) {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$userId]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getOrderHistory($user_id) {
    global $pdo;

    // Prepare the SQL query to get the user's orders
    $sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC"; // Use an existing column for identifying the user
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$user_id]);

    // Fetch all the orders
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getUserLoyaltyPoints($user_id) {
    global $pdo;
    $stmt = $pdo->prepare("SELECT loyalty_points FROM users WHERE id = :user_id");
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result['loyalty_points'] ?? 0; // Default to 0 if no loyalty points found
}
?>
