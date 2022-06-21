import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'


export default class extends Controller {

  navigateTo(event) {
    const swiperInstance = document.querySelector('.cooker-show-cards').swiper
    const indexDeLaSlide = swiperInstance.slides.findIndex(e => e.dataset.userId === event.target.dataset.userId)
    swiperInstance.slideTo(indexDeLaSlide)

    swiperInstance.on('slideChange', (e) => {
      const instanceId = document.querySelector('.swiper-slide-active').dataset.userId
      const marker = document.querySelector("[data-user-id='328']")
    })
  }
}
