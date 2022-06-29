import { Controller } from "@hotwired/stimulus"



export default class extends Controller {

  navigateTo(event) {
    const swiperInstance = document.querySelector('.swiper-container-map').swiper
    const indexDeLaSlide = swiperInstance.slides.findIndex(e => e.dataset.userId === event.target.dataset.userId)
    swiperInstance.slideTo(indexDeLaSlide)
  }
}
