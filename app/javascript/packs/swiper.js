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
