
import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", 'scrollableMessages']

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    if (this.messagesTarget.children.length <= 0) {
      const chatroom = document.querySelector('.chatroom-show-messages');
      const loadAnimChat = bodymovin.loadAnimation({
        wrapper: chatroom,
        animType: 'svg',
        loop: true,
        autoplay: true,
        path: 'https://assets1.lottiefiles.com/packages/lf20_zwwwgco2.json',
        preserveAspectRatio: 'xMidYMid meet',

      });

      loadAnimChat.goToAndPlay(0, true);
    } else {
      this.messagesTarget.classList.remove('chatroom-show-messages-illust')
    }

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
