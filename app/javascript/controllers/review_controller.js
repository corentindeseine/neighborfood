import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];

  launchReview() {
    let modalController = this.application.getControllerForElementAndIdentifier(
      this.modalTarget,
      "modal");
    modalController.open();
  }
}
