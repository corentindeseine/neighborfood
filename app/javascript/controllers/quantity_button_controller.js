import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["quantity","available","less","more","add","price","input"]
  static values = { quantity: Number }


  initialize() {
    this.quantityTargets.forEach((quantity) => {
      quantity.innerHTML = this.quantityValue
    })

    this.unitPrice = parseFloat(this.priceTarget.innerHTML)
    this.priceTarget.innerHTML  = (this.unitPrice * this.quantityValue).toFixed(2) + "€"
  }

  connect() {
    this.inputTarget.value = this.quantityValue
    console.log(this.quantityTargets)
  }

  increment() {
    this.lessTarget.style.color = '#ff6161'
    if (this.quantityTarget.innerHTML < parseInt(this.availableTarget.innerHTML)) {
      this.quantityTarget.innerHTML++
      this.priceTarget.innerHTML = (this.unitPrice * (parseFloat(this.quantityTarget.innerHTML))).toFixed(2) + "€";

      if (parseInt(this.quantityTarget.innerHTML) === parseInt(this.availableTarget.innerHTML)) {
        this.moreTarget.style.color = 'rgb(180,180,180)';
      }
    }
    this.inputTarget.value = this.quantityTarget.innerHTML
  }

  decrement() {
    this.moreTarget.style.color = '#ff6161'
    if (this.quantityTarget.innerHTML > 1) {
      this.quantityTarget.innerHTML--;
      this.priceTarget.innerHTML = (this.unitPrice * (parseFloat(this.quantityTarget.innerHTML))).toFixed(2) + "€";
      if (parseInt(this.quantityTarget.innerHTML) <= 1) {
        this.lessTarget.style.color = 'rgb(180,180,180)';
      }
    }
    this.inputTarget.value = this.quantityTarget.innerHTML
  }
}
