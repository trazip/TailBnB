// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "stylesheets/application"
import 'alpinejs'

import { initFlatpickr } from '../plugins/init_flatpickr';
import { initPlaces } from '../plugins/init_places';
// import { loadDynamicHeadlineText } from '../plugins/typed_headline';
import { hideModal } from '../plugins/init_hidemodal';
import { showModal } from '../plugins/init_showmodal';

document.addEventListener('turbolinks:load', () => {
  // loadDynamicHeadlineText();
  initFlatpickr();
  initPlaces();
  showModal();
  hideModal();
});
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
