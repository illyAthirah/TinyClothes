<?php
require 'controllers/homepageController.php';

$featuredProducts = getFeaturedProducts();
$promotions = getPromotions();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Homepage</title>
<script src="https://static.elfsight.com/platform/platform.js" async></script>
<div class="elfsight-app-da400e6c-fbc1-4c20-8250-13a48c22fe4a" data-elfsight-app-lazy></div>

</head>
<body>
    <h1>Featured Products</h1>
    <ul>
        <?php foreach ($featuredProducts as $product): ?>
            <li><?= $product['name'] ?> - RM<?= $product['price'] ?></li>
        <?php endforeach; ?>
    </ul>

    <h1>Current Promotions</h1>
    <ul>
        <?php foreach ($promotions as $promo): ?>
            <li><?= $promo['title'] ?> - <?= $promo['description'] ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
