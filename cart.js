// Function to fetch cart items from the backend
async function fetchCartItems() {
    try {
      const response = await fetch("fetch_cart.php");
      if (!response.ok) {
        throw new Error("Failed to fetch cart items");
      }
      const cartItems = await response.json();
      renderCartItems(cartItems);
    } catch (error) {
      console.error("Error fetching cart items:", error);
    }
  }
  
  // Function to render cart items in the offcanvas sidebar
  function renderCartItems(cartItems) {
    const cartItemsList = document.getElementById("cartItemsList");
    const cartCount = document.getElementById("cartCount");
    const cartTotal = document.getElementById("cartTotal");
  
    // Clear existing items
    cartItemsList.innerHTML = "";
  
    // Calculate total and render items
    let total = 0;
    cartItems.forEach((item) => {
      total += item.price * item.quantity;
      const listItem = document.createElement("li");
      listItem.className = "list-group-item d-flex justify-content-between lh-sm";
      listItem.innerHTML = `
        <div>
          <h6 class="my-0">${item.name}</h6>
          <small class="text-body-secondary">Quantity: ${item.quantity}</small>
        </div>
        <span class="text-body-secondary">RM${(item.price * item.quantity).toFixed(2)}</span>
      `;
      cartItemsList.appendChild(listItem);
    });
  
    // Update cart count and total
    cartCount.textContent = cartItems.length;
    cartTotal.textContent = `RM${total.toFixed(2)}`;
  }
  
  // Function to add a product to the cart
  async function addToCart(productId, variantId, quantity) {
    try {
      const response = await fetch("add_to_cart.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          productId,
          variantId,
          quantity,
        }),
      });
  
      const result = await response.json();
      console.log(result.message || result.error);
  
      // Refresh the cart sidebar
      fetchCartItems();
    } catch (error) {
      console.error("Error adding to cart:", error);
    }
  }
  
  // Fetch cart items when the offcanvas cart is opened
  document.getElementById("offcanvasCart").addEventListener("show.bs.offcanvas", fetchCartItems);
  
  // Add event listeners to "Add to Cart" buttons
  document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".add-to-cart").forEach((button) => {
      button.addEventListener("click", () => {
        const productId = button.getAttribute("data-product-id");
        const variantId = button.getAttribute("data-variant-id") || null;
        const quantity = 1; // Default quantity
        addToCart(productId, variantId, quantity);
      });
    });
  });