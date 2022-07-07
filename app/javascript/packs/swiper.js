import Swiper, { Navigation } from 'swiper'
Swiper.use([Navigation])
import 'swiper/swiper-bundle.min.css'


document.addEventListener("turbolinks:load", () => {

  const swiper = new Swiper(".swiper-container", {
    slidesPerView: 1.1,
    slidesPerGroup: 1,
    spaceBetween: -40,
    centeredSlides: false,
    grabCursor: true,
    loop: false,

    // responsive
    breakpoints: {
      // when window width is >= 600px
      300: {
        slidesPerView: 1.1,
        slidesPerGroup: 1,
        spaceBetween: -40,
        grabCursor: true,
        loop: false,
        centeredSlides: false

      }


    }
  });

  new Swiper(".swiper-container-map", {
    slidesPerView: 1,
    slidesPerGroup: 1,
    centeredSlides: false,
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
        centeredSlides: false

      },
      // when window width is >= 900px

    }
  });
})
