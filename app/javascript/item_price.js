window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(Math.floor(inputValue * 0.1));
  const Profit = document.getElementById("profit");
    Profit.innerHTML = (Math.floor(inputValue * 0.9));
    console.log(Math.floor(inputValue * 0.9));
})
});