window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",()=> {
    const inputValue = priceInput.value;
    console.log(inputValue);
    
    const addTaxDom = document.getElementById("add-tax-price");
    console.log(inputValue);
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    
    const salesProfit = document.getElementById("profit");
    console.log(inputValue);
    salesProfit.innerHTML = Math.floor(inputValue - (inputValue/10));
  })
})