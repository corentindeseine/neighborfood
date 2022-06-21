import { Controller } from "@hotwired/stimulus"
import { event } from "jquery";

export default class extends Controller {
  static targets = ["quantity","available","less","more","add","price"]

  initialize() {
    this.quantityTarget.innerHTML = 0
  }

  connect() {
    console.log("hello stimulus")
  }


  increment() {
    this.lessTarget.style.color = '#ff6161'
    console.log(parseInt(this.priceTarget.innerHTML)*parseInt(this.quantityTarget.innerHTML))

    if (this.quantityTarget.innerHTML < parseInt(this.availableTarget.innerHTML)) {
      this.quantityTarget.innerHTML++
      this.addTarget.style.backgroundColor = '#ff6161'


      if (parseInt(this.quantityTarget.innerHTML) === parseInt(this.availableTarget.innerHTML)) {
        this.moreTarget.style.color = 'rgb(180,180,180)';
      }
    }
  }

  decrement() {
    console.log(this.quantityTarget)
    this.moreTarget.style.color = '#ff6161'
    if (this.quantityTarget.innerHTML > 0) {
      this.quantityTarget.innerHTML--;
      if (parseInt(this.quantityTarget.innerHTML) <= 0) {
        this.lessTarget.style.color = 'rgb(180,180,180)';
        this.addTarget.style.backgroundColor = 'rgb(180,180,180';
      }
    }
  }
}


// if (this.quantityTarget.innerHTML > 0) {
//   this.quantityTarget.innerHTML--
// } elsif (this.quantityTarget.innerHTML === 0) {
//   console.log(this.element);
// } else {

// }
