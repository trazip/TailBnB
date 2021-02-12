import Typed from 'typed.js';

const loadDynamicHeadlineText = () => {
  new Typed('#headline-typed-text', {
    strings: ["Bali", "Roma", "Paris", "London", "Berlin",],
    typeSpeed: 100,
    backSpeed: 100,
    backDelay: 1000,
    startDelay: 1000,
    loop: true,
  });
}

export { loadDynamicHeadlineText };
