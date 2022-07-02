document.addEventListener("turbolinks:load", () => {
  const tl = gsap.timeline();
  const tlnav = gsap.timeline();
  const menu = document.querySelector(".menu ");
  const menu1 = document.querySelector("#menu1");
  const menu2 = document.querySelector("#menu2 ");
  const menu3 = document.querySelector("#menu3 ");
  const menu4 = document.querySelector("#menu4 ");

  //   // Fonction qui fait avancer les bulles d'icons de la navbar

  function move(id, position, color) {

    const current_position = position;
    tl.set('#bgBubble', { left: current_position });
    tl.to("#bgBubble", { duration: 0.15, bottom: "-30px", ease: "ease-out" }, 0)
      .to("#bubble1", { duration: 0.1, y: "120%", boxShadow: 'none', ease: "ease-out", }, 0)
      .to("#bubble2", { duration: 0.1, y: "120%", boxShadow: 'none', ease: "ease-out", }, 0)
      .to("#bubble3", { duration: 0.1, y: "120%", boxShadow: 'none', ease: "ease-out", }, 0)
      .to("#bubble4", { duration: 0.1, y: "120%", boxShadow: 'none', ease: "ease-out", }, 0)
      .to(".icon", { duration: 0.05, opacity: 0, ease: "ease-out", }, 0)
      .to("#bgBubble", { duration: 0.2, left: position, ease: "ease-in-out" }, 0.1)
      .to("#bgBubble", { duration: 0.30, bottom: "-50px", ease: "ease-out" }, '-=0.2')
      .to(`#bubble${id}`, { duration: 0.15, y: "0%", opacity: 1, boxShadow: '0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24)', ease: "ease-out" }, '-=0.1')
      .to(`#bubble${id}> span`, { duration: 0.15, y: "0%", opacity: 0.7, ease: "ease-out" }, '-=0.1')
      .to("#navbarContainer", { duration: 0.3, backgroundColor: color, ease: "ease-in-out" }, 0)
      .to("#bg", { duration: 0.8, backgroundColor: color, ease: "ease-in-out" }, 0)
      .to("#bgBubble", { duration: 0.3, backgroundColor: color, ease: "ease-in-out" }, 0)

  }

  //   // Déclenchement de la fonction move() lorsque l'on clique sur un des liens de la navbar


  if (window.location.pathname.includes("/cookers")) {
    move('1', '12.4%', '#FF6161');
  }

  //   // menu2.addEventListener("click", (event) => {
  //   //   move('2', '150px', '#FF6161');
  //   // })
  if (window.location.pathname.includes("/orders")) {
    move('2', '37.5%', '#FF6161');

  }

  //   // menu3.addEventListener("click", (event) => {
  //   //   move('3', '250px', '#FF6161');
  //   // })
  if (window.location.pathname.includes("/chatrooms")) {
    move('3', '62.3%', '#FF6161');
  }

  if (menu4) {
    tl.set('.navigation li', { x: "-125%" });
    menu4.addEventListener("click", (event) => {
      move('4', '87.5%', '#FF6161');
      tlnav.to(menu, 0.3, { opacity: 1, ease: Back.easeOut })
        .staggerTo('.navigation li', 0.4, { x: 0, ease: Sine.easeOut }, 0.2, 0.5)

    })
  }

})
