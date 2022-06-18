// document.addEventListener("turbolinks:load", () => {
//   // button quantity increment
//   const increment = document.querySelector(".more");
//   const decrement = document.querySelector(".less");
//   let quantityValue = parseInt(document.querySelector(".meal_quantity").value);
//   increment.addEventListener("click", (event) => {
//     if (isNaN(quantityValue) || quantityValue < 0) {
//       quantityValue = 0;
//     }
//     quantityValue++;
//     document.querySelector(".meal_quantity").innerHTML = quantityValue;
//   });
//   decrement.addEventListener("click", (event) => {
//     if (isNaN(quantityValue) || quantityValue < 1) {
//       quantityValue = 1;
//     }
//     quantityValue--;
//     document.querySelector(".meal_quantity").innerHTML = quantityValue;
//   });
// })
