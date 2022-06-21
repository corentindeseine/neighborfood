
import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", 'scrollableMessages']

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this._scrollDown()
  }
  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    this.channel.unsubscribe()
  }

  _scrollDown() {
    this.scrollableMessagesTarget.scrollTo(0, 9999999999)
  }
}
