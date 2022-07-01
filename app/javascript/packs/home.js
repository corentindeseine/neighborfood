document.addEventListener("turbolinks:load", () => {


  const tlhome = gsap.timeline();
  const légumes = gsap.utils.toArray('.légumes');
  const textAnim = gsap.timeline();





  textAnim.to(".loader-order-h1", { text: "Préparation en cours", ease: "power1.in", duration: 2, repeat: 10, yoyo: true, repeatDelay: 0.4 })

  tlhome.from(légumes, {

    transformOrigin: "50% 50%",

    scale: 0,

    opacity: 0,

    stagger: 0.1,

  })


  const randomX = random(1, 10);
  const randomY = random(1, 10);
  const randomDelay = random(0, 1);
  const randomTime = random(3, 5);
  const randomTime2 = random(5, 10);
  const randomAngle = random(-10, 10);


  légumes.forEach(leg => {
    gsap.set(leg, {
      x: randomX(-1),
      y: randomX(1),
      rotation: randomAngle(-1)
    });

    moveX(leg, 1);
    moveY(leg, -1);
    rotate(leg, 1);
  });

  function rotate(target, direction) {

    gsap.to(target, randomTime2(), {
      rotation: randomAngle(direction),
      // delay: randomDelay(),
      ease: Sine.easeInOut,
      onComplete: rotate,
      onCompleteParams: [target, direction * -1]
    });
  }

  function moveX(target, direction) {

    gsap.to(target, randomTime(), {
      x: randomX(direction),
      ease: Sine.easeInOut,
      onComplete: moveX,
      onCompleteParams: [target, direction * -1]
    });
  }

  function moveY(target, direction) {

    gsap.to(target, randomTime(), {
      y: randomY(direction),
      ease: Sine.easeInOut,
      onComplete: moveY,
      onCompleteParams: [target, direction * -1]
    });
  }

  function random(min, max) {
    const delta = max - min;
    return (direction = 1) => (min + delta * Math.random()) * direction;
  }



})
