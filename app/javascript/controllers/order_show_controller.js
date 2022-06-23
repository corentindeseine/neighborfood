import { Controller } from "@hotwired/stimulus"
import { event } from "jquery";

export default class extends Controller {
  static targets = ["button", "loader"]

  initialize() {

  }

  connect() {
    console.log("hello stimulus")


  }

  play(e) {
    e.preventDefault()
    const loadAnim = bodymovin.loadAnimation({
      wrapper: this.loaderTarget,
      animType: 'svg',
      loop: true,
      autoplay: true,
      path: 'https://assets2.lottiefiles.com/packages/lf20_UGvCSC/loading_animation.json',
      preserveAspectRatio: 'xMidYMid meet',

    });
    let target = e.target.href;

    this.loaderTarget.classList.add("is-active")
    loadAnim.goToAndPlay(0, true);
    setTimeout(() => {
      this.loaderTarget.classList.remove("is-active")
      window.location.href = target;
    }, 4000);


  }
}
