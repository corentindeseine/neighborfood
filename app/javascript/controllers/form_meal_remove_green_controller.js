import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    this.inputTargets.forEach((input) => {
      input.classList.remove('is-valid')
    })
  }
}
