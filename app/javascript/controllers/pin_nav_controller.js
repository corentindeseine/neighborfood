import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'


export default class extends Controller {

  navigateTo(event) {
    const swiperInstance = document.querySelector('.cooker-show-cards').swiper
    const indexDeLaSlide = swiperInstance.slides.findIndex(e => e.dataset.userId === event.target.dataset.userId)
    swiperInstance.slideTo(indexDeLaSlide)

    swiperInstance.on('slideChange', (e) => {
      console.log(e)
    })
  }


}
