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
require("packs/navbar")
require("packs/quantity_button")
import Swiper, { Navigation } from 'swiper'
Swiper.use([Navigation])
import 'swiper/swiper-bundle.min.css'


document.addEventListener("turbolinks:load", () => {

  const swiper = new Swiper(".swiper-container", {
    slidesPerView: 5,
    slidesPerGroup: 2,
    spaceBetween: 10,
    centeredSlides: true,
    grabCursor: true,
    loop: false,

    // responsive
    breakpoints: {
      // when window width is >= 600px
      300: {
        slidesPerView: 1,
        slidesPerGroup: 1,
        grabCursor: true,
        loop: false,
        centeredSlides: true

      },
      // when window width is >= 900px
      700: {
        slidesPerView: 2,
        slidesPerGroup: 1,
        grabCursor: true,
        loop: false,
        centeredSlides: false

      },
      // when window width is >= 1200px
      900: {
        slidesPerView: 3,
        slidesPerGroup: 2,
        grabCursor: true,
        loop: false,
        spaceBetween: 5,
        centeredSlides: false
      },

      // when window width is >= 1500px
      1500: {
        slidesPerView: 5,
        slidesPerGroup: 2,
        grabCursor: true,
        loop: false,
        spaceBetween: 5,
        centeredSlides: false
      },
    }
  });
  console.log(swiper)

  swiper.on('slideChange', function () {
    console.log(document.querySelector('.swiper-slide-active'));
  });
})
