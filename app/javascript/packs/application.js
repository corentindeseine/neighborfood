// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()



import "controllers"
import "bootstrap"
import "packs/swiper"
import "@popperjs/core"
import "packs/home"
import "packs/chatroom"
require("packs/navbar")

document.addEventListener("turbolinks:load", () => {
  const illust1 = document.querySelector(".about-content-illustration-1")
  if (illust1) {
    const Ilust = bodymovin.loadAnimation({
      wrapper: illust1,
      animType: 'svg',
      loop: true,
      autoplay: true,
      path: 'https://assets10.lottiefiles.com/packages/lf20_hgbosl8c.json',
      preserveAspectRatio: 'xMidYMid meet',
    });
    Ilust.goToAndPlay(0, true);

  }
})
