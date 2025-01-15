<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart">
  <div class="offcanvas-header justify-content-center">
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div class="order-md-last">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-primary">Your cart </span>
        <span class="badge bg-primary rounded-circle pt-2" id="cartCount">0</span>
      </h4>
      <ul class="list-group mb-3" id="cartItemsList">
        <!-- Cart items will be dynamically inserted here -->
      </ul>
      <li class="list-group-item d-flex justify-content-between">
        <span class="fw-bold">Total (MYR)</span>
        <strong id="cartTotal">RM0.00</strong>
      </li>
      <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
    </div>
  </div>
</div>