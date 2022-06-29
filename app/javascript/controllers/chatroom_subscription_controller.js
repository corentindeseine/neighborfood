
import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["messages", 'scrollableMessages']
  static values = { chatroomId: Number, messagesLength: Number }


  initialize() {
    console.log(this.messagesLengthValue)
    console.log(typeof this.messagesLengthValue)


  }
  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    const chatroom = document.querySelector('.chatroom-show-illust');
    const loadAnimChat = bodymovin.loadAnimation({
      wrapper: chatroom,
      animType: 'svg',
      loop: true,
      autoplay: false,
      path: 'https://assets1.lottiefiles.com/packages/lf20_zwwwgco2.json',
      preserveAspectRatio: 'xMidYMid meet',
    });

    if (this.messagesLengthValue === 0) {
      console.log('show illust');
      loadAnimChat.goToAndPlay(0, true);
    }



  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this._scrollDown()

  }
  resetForm(event) {
    const chatroom = document.querySelector('.chatroom-show-illust');
    if (this.messagesLengthValue > 0) {
      chatroom.classList.add("d-none");
    }
    event.target.reset()

  }
  disconnect() {
    this.channel.unsubscribe()
  }

  _scrollDown() {
    this.scrollableMessagesTarget.scrollTo(0, 9999999999)
  }
}
