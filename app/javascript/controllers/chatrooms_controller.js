import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chatroomContainer", 'scrollableMessages']

  show(event) {
    const url = event.currentTarget.dataset.url


    fetch(url, {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    })
      .then(response => response.json())
      .then((data) => {
        this.chatroomContainerTarget.innerHTML = data.html
        this.scrollToBottom()
      })
  }
  scrollToBottom() {
    this.scrollableMessagesTarget.scrollTo(0, 9999999999)
  }
}
