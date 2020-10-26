function charge_profit_calc ()  {
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  // 販売手数料を表示する要素
  const charge = document.getElementById("add-tax-price");
  // 販売利益を表示する要素
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    charge.innerHTML = Math.floor(inputValue * 0.1)
    profit.innerHTML = inputValue - Math.floor(inputValue * 0.1)
  })
}
window.addEventListener('load', charge_profit_calc)