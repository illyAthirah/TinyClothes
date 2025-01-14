document.getElementById('size').addEventListener('change', function () {
    const selectedOption = this.options[this.selectedIndex];
    const price = selectedOption.getAttribute('data-price');
    document.querySelector('.price').textContent = 'RM' + parseFloat(price).toFixed(2);
});
